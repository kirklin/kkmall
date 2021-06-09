package name.lkk.kkmall.gateway.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.reactive.CorsWebFilter;
import org.springframework.web.cors.reactive.UrlBasedCorsConfigurationSource;

/**
 * @author: kirklin
 * @date: 2021/6/9 11:15 上午
 * @description: 设置跨域请求
 */
@Configuration
public class CorsConfigurationMall {

    @Bean
    public CorsWebFilter corsWebFilter(){
        UrlBasedCorsConfigurationSource urlBasedCorsConfigurationSource = new UrlBasedCorsConfigurationSource();
        CorsConfiguration corsConfiguration = new CorsConfiguration();
        // 配置跨越允许任意请求头
        corsConfiguration.addAllowedHeader("*");
        // 允许任意方法
        corsConfiguration.addAllowedMethod("*");
        // 允许任意请求来源
        corsConfiguration.addAllowedOriginPattern("*");
        // 允许携带cookie
        corsConfiguration.setAllowCredentials(true);
        urlBasedCorsConfigurationSource.registerCorsConfiguration("/**",corsConfiguration);
        return new CorsWebFilter(urlBasedCorsConfigurationSource);
    }
}
