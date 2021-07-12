package name.lkk.kkmall.order.vo;

import lombok.Data;

import java.math.BigDecimal;


@Data
public class OrderSubmitVo {

    private Long addrId;

    private Integer payType;

    // 无需要购买的商品 去购物车再获取一遍
    // 优惠

    /**
     * 防重令牌
     */
    private String orderToken;

    /**
     * 应付价格
     */
    private BigDecimal payPrice;

    private String note;
    // 用户相关信息 直接去session里面取
}
