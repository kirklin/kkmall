package name.lkk.kkmall.product;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * @author: kirklin
 * @date: 2021/6/7 2:38 下午
 * @description:
 */
@MapperScan("name.lkk.kkmall.product.dao")
@SpringBootApplication
@EnableDiscoveryClient
@EnableFeignClients(basePackages = "name.lkk.kkmall.product.feign")
public class KkmallProductApplication {

    public static void main(String[] args) {
        SpringApplication.run(KkmallProductApplication.class, args);
    }

}
