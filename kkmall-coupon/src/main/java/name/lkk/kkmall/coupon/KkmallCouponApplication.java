package name.lkk.kkmall.coupon;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("name.lkk.kkmall.coupon.dao")
public class KkmallCouponApplication {

    public static void main(String[] args) {
        SpringApplication.run(KkmallCouponApplication.class, args);
    }

}
