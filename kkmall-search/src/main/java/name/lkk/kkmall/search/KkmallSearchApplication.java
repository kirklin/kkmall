package name.lkk.kkmall.search;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

@EnableDiscoveryClient
@EnableFeignClients("name.lkk.kkmall.search.feign")
@SpringBootApplication
public class KkmallSearchApplication {

    public static void main(String[] args) {
        SpringApplication.run(KkmallSearchApplication.class, args);
    }

}
