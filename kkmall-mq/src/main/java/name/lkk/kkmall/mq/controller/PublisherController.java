package name.lkk.kkmall.mq.controller;

import name.lkk.common.utils.R;
import name.lkk.kkmall.mq.service.ProducerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.UUID;

/**
 * @author: kirklin
 * @date: 2021/6/26 5:02 下午
 * @description:
 */
@RestController
@RequestMapping("/pub")
public class PublisherController {
    @Autowired
    ProducerService producerService;

    @RequestMapping("{name}")
    public String sendMessage(@PathVariable("name") String name) {
        StringBuffer stringBuffer = new StringBuffer();

        for (int i = 1; i <= 100; i++) {
            stringBuffer.append(producerService.publish("lkk", R.ok("</br>接收到的信息：" + "订单号" + UUID.randomUUID())));
        }
        return stringBuffer.toString();
    }
}
