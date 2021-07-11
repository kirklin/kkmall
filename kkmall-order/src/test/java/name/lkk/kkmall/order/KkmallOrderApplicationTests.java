package name.lkk.kkmall.order;

import lombok.extern.slf4j.Slf4j;
import name.lkk.kkmall.order.entity.OrderEntity;
import name.lkk.kkmall.order.entity.OrderItemEntity;
import name.lkk.kkmall.order.entity.OrderReturnReasonEntity;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.amqp.core.*;
import org.springframework.amqp.rabbit.connection.CorrelationData;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

@Slf4j
@SpringBootTest
class KkmallOrderApplicationTests {

    @Autowired
    private AmqpAdmin amqpAdmin;

    @Autowired
    private RabbitTemplate rabbitTemplate;


    private String queue = "hello-java-queue";


    private String exchange = "hello-java-exchange";


    private String routeKey = "hello.java";

    @Test
    public void sendMessageTest2() {
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
        for (int i = 0; i < 10; i++) {
            if (i % 2 == 0) {
                entity.setReceiverName("OrderEntity-" + i);
                rabbitTemplate.convertAndSend(this.exchange, this.routeKey, entity, new CorrelationData(UUID.randomUUID().toString().replace("-", "")));
            } else {
                orderEntity.setOrderSn("OrderItemEntity-" + i);
                rabbitTemplate.convertAndSend(this.exchange, this.routeKey, orderEntity, new CorrelationData(UUID.randomUUID().toString().replace("-", "")));
            }
            log.info("\n路由键：" + this.routeKey + "的消息发送成功");
        }
    }

    @Test
    public void sendMessageTest() {
        OrderReturnReasonEntity reasonEntity = new OrderReturnReasonEntity();
        reasonEntity.setId(1L);
        reasonEntity.setCreateTime(new Date());
        reasonEntity.setName("reason");
        reasonEntity.setStatus(1);
        reasonEntity.setSort(2);
        String msg = "Hello World";
        //1、发送消息,如果发送的消息是个对象，会使用序列化机制，将对象写出去，对象必须实现Serializable接口

        //2、发送的对象类型的消息，可以是一个json
//        rabbitTemplate.convertAndSend("hello-java-exchange","hello.java",
//                reasonEntity,new CorrelationData(UUID.randomUUID().toString()));
        for (int i = 0; i < 10; i++) {
            if (i % 2 == 1) {
                rabbitTemplate.convertAndSend("hello-java-exchange", "hello.java",
                        reasonEntity, new CorrelationData(UUID.randomUUID().toString()));
            } else {
                rabbitTemplate.convertAndSend("hello-java-exchange", "hello2.java",
                        reasonEntity, new CorrelationData(UUID.randomUUID().toString()));
            }
        }
        log.info("消息发送完成:{}", reasonEntity);
    }

    /**
     * 1、如何创建Exchange、Queue、Binding
     * 1）、使用AmqpAdmin进行创建
     * 2、如何收发消息
     */
    @Test
    @DisplayName("创建一个交换器 ")
    public void createExchange() {

        Exchange directExchange = new DirectExchange("hello-java-exchange", true, false);
        amqpAdmin.declareExchange(directExchange);
        log.info("Exchange[{}]创建成功：", "hello-java-exchange");
    }


    @Test
    @DisplayName("创建一个队列")
    public void testCreateQueue() {
        Queue queue = new Queue("hello-java-queue", true, false, false);
        amqpAdmin.declareQueue(queue);
        log.info("Queue[{}]创建成功：", "hello-java-queue");
    }

    /**
     * 目的地					目的地类型				交换机				路由键
     * String destination, DestinationType destinationType, String exchange, String routingKey,
     *
     * @Nullable Map<String, Object> arguments
     */
    @Test
    @DisplayName("创建一个绑定")
    public void createBinding() {

        Binding binding = new Binding("hello-java-queue",
                Binding.DestinationType.QUEUE,
                "hello-java-exchange",
                "hello.java",
                null);
        amqpAdmin.declareBinding(binding);
        log.info("Binding[{}]创建成功：", "hello-java-binding");

    }

    @Test
    public void create() {
        HashMap<String, Object> arguments = new HashMap<>();
        arguments.put("x-dead-letter-exchange", "order-event-exchange");
        arguments.put("x-dead-letter-routing-key", "order.release.order");
        arguments.put("x-message-ttl", 60000); // 消息过期时间 1分钟
        Queue queue = new Queue("order.delay.queue", true, false, false, arguments);
        amqpAdmin.declareQueue(queue);
        log.info("Queue[{}]创建成功：", "order.delay.queue");
    }

    @Test
    void contextLoads() {
    }

}
