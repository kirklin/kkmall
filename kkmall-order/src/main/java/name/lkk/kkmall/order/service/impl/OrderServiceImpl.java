package name.lkk.kkmall.order.service.impl;

import com.alibaba.fastjson.TypeReference;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import name.lkk.common.enume.OrderStatusEnum;
import name.lkk.common.exception.NotStockException;
import name.lkk.common.to.mq.OrderTo;
import name.lkk.common.to.mq.SecKillOrderTo;
import name.lkk.common.utils.PageUtils;
import name.lkk.common.utils.Query;
import name.lkk.common.utils.R;
import name.lkk.common.vo.MemberRsepVo;
import name.lkk.kkmall.order.constant.OrderConstant;
import name.lkk.kkmall.order.dao.OrderDao;
import name.lkk.kkmall.order.entity.OrderEntity;
import name.lkk.kkmall.order.entity.OrderItemEntity;
import name.lkk.kkmall.order.entity.PaymentInfoEntity;
import name.lkk.kkmall.order.feign.CartFeignService;
import name.lkk.kkmall.order.feign.MemberFeignService;
import name.lkk.kkmall.order.feign.ProductFeignService;
import name.lkk.kkmall.order.feign.WmsFeignService;
import name.lkk.kkmall.order.interceptor.LoginUserInterceptor;
import name.lkk.kkmall.order.service.OrderItemService;
import name.lkk.kkmall.order.service.OrderService;
import name.lkk.kkmall.order.service.PaymentInfoService;
import name.lkk.kkmall.order.to.OrderCreateTo;
import name.lkk.kkmall.order.vo.*;
import org.springframework.amqp.AmqpException;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.script.DefaultRedisScript;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import java.math.BigDecimal;
import java.util.*;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

@Slf4j
@Service("orderService")
public class OrderServiceImpl extends ServiceImpl<OrderDao, OrderEntity> implements OrderService {

    @Autowired
    private ThreadPoolExecutor executor;

    @Autowired
    private OrderItemService orderItemService;

    @Autowired
    PaymentInfoService paymentInfoService;

    @Autowired
    private MemberFeignService memberFeignService;

    @Autowired
    private CartFeignService cartFeignService;

    @Autowired
    private WmsFeignService wmsFeignService;

    @Autowired
    private ProductFeignService productFeignService;

    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    @Value("${kkMallRabbitmq.MQConfig.eventExchange}")
    private String eventExchange;

    @Value("${kkMallRabbitmq.MQConfig.createOrder}")
    private String createOrder;

    @Value("${kkMallRabbitmq.MQConfig.ReleaseOtherKey}")
    private String ReleaseOtherKey;

    @Autowired
    private RabbitTemplate rabbitTemplate;

    private ThreadLocal<OrderSubmitVo> confirmVoThreadLocal = new ThreadLocal<>();


    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<OrderEntity> page = this.page(
                new Query<OrderEntity>().getPage(params),
                new QueryWrapper<>()
        );

