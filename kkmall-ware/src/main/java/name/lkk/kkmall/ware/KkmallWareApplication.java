package name.lkk.kkmall.ware;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("name.lkk.kkmall.ware.dao")
public class KkmallWareApplication {

    public static void main(String[] args) {
        SpringApplication.run(KkmallWareApplication.class, args);
    }

}
