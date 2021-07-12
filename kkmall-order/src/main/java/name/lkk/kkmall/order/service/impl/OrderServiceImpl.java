package name.lkk.kkmall.order.service.impl;

import com.alibaba.fastjson.TypeReference;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import name.lkk.common.utils.PageUtils;
import name.lkk.common.utils.Query;
import name.lkk.common.utils.R;
import name.lkk.common.vo.MemberRsepVo;
import name.lkk.kkmall.order.constant.OrderConstant;
import name.lkk.kkmall.order.dao.OrderDao;
import name.lkk.kkmall.order.entity.OrderEntity;
import name.lkk.kkmall.order.feign.CartFeignService;
import name.lkk.kkmall.order.feign.MemberFeignService;
import name.lkk.kkmall.order.feign.WmsFeignService;
import name.lkk.kkmall.order.interceptor.LoginUserInterceptor;
import name.lkk.kkmall.order.service.OrderService;
import name.lkk.kkmall.order.vo.MemberAddressVo;
import name.lkk.kkmall.order.vo.OrderConfirmVo;
import name.lkk.kkmall.order.vo.OrderItemVo;
import name.lkk.kkmall.order.vo.SkuStockVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

@Slf4j
@Service("orderService")
public class OrderServiceImpl extends ServiceImpl<OrderDao, OrderEntity> implements OrderService {

    @Autowired
    private MemberFeignService memberFeignService;

    @Autowired
    private CartFeignService cartFeignService;

    @Autowired
    private ThreadPoolExecutor executor;

    @Autowired
    private WmsFeignService wmsFeignService;

    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<OrderEntity> page = this.page(
                new Query<OrderEntity>().getPage(params),
                new QueryWrapper<>()
        );

        return new PageUtils(page);
    }

    @Override
    public OrderConfirmVo confirmOrder() throws ExecutionException, InterruptedException {
        MemberRsepVo memberRsepVo = LoginUserInterceptor.threadLocal.get();
        OrderConfirmVo confirmVo = new OrderConfirmVo();

        // 从主线程获取数据，解决异步情况下请求头数据丢失问题
        RequestAttributes attributes = RequestContextHolder.getRequestAttributes();
        CompletableFuture<Void> getAddressFuture = CompletableFuture.runAsync(() -> {
            // 异步线程共享 RequestContextHolder.getRequestAttributes()
            RequestContextHolder.setRequestAttributes(attributes);
            // 1.远程查询所有的收获地址列表
            List<MemberAddressVo> address;
            try {
                address = memberFeignService.getAddress(memberRsepVo.getId());
                if (address == null || address.size() <= 0) {
                    log.warn("该用户无收货地址。自动设置成系统默认地址");
                    address = memberFeignService.getAddress(1L);
                }
                confirmVo.setAddress(address);
            } catch (Exception e) {
                log.warn("远程调用会员服务失败");
            }
        }, executor);


        CompletableFuture<Void> cartFuture = CompletableFuture.runAsync(() -> {
            // 异步线程共享 RequestContextHolder.getRequestAttributes()
            RequestContextHolder.setRequestAttributes(attributes);
            // 2. 远程查询购物车服务
            // feign在远程调用之前要构造请求 调用很多拦截器
            List<OrderItemVo> items = cartFeignService.getCurrentUserCartItems();
            confirmVo.setItems(items);
        }, executor).thenRunAsync(() -> {
            RequestContextHolder.setRequestAttributes(attributes);
            List<OrderItemVo> items = confirmVo.getItems();
            // 获取所有商品的id
            List<Long> collect = items.stream().map(OrderItemVo::getSkuId).collect(Collectors.toList());
            R hasStock = wmsFeignService.getSkuHasStock(collect);
            List<SkuStockVo> data = hasStock.getData(new TypeReference<List<SkuStockVo>>() {
            });
            if (data != null) {
                // 各个商品id 与 他们库存状态的映射
                Map<Long, Boolean> stocks = data.stream().collect(Collectors.toMap(SkuStockVo::getSkuId, SkuStockVo::getHasStock));
                confirmVo.setStocks(stocks);
            }
        }, executor);
        // 3.查询用户积分
        Integer integration = memberRsepVo.getIntegration();
        confirmVo.setIntegration(integration);

        // 4.其他数据在类内部自动计算
        // TODO 5.防重令牌
        String token = UUID.randomUUID().toString().replace("-", "");
        confirmVo.setOrderToken(token);
        stringRedisTemplate.opsForValue().set(OrderConstant.USER_ORDER_TOKEN_PREFIX + memberRsepVo.getId(), token, 10, TimeUnit.MINUTES);
        CompletableFuture.allOf(getAddressFuture, cartFuture).get();
        return confirmVo;
    }

}