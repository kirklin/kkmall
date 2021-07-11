package name.lkk.kkmall.order.controller;


import name.lkk.kkmall.order.entity.OrderEntity;
import name.lkk.kkmall.order.entity.OrderItemEntity;
import org.springframework.amqp.rabbit.connection.CorrelationData;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.UUID;

/**
 * 测试rabbitMQ
 */
@RestController
public class RabbitController {

    @Autowired
    private RabbitTemplate rabbitTemplate;


    private String exchange = "hello-java-exchange";


    private String routeKey = "hello.java";


    @GetMapping("/sendMQ")
    public String sendMQ(@RequestParam(value = "num", required = false, defaultValue = "10") Integer num) {

        OrderEntity entity = new OrderEntity();
        entity.setId(1L);
        entity.setCommentTime(new Date());
        entity.setCreateTime(new Date());
        entity.setConfirmStatus(0);
        entity.setAutoConfirmDay(1);
        entity.setGrowth(1);
        entity.setMemberId(12L);

        OrderItemEntity orderEntity = new OrderItemEntity();
        orderEntity.setCategoryId(225L);
        orderEntity.setId(1L);
        orderEntity.setOrderSn("mall");
        orderEntity.setSpuName("华为");
        for (int i = 0; i < num; i++) {
            if (i % 2 == 0) {
                entity.setReceiverName("OrderEntity ==> " + i);
                rabbitTemplate.convertAndSend(this.exchange, this.routeKey, entity, new CorrelationData(UUID.randomUUID().toString().replace("-", "")));
            } else {
                orderEntity.setOrderSn("OrderItemEntity ==> " + i);
                rabbitTemplate.convertAndSend(this.exchange, this.routeKey, orderEntity, new CorrelationData(UUID.randomUUID().toString().replace("-", "")));
                // 测试消息发送失败
                //rabbitTemplate.convertAndSend(this.exchange, "fail", orderEntity);
            }
        }
        return "ok";
    }
}
