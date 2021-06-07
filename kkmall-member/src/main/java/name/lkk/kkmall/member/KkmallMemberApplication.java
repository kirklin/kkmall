package name.lkk.kkmall.member;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("name.lkk.kkmall.member.dao")
public class KkmallMemberApplication {

    public static void main(String[] args) {
        SpringApplication.run(KkmallMemberApplication.class, args);
    }

}
