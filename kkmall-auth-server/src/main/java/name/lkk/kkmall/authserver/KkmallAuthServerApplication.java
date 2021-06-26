package name.lkk.kkmall.authserver;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

@EnableDiscoveryClient
@EnableFeignClients("name.lkk.kkmall.authserver.feign")
@SpringBootApplication
public class KkmallAuthServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(KkmallAuthServerApplication.class, args);
    }

}
