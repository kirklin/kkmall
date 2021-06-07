package name.lkk.kkmall.order;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("name.lkk.kkmall.order.dao")
public class KkmallOrderApplication {

    public static void main(String[] args) {
        SpringApplication.run(KkmallOrderApplication.class, args);
    }

}
