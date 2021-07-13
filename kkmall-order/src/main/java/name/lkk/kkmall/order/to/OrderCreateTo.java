package name.lkk.kkmall.order.to;


import lombok.Data;
import name.lkk.kkmall.order.entity.OrderEntity;
import name.lkk.kkmall.order.entity.OrderItemEntity;

import java.math.BigDecimal;
import java.util.List;


@Data
public class OrderCreateTo {

    private OrderEntity order;

    private List<OrderItemEntity> orderItems;

    /**
     * 订单计算的应付价格
     */
    private BigDecimal payPrice;

    /**
     * 运费
     */
    private BigDecimal fare;
}
