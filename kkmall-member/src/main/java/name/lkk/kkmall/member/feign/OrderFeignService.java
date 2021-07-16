package name.lkk.kkmall.member.feign;


import name.lkk.common.utils.R;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.Map;


@FeignClient("kkmall-order")
public interface OrderFeignService {

    /**
     * 查询当前登录的用户的所有订单信息
     */
    @PostMapping("/order/order/listWithItem")
    R listWithItem(@RequestBody Map<String, Object> params);
}
