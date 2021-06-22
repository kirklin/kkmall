package name.lkk.kkmall.product.feign;

import name.lkk.common.utils.R;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

/**
 * 远程调用库存服务
 */
@FeignClient("kkmall-ware")
public interface WareFeignService {

	/**
	 * 修改整个系统的 R 带上泛型
	 */
	@PostMapping("/ware/waresku/hasStock")
	R getSkuHasStock(@RequestBody List<Long> SkuIds);
}
