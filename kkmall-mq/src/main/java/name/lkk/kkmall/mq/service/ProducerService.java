package name.lkk.kkmall.mq.service;

/**
 * @author: kirklin
 * @date: 2021/6/26 4:16 下午
 * @description:
 */
public interface ProducerService {

    public String publish(String channel, Object msgObj);

}