        return new PageUtils(page);
    }

    @Override
    public OrderEntity getOrderByOrderSn(String orderSn) {
        return this.getOne(new QueryWrapper<OrderEntity>().eq("order_sn", orderSn));
    }

    @Override
    public OrderConfirmVo confirmOrder() throws ExecutionException, InterruptedException {
        MemberRsepVo memberRsepVo = LoginUserInterceptor.threadLocal.get();
        OrderConfirmVo confirmVo = new OrderConfirmVo();

        // ???????????????????????????????????????????????????????????????????????????
        RequestAttributes attributes = RequestContextHolder.getRequestAttributes();
        CompletableFuture<Void> getAddressFuture = CompletableFuture.runAsync(() -> {
            // ?????????????????? RequestContextHolder.getRequestAttributes()
            RequestContextHolder.setRequestAttributes(attributes);
            // 1.???????????????????????????????????????
            List<MemberAddressVo> address;
            try {
                address = memberFeignService.getAddress(memberRsepVo.getId());
                if (address == null || address.size() <= 0) {
                    log.warn("????????????????????????????????????????????????????????????");
                    address = memberFeignService.getAddress(1L);
                }
                confirmVo.setAddress(address);
            } catch (Exception e) {
                log.warn("??????????????????????????????");
            }
        }, executor);


        CompletableFuture<Void> cartFuture = CompletableFuture.runAsync(() -> {
            // ?????????????????? RequestContextHolder.getRequestAttributes()
            RequestContextHolder.setRequestAttributes(attributes);
            // 2. ???????????????????????????
            // feign???????????????????????????????????? ?????????????????????
            List<OrderItemVo> items = cartFeignService.getCurrentUserCartItems();
            confirmVo.setItems(items);
        }, executor).thenRunAsync(() -> {
            RequestContextHolder.setRequestAttributes(attributes);
            List<OrderItemVo> items = confirmVo.getItems();
            // ?????????????????????id
            List<Long> collect = items.stream().map(OrderItemVo::getSkuId).collect(Collectors.toList());
            R hasStock = wmsFeignService.getSkuHasStock(collect);
            List<SkuStockVo> data = hasStock.getData(new TypeReference<List<SkuStockVo>>() {
            });
            if (data != null) {
                // ????????????id ??? ???????????????????????????
                Map<Long, Boolean> stocks = data.stream().collect(Collectors.toMap(SkuStockVo::getSkuId, SkuStockVo::getHasStock));
                confirmVo.setStocks(stocks);
            }
        }, executor);
        // 3.??????????????????
        Integer integration = memberRsepVo.getIntegration();
        confirmVo.setIntegration(integration);

        // 4.????????????????????????????????????
        // TODO 5.????????????
        String token = UUID.randomUUID().toString().replace("-", "");
        confirmVo.setOrderToken(token);
        stringRedisTemplate.opsForValue().set(OrderConstant.USER_ORDER_TOKEN_PREFIX + memberRsepVo.getId(), token, 10, TimeUnit.MINUTES);
        CompletableFuture.allOf(getAddressFuture, cartFuture).get();
        return confirmVo;
    }

    //	@GlobalTransactional
    @Transactional
    @Override
    public SubmitOrderResponseVo submitOrder(OrderSubmitVo vo) {
        // ??????????????????????????????
        confirmVoThreadLocal.set(vo);
        SubmitOrderResponseVo submitVo = new SubmitOrderResponseVo();
        // 0?????????
        submitVo.setCode(0);
        // ????????????????????????,?????????,?????????,?????????
        MemberRsepVo memberRsepVo = LoginUserInterceptor.threadLocal.get();
        // 1. ???????????? [?????????????????????] ?????? 0 or 1
        // 0 ?????????????????? 1????????????
        String script = "if redis.call('get',KEYS[1]) == ARGV[1] then return redis.call('del',KEYS[1]) else return 0 end";
        String orderToken = vo.getOrderToken();

        // ?????????????????? ????????????
        Long result = stringRedisTemplate.execute(new DefaultRedisScript<>(script, Long.class), Arrays.asList(OrderConstant.USER_ORDER_TOKEN_PREFIX + memberRsepVo.getId()), orderToken);
        if (result == 0L) {
            // ??????????????????
            submitVo.setCode(1);
        } else {
            // ??????????????????
            // 1 .?????????????????????
            OrderCreateTo order = createOrder();
            // 2. ??????
            BigDecimal payAmount = order.getOrder().getPayAmount();
            BigDecimal voPayPrice = vo.getPayPrice();
            if (Math.abs(payAmount.subtract(voPayPrice).doubleValue()) < 0.01) {
                // ??????????????????
                // 3.????????????
                saveOrder(order);
                // 4.????????????
                WareSkuLockVo lockVo = new WareSkuLockVo();
                lockVo.setOrderSn(order.getOrder().getOrderSn());
                List<OrderItemVo> locks = order.getOrderItems().stream().map(item -> {
                    OrderItemVo itemVo = new OrderItemVo();
                    // ?????????skuId ??????skuId??????????????????
                    itemVo.setSkuId(item.getSkuId());
                    itemVo.setCount(item.getSkuQuantity());
                    itemVo.setTitle(item.getSkuName());
                    return itemVo;
                }).collect(Collectors.toList());

                lockVo.setLocks(locks);
                // ???????????????
                R r = wmsFeignService.orderLockStock(lockVo);
                if (r.getCode() == 0) {
                    // ???????????? ???????????? ???MQ????????????
                    submitVo.setOrderEntity(order.getOrder());
                    rabbitTemplate.convertAndSend(this.eventExchange, this.createOrder, order.getOrder());
//					int i = 10/0;
                } else {
                    // ????????????
                    String msg = (String) r.get("msg");
                    throw new NotStockException(msg);
                }
            } else {
                // ??????????????????
                submitVo.setCode(2);
            }
        }
        return submitVo;
    }


    @Override
    public void closeOrder(OrderEntity entity) {
        log.info("???????????????????????????--???????????????:" + entity.getOrderSn());
        // ?????????????????????????????????
        OrderEntity orderEntity = this.getById(entity.getId());
        if (orderEntity.getStatus().equals(OrderStatusEnum.CREATE_NEW.getCode())) {
            OrderEntity update = new OrderEntity();
            update.setId(entity.getId());
            update.setStatus(OrderStatusEnum.CANCELED.getCode());
            this.updateById(update);
            // ?????????MQ??????????????????????????????????????????
            OrderTo orderTo = new OrderTo();
            BeanUtils.copyProperties(orderEntity, orderTo);
            try {
                // ???????????? 100% ????????? ?????????????????????????????????????????????
                // ????????????????????? ?????????????????????????????????
                rabbitTemplate.convertAndSend(eventExchange, ReleaseOtherKey, orderTo);
            } catch (AmqpException e) {
                // ?????????????????????????????????????????????.
            }
        }
    }

    @Override
    public PayVo getOrderPay(String orderSn) {
        PayVo payVo = new PayVo();
        OrderEntity order = this.getOrderByOrderSn(orderSn);
        // ??????2????????????????????????
        payVo.setTotal_amount(order.getTotalAmount().add(order.getFreightAmount() == null ? new BigDecimal("0") : order.getFreightAmount()).setScale(2, BigDecimal.ROUND_UP).toString());
        payVo.setOut_trade_no(order.getOrderSn());
        List<OrderItemEntity> entities = orderItemService.list(new QueryWrapper<OrderItemEntity>().eq("order_sn", order.getOrderSn()));
        payVo.setSubject("kkmall");
        payVo.setBody("kkmall");
        if (null != entities.get(0).getSkuName() && entities.get(0).getSkuName().length() > 1) {
//			payVo.setSubject(entities.get(0).getSkuName());
//			payVo.setBody(entities.get(0).getSkuName());
            payVo.setSubject("kkmall");
            payVo.setBody("kkmall");
        }
        return payVo;
    }

    @Override
    public PageUtils queryPageWithItem(Map<String, Object> params) {
        MemberRsepVo rsepVo = LoginUserInterceptor.threadLocal.get();
//        if (rsepVo==null){
//            rsepVo = new MemberRsepVo();
//            rsepVo.setId(14L);
//            log.warn("???????????????????????????????????????????????????????????????????????????????????????");
//        }
        IPage<OrderEntity> page = this.page(
                new Query<OrderEntity>().getPage(params),
                // ????????????????????????????????? [????????????]
                new QueryWrapper<OrderEntity>().eq("member_id", rsepVo.getId()).orderByDesc("id")
        );

        List<OrderEntity> order_sn = page.getRecords().stream().peek(order -> {
            // ??????????????????????????????????????????
            List<OrderItemEntity> orderSn = orderItemService.list(new QueryWrapper<OrderItemEntity>().eq("order_sn", order.getOrderSn()));
            order.setItemEntities(orderSn);
        }).collect(Collectors.toList());
        log.info(order_sn.toString());
        page.setRecords(order_sn);
        return new PageUtils(page);
    }

    @Override
    public String handlePayResult(PayAsyncVo vo) {
        // 1.??????????????????
        PaymentInfoEntity infoEntity = new PaymentInfoEntity();
        infoEntity.setAlipayTradeNo(vo.getTrade_no());
        infoEntity.setOrderSn(vo.getOut_trade_no());
        //		TRADE_SUCCESS
        infoEntity.setPaymentStatus(vo.getTrade_status());
        infoEntity.setCallbackTime(vo.getNotify_time());
        infoEntity.setSubject(vo.getSubject());
        infoEntity.setTotalAmount(new BigDecimal(vo.getTotal_amount()));
        infoEntity.setCreateTime(vo.getGmt_create());
        paymentInfoService.save(infoEntity);

        // 2.????????????????????????
        if (OrderConstant.ALIPAY_TRADE_SUCCESS.equals(vo.getTrade_status()) || OrderConstant.ALIPAY_TRADE_FINISHED.equals(vo.getTrade_status())) {
            // ????????????
            String orderSn = vo.getOut_trade_no();
            log.info("????????????");
            this.baseMapper.updateOrderStatus(orderSn, OrderStatusEnum.PAYED.getCode());
        }
        return "success";
    }

    @Override
    public void createSecKillOrder(SecKillOrderTo secKillOrderTo) {
        log.info("\n??????????????????");
        OrderEntity entity = new OrderEntity();
        entity.setOrderSn(secKillOrderTo.getOrderSn());
        entity.setMemberId(secKillOrderTo.getMemberId());
        entity.setCreateTime(new Date());
        entity.setPayAmount(secKillOrderTo.getSeckillPrice());
        entity.setTotalAmount(secKillOrderTo.getSeckillPrice());
        entity.setStatus(OrderStatusEnum.CREATE_NEW.getCode());
        entity.setPayType(1);
        // TODO ????????????????????????
        BigDecimal price = secKillOrderTo.getSeckillPrice().multiply(new BigDecimal("" + secKillOrderTo.getNum()));
        entity.setPayAmount(price);

        this.save(entity);

        // ?????????????????????
        OrderItemEntity itemEntity = new OrderItemEntity();
        itemEntity.setOrderSn(secKillOrderTo.getOrderSn());
        itemEntity.setRealAmount(price);
        itemEntity.setOrderId(entity.getId());
        itemEntity.setSkuQuantity(secKillOrderTo.getNum());
        R info = productFeignService.getSkuInfoBySkuId(secKillOrderTo.getSkuId());
        SpuInfoVo spuInfo = info.getData(new TypeReference<SpuInfoVo>() {
        });
        itemEntity.setSpuId(spuInfo.getId());
        itemEntity.setSpuBrand(spuInfo.getBrandId().toString());
        itemEntity.setSpuName(spuInfo.getSpuName());
        itemEntity.setCategoryId(spuInfo.getCatalogId());
        itemEntity.setGiftGrowth(secKillOrderTo.getSeckillPrice().multiply(new BigDecimal(secKillOrderTo.getNum())).intValue());
        itemEntity.setGiftIntegration(secKillOrderTo.getSeckillPrice().multiply(new BigDecimal(secKillOrderTo.getNum())).intValue());
        itemEntity.setPromotionAmount(new BigDecimal("0.0"));
        itemEntity.setCouponAmount(new BigDecimal("0.0"));
        itemEntity.setIntegrationAmount(new BigDecimal("0.0"));
        orderItemService.save(itemEntity);
    }


    /**
     * ????????????????????????
     */
    private void saveOrder(OrderCreateTo order) {
        OrderEntity orderEntity = order.getOrder();
        orderEntity.setModifyTime(new Date());
        this.save(orderEntity);

        List<OrderItemEntity> orderItems = order.getOrderItems();
        orderItems = orderItems.stream().map(item -> {
            item.setOrderId(orderEntity.getId());
            item.setSpuName(item.getSpuName());
            item.setOrderSn(order.getOrder().getOrderSn());
            return item;
        }).collect(Collectors.toList());
        orderItemService.saveBatch(orderItems);
    }

    /**
     * ????????????
     */
    private OrderCreateTo createOrder() {

        OrderCreateTo orderCreateTo = new OrderCreateTo();
        // 1. ?????????????????????
        String orderSn = IdWorker.getTimeId();
        OrderEntity orderEntity = buildOrderSn(orderSn);

        // 2. ?????????????????????
        List<OrderItemEntity> items = buildOrderItems(orderSn);

        // 3.??????	???????????? ???????????? ????????????????????????????????????????????????
        computerPrice(orderEntity, items);
        orderCreateTo.setOrder(orderEntity);
        orderCreateTo.setOrderItems(items);
        return orderCreateTo;
    }

    private void computerPrice(OrderEntity orderEntity, List<OrderItemEntity> items) {
        BigDecimal totalPrice = new BigDecimal("0.0");
        // ?????????????????????????????????
        BigDecimal coupon = new BigDecimal("0.0");
        BigDecimal integration = new BigDecimal("0.0");
        BigDecimal promotion = new BigDecimal("0.0");
        BigDecimal gift = new BigDecimal("0.0");
        BigDecimal growth = new BigDecimal("0.0");
        for (OrderItemEntity item : items) {
            // ??????????????????
            coupon = coupon.add(item.getCouponAmount());
            // ?????????????????????
            integration = integration.add(item.getIntegrationAmount());
            // ???????????????
            promotion = promotion.add(item.getPromotionAmount());
            BigDecimal realAmount = item.getRealAmount();
            totalPrice = totalPrice.add(realAmount);

            // ?????????????????????????????????
            gift.add(new BigDecimal(item.getGiftIntegration().toString()));
            growth.add(new BigDecimal(item.getGiftGrowth().toString()));
        }
        // 1.?????????????????? ?????????????????????
        orderEntity.setTotalAmount(totalPrice);
        orderEntity.setPayAmount(totalPrice.add(orderEntity.getFreightAmount()));

        orderEntity.setPromotionAmount(promotion);
        orderEntity.setIntegrationAmount(integration);
        orderEntity.setCouponAmount(coupon);

        // ????????????????????????
        orderEntity.setIntegration(gift.intValue());
        orderEntity.setGrowth(growth.intValue());

        // ???????????????????????????
        orderEntity.setDeleteStatus(OrderStatusEnum.CREATE_NEW.getCode());
    }

    /**
     * ??? orderSn ????????????????????????
     */
    private List<OrderItemEntity> buildOrderItems(String orderSn) {
        // ???????????????????????????????????????????????? ?????????????????????????????????????????????
        List<OrderItemVo> cartItems = cartFeignService.getCurrentUserCartItems();
        List<OrderItemEntity> itemEntities = null;
        if (cartItems != null && cartItems.size() > 0) {
            itemEntities = cartItems.stream().map(cartItem -> {
                OrderItemEntity itemEntity = buildOrderItem(cartItem);
                itemEntity.setOrderSn(orderSn);
                return itemEntity;
            }).collect(Collectors.toList());
        }
        return itemEntities;
    }

    /**
     * ????????????????????????
     */
    private OrderItemEntity buildOrderItem(OrderItemVo cartItem) {
        OrderItemEntity itemEntity = new OrderItemEntity();
        // 1.??????????????? ?????????

        // 2.??????spu??????
        Long skuId = cartItem.getSkuId();
        R r = productFeignService.getSkuInfoBySkuId(skuId);
        SpuInfoVo spuInfo = r.getData(new TypeReference<SpuInfoVo>() {
        });
        itemEntity.setSpuId(spuInfo.getId());
        itemEntity.setSpuBrand(spuInfo.getBrandId().toString());
        itemEntity.setSpuName(spuInfo.getSpuName());
        itemEntity.setCategoryId(spuInfo.getCatalogId());
        // 3.?????????sku??????
        itemEntity.setSkuId(cartItem.getSkuId());
        itemEntity.setSkuName(cartItem.getTitle());
        itemEntity.setSkuPic(cartItem.getImage());
        itemEntity.setSkuPrice(cartItem.getPrice());
        // ????????????????????????????????????????????????????????????????????????
        String skuAttr = StringUtils.collectionToDelimitedString(cartItem.getSkuAttr(), ";");
        itemEntity.setSkuAttrsVals(skuAttr);
        itemEntity.setSkuQuantity(cartItem.getCount());
        // 4.???????????? ?????????????????????????????? ???????????????
        itemEntity.setGiftGrowth(cartItem.getPrice().multiply(new BigDecimal(cartItem.getCount())).intValue());
        itemEntity.setGiftIntegration(cartItem.getPrice().multiply(new BigDecimal(cartItem.getCount())).intValue());
        // 5.???????????????????????? ????????????
        itemEntity.setPromotionAmount(new BigDecimal("0.0"));
        itemEntity.setCouponAmount(new BigDecimal("0.0"));
        itemEntity.setIntegrationAmount(new BigDecimal("0.0"));
        // ??????????????????????????????
        BigDecimal orign = itemEntity.getSkuPrice().multiply(new BigDecimal(itemEntity.getSkuQuantity().toString()));
        // ???????????????????????????
        BigDecimal subtract = orign.subtract(itemEntity.getCouponAmount()).subtract(itemEntity.getPromotionAmount()).subtract(itemEntity.getIntegrationAmount());
        itemEntity.setRealAmount(subtract);
        return itemEntity;
    }

    /**
     * ??????????????????
     */
    private OrderEntity buildOrderSn(String orderSn) {
        OrderEntity entity = new OrderEntity();
        entity.setOrderSn(orderSn);
        entity.setCreateTime(new Date());
        entity.setCommentTime(new Date());
        entity.setReceiveTime(new Date());
        entity.setDeliveryTime(new Date());
        MemberRsepVo rsepVo = LoginUserInterceptor.threadLocal.get();
        entity.setMemberId(rsepVo.getId());
        entity.setMemberUsername(rsepVo.getUsername());
        entity.setBillReceiverEmail(rsepVo.getEmail());
        // 2. ????????????????????????
        OrderSubmitVo submitVo = confirmVoThreadLocal.get();
        R fare = wmsFeignService.getFare(submitVo.getAddrId());
        FareVo resp = fare.getData(new TypeReference<FareVo>() {
        });
        entity.setFreightAmount(resp.getFare());
        entity.setReceiverCity(resp.getMemberAddressVo().getCity());
        entity.setReceiverDetailAddress(resp.getMemberAddressVo().getDetailAddress());
        entity.setDeleteStatus(OrderStatusEnum.CREATE_NEW.getCode());
        entity.setReceiverPhone(resp.getMemberAddressVo().getPhone());
        entity.setReceiverName(resp.getMemberAddressVo().getName());
        entity.setReceiverPostCode(resp.getMemberAddressVo().getPostCode());
        entity.setReceiverProvince(resp.getMemberAddressVo().getProvince());
        entity.setReceiverRegion(resp.getMemberAddressVo().getRegion());
        // ??????????????????
        entity.setStatus(OrderStatusEnum.CREATE_NEW.getCode());
        entity.setAutoConfirmDay(7);
        return entity;
    }

}