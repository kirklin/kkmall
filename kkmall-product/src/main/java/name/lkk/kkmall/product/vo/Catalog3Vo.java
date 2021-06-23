package name.lkk.kkmall.product.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 首页三级分类
 * @author kirklin
 */
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Catalog3Vo {

	private String id;

	private String name;

	private String catalog2Id;
}
