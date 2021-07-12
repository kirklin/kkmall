package name.lkk.kkmall.order.vo;

import lombok.Data;

import java.math.BigDecimal;

/**
 * 商品运费
 */
@Data
public class FareVo {
    private MemberAddressVo memberAddressVo;

    private BigDecimal fare;
}
