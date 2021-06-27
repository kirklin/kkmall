package name.lkk.kkmall.mq.service.impl;

import com.alibaba.fastjson.JSON;
import lombok.extern.slf4j.Slf4j;
import name.lkk.kkmall.mq.service.ProducerService;
import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

/**
 * @author: kirklin
 * @date: 2021/6/26 4:18 下午
 * @description: 生产者
 */
@Service
@Slf4j
public class ProducerServiceImpl implements ProducerService {
    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    @Autowired
    private RedissonClient redissonClient;

    @Override
    public String publish(String channel, Object msgObj) {
        RLock lock = redissonClient.getLock("my-lock");
        lock.lock();
        try {
            log.info("加锁成功");
            stringRedisTemplate.convertAndSend(channel, JSON.toJSONString(msgObj));
            return "消息发送成功了"+JSON.toJSONString(msgObj);

        } catch (Exception e) {
            e.printStackTrace();
            return "消息发送失败了"+e;
        }finally {
            lock.unlock();
            log.info("解锁成功");
        }
    }
}
