package name.lkk.kkmall.order.controller;

import lombok.extern.slf4j.Slf4j;
import name.lkk.common.utils.PageUtils;
import name.lkk.common.utils.R;
import name.lkk.kkmall.order.entity.OrderEntity;
import name.lkk.kkmall.order.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;



/**
 * 订单
 *
 * @author KirkLin
 * @email linkirk@163.com
 * @date 2021-06-07 16:38:57
 */
@RestController
@Slf4j
@RequestMapping("order/order")
public class OrderController {
    @Autowired
    private OrderService orderService;

    /**
     * 查询当前登录的用户的所有订单信息
     */
    @PostMapping("/listWithItem")
    public R listWithItem(@RequestBody Map<String, Object> params) {
        //   log.info("当前登录的用户的所有订单信息请求参数："+params);
        PageUtils page = orderService.queryPageWithItem(params);
        //  log.info("当前登录的用户的所有订单信息请求结果："+page);
        return R.ok().put("page", page);
    }

    @GetMapping("/status/{orderSn}")
    public R getOrderStatus(@PathVariable("orderSn") String orderSn) {
        OrderEntity orderEntity = orderService.getOrderByOrderSn(orderSn);

        return R.ok().setData(orderEntity);
    }

    /**
     * 列表
     */
    @RequestMapping("/list")
    //@RequiresPermissions("order:order:list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = orderService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    //@RequiresPermissions("order:order:info")
    public R info(@PathVariable("id") Long id){
		OrderEntity order = orderService.getById(id);

        return R.ok().put("order", order);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    //@RequiresPermissions("order:order:save")
    public R save(@RequestBody OrderEntity order){
		orderService.save(order);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    //@RequiresPermissions("order:order:update")
    public R update(@RequestBody OrderEntity order){
		orderService.updateById(order);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    //@RequiresPermissions("order:order:delete")
    public R delete(@RequestBody Long[] ids){
		orderService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
