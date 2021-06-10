package name.lkk.kkmall.thirdserver;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
public class KkmallThirdServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(KkmallThirdServerApplication.class, args);
    }

}
