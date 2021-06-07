package name.lkk.kkmall.product;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @author: kirklin
 * @date: 2021/6/7 2:38 下午
 * @description:
 */
@MapperScan("name.lkk.kkmall.product.dao")
@SpringBootApplication
public class KkmallProductApplication {

    public static void main(String[] args) {
        SpringApplication.run(KkmallProductApplication.class, args);
    }

}
