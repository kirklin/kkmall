package name.lkk.kkmall.mq.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.concurrent.Executors;
import java.util.concurrent.LinkedBlockingDeque;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

@Configuration
public class MyThreadConfig {

	@Bean
	public ThreadPoolExecutor threadPoolExecutor(ThreadPoolConfigProperties threadPoolConfigProperties){
		/**
		 * 线程池创建的七个参数
		 * @param corePoolSize 线程池核心线程大小
		 * @param maximumPoolSize 线程最大线程数量
		 * @param keepAliveTime 空闲线程存活时间
		 * @param unit 空闲线程存活时间单位
		 * @param workQueue 工作队列
		 * @param threadFactory 线程工厂
		 * @param handler 拒绝策略
		 *                CallerRunsPolicy 直接拒绝
		 *                AbortPolicy 直接丢弃任务并抛异常
		 *                DiscardPolicy 直接丢弃任务，并且什么都不做
		 *                DiscardOldestPolicy 抛弃进入队列最早的任务，然后尝试把这次拒绝的任务放入队列
		 *
		 */
		return new ThreadPoolExecutor(threadPoolConfigProperties.getCoreSize(), threadPoolConfigProperties.getMaxSize(), threadPoolConfigProperties.getKeepAliveTime() , TimeUnit.SECONDS, new LinkedBlockingDeque<>(10000), Executors.defaultThreadFactory(),new ThreadPoolExecutor.AbortPolicy());
	}
}
