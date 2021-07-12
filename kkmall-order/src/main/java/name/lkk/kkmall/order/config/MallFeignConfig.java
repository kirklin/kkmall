package name.lkk.kkmall.order.config;

import feign.RequestInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * 配置OpenFeign拦截器
 * 解决远程调用时丢失请求头的问题
 *
 * @author kirklin
 */
@Configuration
public class MallFeignConfig {

    @Bean("requestInterceptor")
    public RequestInterceptor requestInterceptor() {

        return requestInterceptor -> {
            //1、使用RequestContextHolder拿到刚进来的请求数据
            ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();

            if (requestAttributes != null) {
                //老请求
                HttpServletRequest request = requestAttributes.getRequest();

                //2、同步请求头的数据（主要是cookie）
                //把老请求的cookie值放到新请求上来，进行一个同步
                String cookie = request.getHeader("Cookie");
                requestInterceptor.header("Cookie", cookie);
            }
        };
    }

}
