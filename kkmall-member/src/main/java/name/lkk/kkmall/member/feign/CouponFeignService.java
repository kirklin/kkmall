package name.lkk.kkmall.member.feign;

import name.lkk.common.utils.R;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author: kirklin
 * @date: 2021/6/7 9:02 下午
 * @description:
 */
@FeignClient("kkmall-coupon")
public interface CouponFeignService {

    @RequestMapping("/coupon/coupon/member/list")
    public R memberCoupons();

}
