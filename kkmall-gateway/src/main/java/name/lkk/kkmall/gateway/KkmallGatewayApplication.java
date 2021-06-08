package name.lkk.kkmall.gateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@EnableDiscoveryClient
@SpringBootApplication
public class KkmallGatewayApplication {

    public static void main(String[] args) {
        SpringApplication.run(KkmallGatewayApplication.class, args);
    }

}
