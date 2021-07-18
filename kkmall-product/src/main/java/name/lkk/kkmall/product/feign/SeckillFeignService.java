package name.lkk.kkmall.product.feign;


import name.lkk.common.utils.R;
import name.lkk.kkmall.product.feign.fallback.SecKillFeignServiceFalback;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;


@FeignClient(value = "kkmall-seckill", fallback = SecKillFeignServiceFalback.class)
public interface SeckillFeignService {

    @GetMapping("/sku/seckill/{skuId}")
    R getSkuSeckillInfo(@PathVariable("skuId") Long skuId);
}
