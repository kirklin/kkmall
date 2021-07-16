package name.lkk.kkmall.order;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.amqp.rabbit.annotation.EnableRabbit;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.session.data.redis.config.annotation.web.http.EnableRedisHttpSession;

@EnableRabbit
@SpringBootApplication
@EnableDiscoveryClient
@EnableRedisHttpSession
@EnableFeignClients("name.lkk.kkmall.order.feign")
@MapperScan("name.lkk.kkmall.order.dao")
public class KkmallOrderApplication {

    public static void main(String[] args) {
        SpringApplication.run(KkmallOrderApplication.class, args);
    }

}
