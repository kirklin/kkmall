package name.lkk.kkmall.order.utils;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import lombok.Data;
import name.lkk.kkmall.order.vo.PayVo;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 支付宝支付沙箱环境配置
 *
 * @author kirklin
 */
@ConfigurationProperties(prefix = "alipay")
@Component
@Data
public class AlipayTemplate {

    /**
     * 在支付宝创建的应用的id
     */
    private String app_id = "2021000117689509";

    /**
     * 商户私钥，您的PKCS8格式RSA2私钥
     */
    private String merchant_private_key = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCy4zXCMp+5IjCZHh/Q0epeMV7qHErBGwoc5VgeTSH3sw3A3/iRmsVy6MAvwFt8Ji0tWpByIZqADc6K0i3apPriuPvpFOHkCwi6Y4QSQqynPNyZNFNGs33fxgd1bdalWA96EoulR0J6ChxTF9PYmThUPxGfXWE73Lv+iv4Ih28jkF9ZwQMLBhE4+lanAOvVeiRM0Xa7Z036W6feAsbb5HhSIY3WViUXXPtb/Ld+gRvhpbj7Xlz92oMbEvQdixtX5Op09rXiSdweS1RL6rKF/lk9u2vADyqMtzriLseBEKvg9RTz7Sxgsho+M9aW7MkNCUO9hBVMme2xBIMCT0ErghxrAgMBAAECggEBAItY2GiVHLyPOIId6DS3QDTtin0dWtH/6SnHMZQxC3OzQ9Rp42wwvvwa+JJ56gnUhz6cHIb7TCnSF4El5lg6ScDQzlKrVKdaPQtMN/Ytf+aqT0D8dJ5PdY8Z6Hd9/0U/SpcR2Tv/PXZpZ9UGa5x/BlUB6A1XJUYHVV4cEXS9Y0K0hnExgIumjhhDP2HjxEb18lWAa/+F7dpYANw2a8r0XqoW5d014y19twA7RX6Zp0wd8KdOHImmS9sM/8hTYTfhho0Q+SvhJ7WCHvvA/olxQ3eFLxXvrP+KmXDH7tGG13jihYV8kJ/8u2/T6ZcoQH5u1CCsn+kTfgImhmEhpzRDR7ECgYEA5ngtZ/xgrU645x/qKfF3qooHR7DA0J8oH7G8Kq6/VoqcVZiyEOcaOlLwp0FjplSipkf52D737xVHvL1ttfDPZNGmGoERkDt75g0ep5KkSAvsWca4EXE9TQiodtcx22Q3t229ayze5uKaRUw8zWow82HA9Ne3UQdD2TQaJgBRF0kCgYEAxrQ8IzAHF0SWNtJtaep/V7CDR6iUj4SK1cCtIN2ZBWeNpPoHyX6HcQSK60G6Tl96clPrxd8RzuHXBDhO5HYMhMcJRKXpxmTo5GzCy15N15AcK+s8QVp2KxIq6oYl6pReVjU0l91IB0qxpUEmhQhUJX8GrOltZoMlx6i6bCPIUhMCgYANXsdzkuag50I+1lElYcbJc/x8IjrtX25aeFssNrsO8Dell5gs9ttEqu8fJOH9EkflUaOi8fQ8QIXK40psFa5ScP8r5nT4YxsK+5PdsNoq+9YYVzjyehlOUMRFMLLJwYSh9ZHZl97OkjLU9llIqXJxjCg/jAwsfTlobmdd8QLDUQKBgHZwiEgRIKjl4QPcegtgE3eZZycXfTXuszKmHowwij2GdA+aWXnpSaI8KvH/w6VjlAEBtM/FH0BJrXh+d8gF9YBPg16/5pCzJX7CtXmzRILxC1nCZbAu07Doq1wPihpBRdns7OR4qa5u/2SZaPRy+nU/OiNnICaylZplIHnE+mqxAoGBANh+9aeV8eXkBhd7VXXwsDPhcJC4uXEV3+3HmV3roKeyIVVezQcKmdce44AxUWXzb4QVNUrLmbgm2RbXIQie0BawQ7wn7QWwJXN9WXf6ZVdtqbqCAoxhcaLqmm5Mcc229UUFHM7WxyWo+POT/Ba7lArqtcS8pWyxVIUx/ykReWxv";

    /**
     * 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
     */
    private String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA2Gd8dERvTwkORWsWKt4y41Qjv1rWp1dlJ32iMHsz7BQ1TPBLkEKy+oOl52vkmoGIdzvtRqKxG8hKLna7JQXytGm2+2dVI2STLCU2nS6ix0Ce80wrQDdMLMIceFVfwmJ0Z+ZOWcZJL4SxwhB1KAXkSsx6xrUcbnIgoI1S2/MECvRKJp5Iz98zkF3QWt6tSvzz1MbvpW0dP1bDG9mYPDEXGKeFYnr5GwJTbEs1Zfk6CvwxQNFI8O1Xma+KuclsZil+kEiEuDqJN+LlrJMXOO1YLtnkncnkXlZxqqlYqf57z9t1Tgg17CD+3rG7uhUMDhgPVKABg6aiB4VHY0ynJbYBVwIDAQAB";

    // 服务器[异步通知]页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    // 支付宝会悄悄的给我们发送一个请求，告诉我们支付成功的信息
    private String notify_url = "http://order.kkmall.com/payed/notify";

    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    //同步通知，支付成功，一般跳转到成功页
    private String return_url = "http://member.kkmall.com/memberOrder.html";

    // 签名方式
    private String sign_type = "RSA2";

    // 字符编码格式
    private String charset = "utf-8";

    // 自动关单时间
    private String timeout = "15m";

    // 支付宝网关； https://openapi.alipaydev.com/gateway.do
    private String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

    public String pay(PayVo vo) throws AlipayApiException {

        //AlipayClient alipayClient = new DefaultAlipayClient(AlipayTemplate.gatewayUrl, AlipayTemplate.app_id, AlipayTemplate.merchant_private_key, "json", AlipayTemplate.charset, AlipayTemplate.alipay_public_key, AlipayTemplate.sign_type);
        //1、根据支付宝的配置生成一个支付客户端
        AlipayClient alipayClient = new DefaultAlipayClient(gatewayUrl,
                app_id, merchant_private_key, "json",
                charset, alipay_public_key, sign_type);

        //2、创建一个支付请求 //设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(return_url);
        alipayRequest.setNotifyUrl(notify_url);

        //商户订单号，商户网站订单系统中唯一订单号，必填
        String out_trade_no = vo.getOut_trade_no();
        //付款金额，必填
        String total_amount = vo.getTotal_amount();
        //订单名称，必填
        String subject = vo.getSubject();
        //商品描述，可空
        String body = vo.getBody();

        // 30分钟内不付款就会自动关单
        alipayRequest.setBizContent("{\"out_trade_no\":\"" + out_trade_no + "\","
                + "\"total_amount\":\"" + total_amount + "\","
                + "\"subject\":\"" + subject + "\","
                + "\"body\":\"" + body + "\","
                + "\"timeout_express\":\"" + timeout + "\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

        String result = alipayClient.pageExecute(alipayRequest).getBody();

        //会收到支付宝的响应，响应的是一个页面，只要浏览器显示这个页面，就会自动来到支付宝的收银台页面
        return result;
    }
}
