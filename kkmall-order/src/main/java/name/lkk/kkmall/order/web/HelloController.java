package name.lkk.kkmall.order.web;


import name.lkk.kkmall.order.entity.OrderEntity;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.UUID;


@Controller
public class HelloController {

    @Autowired
    RabbitTemplate rabbitTemplate;

    /**
     * 用于测试各个页面是否能正常访问
     * http://order.kkmall.com/confirm.html
     * http://order.kkmall.com/detai.html
     * http://order.kkmall.com/list.html
     * http://order.kkmall.com/pay.html
     */
    @GetMapping("/{page}.html")
    public String listPage(@PathVariable("page") String page) {
        return page;
    }

    @ResponseBody
    @GetMapping("/test/createOrder")
    public String createOrderTest() {

        OrderEntity orderEntity = new OrderEntity();
        orderEntity.setOrderSn(UUID.randomUUID().toString().replace("-", ""));
        orderEntity.setModifyTime(new Date());
        rabbitTemplate.convertAndSend("order-event-exchange", "order.create.order", orderEntity);
        return "下单成功";
    }

}
