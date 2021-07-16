package name.lkk.kkmall.order.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import name.lkk.kkmall.order.entity.OrderEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * 订单
 *
 * @author KirkLin
 * @email linkirk@163.com
 * @date 2021-06-07 16:38:57
 */
@Mapper
public interface OrderDao extends BaseMapper<OrderEntity> {
    /**
     * 修改订单状态
     *
     * @param orderSn
     * @param code
     */
    void updateOrderStatus(@Param("orderSn") String orderSn, @Param("code") Integer code);
}
