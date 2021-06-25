package name.lkk.kkmall.product.vo;

import lombok.Data;
import lombok.ToString;

import java.util.List;

/**
 * 查询商品详情VO->参数规格信息
 */
@ToString
@Data
public class SpuItemAttrGroup{
	private String groupName;

	private List<SpuBaseAttrVo> attrs;
}