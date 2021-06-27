package name.lkk.kkmall.mq.service.impl;

import com.alibaba.fastjson.JSON;
import lombok.extern.slf4j.Slf4j;
import name.lkk.common.utils.R;
import name.lkk.kkmall.mq.service.ConsumerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

/**
 * @author: kirklin
 * @date: 2021/6/26 4:17 下午
 * @description: 消费者
 */
@Service
@Slf4j
public class ConsumerServiceImpl implements ConsumerService {
    @Autowired
    private RedisTemplate redisTemplate;
//    private static Logger logger = LoggerFactory.getLogger(ConsumerServiceImpl.class);

    @Override
    public void receiveMessage(String message) {
        R r = JSON.parseObject(message, R.class);
        log.info("消息队列==> "+r);
    }

}