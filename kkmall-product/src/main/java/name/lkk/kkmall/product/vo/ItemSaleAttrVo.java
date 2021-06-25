package name.lkk.kkmall.product.vo;

import lombok.Data;
import lombok.ToString;

import java.util.List;

/**
 * 查询商品详情VO - > 销售属性组合
 * @author kirklin
 */
@ToString
@Data
public class ItemSaleAttrVo{
	private Long attrId;

	private String attrName;

	private List<AttrValueWithSkuIdVo> attrValues;
}