package name.lkk.kkmall.order.vo;


import lombok.Data;
import name.lkk.kkmall.order.entity.OrderEntity;


@Data
public class SubmitOrderResponseVo {

    private OrderEntity orderEntity;

    /**
     * 错误状态码： 0----成功
     */
    private Integer code;
}
