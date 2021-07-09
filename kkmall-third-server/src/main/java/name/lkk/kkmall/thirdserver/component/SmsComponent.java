package name.lkk.kkmall.thirdserver.component;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import name.lkk.common.utils.HttpUtils;
import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;


@ConfigurationProperties(prefix = "spring.cloud.alicloud.sms")
@Data
@Slf4j
@Component
public class SmsComponent {
    private final int PHONE_LENGTH = 11;
    private String host;
    private String path;
    private String skin;
    private String sign;
    private String appcode;

    public String mockSendCode(String phone, String code) {
        if (phone != null && phone.length() == PHONE_LENGTH) {
            log.info("模拟短信发送成功手机号：{},验证码{}", phone, code);
            return "success_" + "code:" + code;
        }
        log.error("模拟短信发送失败，请输入正确的手机号 ");
        return "fail_" + code;
    }

    public String sendCode(String phone, String code) {
        String method = "GET";
        Map<String, String> headers = new HashMap<String, String>();
        //最后在header中的格式(中间是英文空格)为Authorization:APPCODE 83359fd73fe94948385f570e3c139105
        headers.put("Authorization", "APPCODE " + appcode);
        Map<String, String> querys = new HashMap<String, String>();
        querys.put("code", code);
        querys.put("phone", phone);
        querys.put("skin", skin);
        querys.put("sign", sign);
        //JDK 1.8示例代码请在这里下载：  http://code.fegine.com/Tools.zip
        HttpResponse response = null;
        try {
            /**
             * 重要提示如下:
             * HttpUtils请从
             * https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/src/main/java/com/aliyun/api/gateway/demo/util/HttpUtils.java
             * 或者直接下载：
             * http://code.fegine.com/HttpUtils.zip
             * 下载
             *
             * 相应的依赖请参照
             * https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/pom.xml
             * 相关jar包（非pom）直接下载：
             * http://code.fegine.com/aliyun-jar.zip
             */
            response = HttpUtils.doGet(host, path, method, headers, querys);
            //System.out.println(response.toString());如不输出json, 请打开这行代码，打印调试头部状态码。
            //状态码: 200 正常；400 URL无效；401 appCode错误； 403 次数用完； 500 API网管错误
            //获取response的body
            if (response.getStatusLine().getStatusCode() == 200) {
                return EntityUtils.toString(response.getEntity());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "fail_" + response.getStatusLine().getStatusCode();
    }

}
