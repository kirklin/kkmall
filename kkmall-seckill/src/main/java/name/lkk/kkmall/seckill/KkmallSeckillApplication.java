package name.lkk.kkmall.seckill;

import org.springframework.amqp.rabbit.annotation.EnableRabbit;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.session.data.redis.config.annotation.web.http.EnableRedisHttpSession;

@EnableRedisHttpSession
@EnableFeignClients("name.lkk.kkmall.seckill.feign")
@EnableDiscoveryClient
@EnableRabbit
@SpringBootApplication
public class KkmallSeckillApplication {

    public static void main(String[] args) {
        SpringApplication.run(KkmallSeckillApplication.class, args);
    }

}
