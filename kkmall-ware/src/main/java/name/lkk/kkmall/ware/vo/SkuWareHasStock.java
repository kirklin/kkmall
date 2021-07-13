package name.lkk.kkmall.ware.vo;

import lombok.Data;

import java.util.List;

/**
 * @author: kirklin
 * @date: 2021/7/13 4:57 下午
 * @description:
 */
@Data
public class SkuWareHasStock {
    private Long skuId;

    private List<Long> wareId;

    private Integer num;
}
