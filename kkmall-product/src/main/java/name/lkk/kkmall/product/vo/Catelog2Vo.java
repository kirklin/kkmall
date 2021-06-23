package name.lkk.kkmall.product.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

/**
 * 首页二级分类
 * @author kirklin
 */
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Catelog2Vo implements Serializable {

	private String id;

	private String name;

	private String catalog1Id;

	private List<Catalog3Vo> catalog3List;
}
