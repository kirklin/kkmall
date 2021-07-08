package name.lkk.kkmall.cart;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
@EnableDiscoveryClient
@EnableFeignClients("name.lkk.kkmall.cart.feign")
public class KkmallCartApplication {

    public static void main(String[] args) {
        SpringApplication.run(KkmallCartApplication.class, args);
    }

}
