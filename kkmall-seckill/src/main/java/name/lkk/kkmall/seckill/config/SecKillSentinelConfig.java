package name.lkk.kkmall.seckill.config;

import org.springframework.context.annotation.Configuration;

/**
 * 配置请求被限制以后的处理器
 */
@Configuration
public class SecKillSentinelConfig {

	public SecKillSentinelConfig() {
//		WebCallbackManager.setUrlBlockHandler((request, response, exception) -> {
//			R error = R.error(BizCodeEnum.TOO_MANY_REQUEST.getCode(), BizCodeEnum.TOO_MANY_REQUEST.getMsg());
//			response.setCharacterEncoding("UTF-8");
//			response.setContentType("application/json");
//			response.getWriter().write(JSON.toJSONString(error));
//		});

	}
}
