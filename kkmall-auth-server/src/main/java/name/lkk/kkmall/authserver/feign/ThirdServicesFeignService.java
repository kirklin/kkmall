package name.lkk.kkmall.authserver.feign;


import name.lkk.common.utils.R;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 远程调用第三方服务
 */
@FeignClient("kkmall-third-server")
public interface ThirdServicesFeignService {

	@GetMapping("/sms/sendcode")
	R sendCode(@RequestParam("phone") String phone, @RequestParam("code") String code);
}
