package name.lkk.kkmall.product.vo;


import lombok.Data;
import name.lkk.kkmall.product.entity.AttrEntity;

import java.util.List;

@Data
public class AttrGroupWithAttrsVo {

    /**
     * 分组id
     */
    private Long attrGroupId;
    /**
     * 组名
     */
    private String attrGroupName;
    /**
     * 排序
     */
    private Integer sort;
    /**
     * 描述
     */
    private String descript;
    /**
     * 组图标
     */
    private String icon;
    /**
     * 所属分类id
     */
    private Long catelogId;

	/**
	 * 保存整个实体信息
	 */
	private List<AttrEntity> attrs;
}
