package name.lkk.kkmall.search.feign;


import name.lkk.common.utils.R;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;


@FeignClient("kkmall-product")
public interface ProductFeignService {

	@GetMapping("/product/attr/info/{attrId}")
	R getAttrsInfo(@PathVariable("attrId") Long attrId);

	@GetMapping("/product/brand/infos")
	R brandInfo(@RequestParam("brandIds") List<Long> brandIds);
}
