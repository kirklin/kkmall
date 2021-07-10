package name.lkk.kkmall.cart.config;

import name.lkk.kkmall.cart.interceptor.CartInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @author: kirklin
 * @date: 2021/7/10 3:33 下午
 * @description: 添加拦截器
 */
@Configuration
public class CartWebConfig implements WebMvcConfigurer {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        WebMvcConfigurer.super.addInterceptors(registry);
        registry.addInterceptor(new CartInterceptor()).addPathPatterns("/**");

    }
}
