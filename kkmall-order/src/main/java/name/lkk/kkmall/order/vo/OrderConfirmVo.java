package name.lkk.kkmall.order.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

/**
 * 订单确认页需要的数据
 */
@ToString
public class OrderConfirmVo {

    /**
     * 收获地址
     */
    @Setter
    @Getter
    List<MemberAddressVo> address;

    /**
     * 所有选中的购物项
     */
    @Setter
    @Getter
    List<OrderItemVo> items;

    /**
     * 发票记录
     **/
    @Getter
    @Setter
    /** 优惠券（会员积分） **/
    private Integer integration;

    /**
     * 防重令牌
     */
    @Setter
    @Getter
    private String orderToken;

    @Setter
    @Getter
    Map<Long, Boolean> stocks;

    /**
     * 获取商品总价格
     */
    public BigDecimal getTotal() {
        BigDecimal sum = new BigDecimal("0");
        if (items != null) {
            for (OrderItemVo item : items) {
                sum = sum.add(item.getPrice().multiply(new BigDecimal(item.getCount().toString())));
            }
        }
        return sum;
    }

    /**
     * 应付的价格
     */
    public BigDecimal getPayPrice() {
        return getTotal();
    }

    public Integer getCount() {
        Integer i = 0;
        if (items != null) {
            for (OrderItemVo item : items) {
                i += item.getCount();
            }
        }
        return i;
    }
    /**
     * 发票信息...
     */
}
