package name.lkk.kkmall.order.dao;

import name.lkk.kkmall.order.entity.OrderSettingEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 订单配置信息
 * 
 * @author KirkLin
 * @email linkirk@163.com
 * @date 2021-06-07 16:38:57
 */
@Mapper
public interface OrderSettingDao extends BaseMapper<OrderSettingEntity> {
	
}
