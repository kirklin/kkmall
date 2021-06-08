package name.lkk.kkmall.member;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
@EnableDiscoveryClient
@EnableFeignClients(basePackages = "name.lkk.kkmall.member.feign")
@MapperScan("name.lkk.kkmall.member.dao")
public class KkmallMemberApplication {

    public static void main(String[] args) {
        SpringApplication.run(KkmallMemberApplication.class, args);
    }

}
