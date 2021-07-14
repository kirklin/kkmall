package name.lkk.kkmall.order.config;

import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.Exchange;
import org.springframework.amqp.core.Queue;
import org.springframework.amqp.core.TopicExchange;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.HashMap;
import java.util.Map;

/**
 * Tips:容器中的所有bean都会自动创建到RabbitMQ中 [只在RabbitMQ没有这个队列、交换机、绑定，才会自动创建，反之亦然]
 * 配置订单服务的延迟队列（可靠消息+死信路由）
 */
@Configuration
public class KkMallMQConfig {

	@Value("${kkMallRabbitmq.MQConfig.queues}")
	private String queues;

	@Value("${kkMallRabbitmq.MQConfig.eventExchange}")
	private String eventExchange;

	@Value("${kkMallRabbitmq.MQConfig.routingKey}")
	private String routingKey;

	@Value("${kkMallRabbitmq.MQConfig.delayQueue}")
	private String delayQueue;

	@Value("${kkMallRabbitmq.MQConfig.createOrder}")
	private String createOrder;

	@Value("${kkMallRabbitmq.MQConfig.ReleaseOther}")
	private String ReleaseOther;

	@Value("${kkMallRabbitmq.MQConfig.ReleaseOtherKey}")
	private String ReleaseOtherKey;

	@Value("${kkMallRabbitmq.MQConfig.ttl}")
	private Long ttl;

	/**
	 * String name, boolean durable, boolean exclusive, boolean autoDelete,  @Nullable Map<String, Object> arguments
	 */
	@Bean
	public Queue orderDelayQueue() {
		Map<String, Object> arguments = new HashMap<>(3);
		arguments.put("x-dead-letter-exchange", eventExchange);
		arguments.put("x-dead-letter-routing-key", routingKey);
		arguments.put("x-message-ttl", ttl);
		Queue queue = new Queue(delayQueue, true, false, false, arguments);
		return queue;
	}

	@Bean
	public Queue orderReleaseOrderQueue() {
		Queue queue = new Queue(queues, true, false, false);
		return queue;
	}

	/**
	 * String name, boolean durable, boolean autoDelete, Map<String, Object> arguments
	 *
	 * @return
	 */
	@Bean
	public Exchange orderEventExchange() {

		return new TopicExchange(eventExchange, true, false);
	}

	/**
	 * String destination, DestinationType destinationType, String exchange, String routingKey, @Nullable Map<String, Object> arguments
	 */
	@Bean
	public Binding orderCreateOrderBinding() {

		return new Binding(delayQueue, Binding.DestinationType.QUEUE, eventExchange, createOrder, null);
	}

	/**
	 * Tips：得先保证Ware服务中的队列配置创建成功得先保证Ware服务中的队列配置创建成功，否则会报错
	 */
	@Bean
	public Binding orderReleaseOrderBinding() {

		return new Binding(queues, Binding.DestinationType.QUEUE, eventExchange, routingKey, null);
	}

	/**
	 * Tips：得先保证Ware服务中的队列配置创建成功得先保证Ware服务中的队列配置创建成功，否则会报错
	 * 订单释放直接和库存释放进行绑定
	 */
	@Bean
	public Binding orderReleaseOtherBinding() {

		return new Binding(ReleaseOther, Binding.DestinationType.QUEUE, eventExchange, ReleaseOtherKey + ".#", null);
	}

	@Bean
	public Queue orderSecKillQueue() {
		return new Queue("order.seckill.order.queue", true, false, false);
	}

	@Bean
	public Binding orderSecKillQueueBinding() {
		return new Binding("order.seckill.order.queue", Binding.DestinationType.QUEUE, "order-event-exchange", "order.seckill.order", null);
	}
}
