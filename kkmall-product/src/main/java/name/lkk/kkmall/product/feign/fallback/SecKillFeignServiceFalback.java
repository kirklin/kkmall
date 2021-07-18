package name.lkk.kkmall.product.feign.fallback;


import name.lkk.common.exception.BizCodeEnum;
import name.lkk.common.utils.R;
import name.lkk.kkmall.product.feign.SeckillFeignService;
import org.springframework.stereotype.Component;

@Component
public class SecKillFeignServiceFalback implements SeckillFeignService {

    @Override
    public R getSkuSeckillInfo(Long skuId) {
        System.out.println("触发熔断");
        return R.error(BizCodeEnum.TOO_MANY_REQUEST.getCode(), BizCodeEnum.TOO_MANY_REQUEST.getMsg());
    }
}
