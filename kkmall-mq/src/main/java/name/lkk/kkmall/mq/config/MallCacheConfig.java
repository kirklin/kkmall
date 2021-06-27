package name.lkk.kkmall.mq.config;

import org.springframework.boot.autoconfigure.cache.CacheProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.cache.RedisCacheConfiguration;
import org.springframework.data.redis.serializer.GenericJackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.RedisSerializationContext;
import org.springframework.data.redis.serializer.StringRedisSerializer;

/**
 * @author: kirklin
 * @date: 2021/6/24 3:32 下午
 * @description:Spring Cache配置
 */
@Configuration
@EnableCaching
@EnableConfigurationProperties(CacheProperties.class)
public class MallCacheConfig {
    /**
     * 配置文件中 TTL设置没用上
     *
     * 原来:
     * @ConfigurationProperties(prefix = "spring.cache")
     * public class CacheProperties
     *
     * 现在要让这个配置文件生效	: @EnableConfigurationProperties(CacheProperties.class)
     *
     */
    @Bean
    RedisCacheConfiguration redisCacheConfiguration(CacheProperties cacheProperties){

        RedisCacheConfiguration config = RedisCacheConfiguration.defaultCacheConfig();

        // 设置kv的序列化机制
        config = config.serializeKeysWith(RedisSerializationContext.SerializationPair.fromSerializer(new StringRedisSerializer()));
        config = config.serializeValuesWith(RedisSerializationContext.SerializationPair.fromSerializer(new GenericJackson2JsonRedisSerializer()));
        CacheProperties.Redis redisProperties = cacheProperties.getRedis();

        // 设置配置
        if(redisProperties.getTimeToLive() != null){
            config = config.entryTtl(redisProperties.getTimeToLive());
        }
        if(redisProperties.getKeyPrefix() != null){
            config = config.prefixCacheNameWith(redisProperties.getKeyPrefix());
        }
        if(!redisProperties.isCacheNullValues()){
            config = config.disableCachingNullValues();
        }
        if(!redisProperties.isUseKeyPrefix()){
            config = config.disableKeyPrefix();
        }
        return config;
    }
}
