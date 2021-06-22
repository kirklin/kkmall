package cn.kirklin.kkmall.search;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@EnableDiscoveryClient
@SpringBootApplication
public class KkmallSearchApplication {

    public static void main(String[] args) {
        SpringApplication.run(KkmallSearchApplication.class, args);
    }

}
