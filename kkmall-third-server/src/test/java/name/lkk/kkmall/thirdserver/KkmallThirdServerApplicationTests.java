package name.lkk.kkmall.thirdserver;

import com.aliyun.oss.OSSClient;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

@SpringBootTest
class KkmallThirdServerApplicationTests {

    @Autowired
    private OSSClient ossClient;

    @Value("${spring.cloud.alicloud.oss.bucket}")
    private String bucketName;

    @Test
    void contextLoads() {
    }

    @Test
    public void testFindPath() throws IOException {
        // 上传网络流。
        InputStream inputStream = new FileInputStream("/Users/kirklin/Pictures/ideabg.jpeg");

        ossClient.putObject(bucketName, "ideabg.jpeg", inputStream);

        // 关闭OSSClient。
        ossClient.shutdown();
        System.out.println("上传成功");
    }
}
