package name.lkk.kkmall.mq.config;

import name.lkk.kkmall.mq.service.ConsumerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.listener.PatternTopic;
import org.springframework.data.redis.listener.RedisMessageListenerContainer;
import org.springframework.data.redis.listener.adapter.MessageListenerAdapter;

import java.util.concurrent.ThreadPoolExecutor;

/**
 * @Description redis消息队列的监听者
 */
@Configuration
public class ListenerConfig {

    @Autowired
    ThreadPoolExecutor threadPoolExecutor;

    @Bean
    RedisMessageListenerContainer container(RedisConnectionFactory connectionFactory,
                                            MessageListenerAdapter listenerAdapter) {
        RedisMessageListenerContainer container = new RedisMessageListenerContainer();
        container.setConnectionFactory(connectionFactory);
        container.addMessageListener(listenerAdapter, new PatternTopic("lkk"));
        container.setTaskExecutor(threadPoolExecutor);
        return container;
    }

    /**
     * 利用反射来创建监听到的消息之后执行方法
     *
     * @param consumerService
     * @return
     */
    @Bean
    MessageListenerAdapter listenerAdapter(ConsumerService consumerService) {
        return new MessageListenerAdapter(consumerService, "receiveMessage");
    }

    /**
     * 使用默认的工厂初始化redis操作模板
     *
     * @param connectionFactory
     * @return
     */
    @Bean
    StringRedisTemplate template(RedisConnectionFactory connectionFactory) {
        return new StringRedisTemplate(connectionFactory);
    }

}
