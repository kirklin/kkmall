package name.lkk.kkmall.ware.listener;


import com.rabbitmq.client.Channel;
import name.lkk.common.to.mq.OrderTo;
import name.lkk.common.to.mq.StockLockedTo;
import name.lkk.kkmall.ware.service.WareSkuService;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;


@Service
@RabbitListener(queues = "${kkMallRabbitmq.MQConfig.queues}")
public class StockReleaseListener {

	@Autowired
	private WareSkuService wareSkuService;

	/**
	 * 下单成功 库存解锁 接下来业务调用失败
	 * <p>
	 * 只要解锁库存消息失败 一定要告诉服务解锁失败
	 */
	@RabbitHandler
	public void handleStockLockedRelease(StockLockedTo to, Message message, Channel channel) throws IOException {
		try {
			wareSkuService.unlockStock(to);
			// 执行成功的 回复 [仅回复自己的消息]
			channel.basicAck(message.getMessageProperties().getDeliveryTag(), false);
		} catch (Exception e) {
			channel.basicReject(message.getMessageProperties().getDeliveryTag(), true);
		}
	}

	/**
	 * 订单关闭后 发送的消息这里接收
	 */
	@RabbitHandler
	public void handleOrderCloseRelease(OrderTo to, Message message, Channel channel) throws IOException {
		try {
			wareSkuService.unlockStock(to);
			channel.basicAck(message.getMessageProperties().getDeliveryTag(), false);
		} catch (Exception e) {
			channel.basicReject(message.getMessageProperties().getDeliveryTag(), true);
		}
	}
}
