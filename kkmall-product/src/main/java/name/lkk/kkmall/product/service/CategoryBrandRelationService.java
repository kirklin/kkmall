package name.lkk.kkmall.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import name.lkk.common.utils.PageUtils;
import name.lkk.kkmall.product.entity.CategoryBrandRelationEntity;

import java.util.Map;

/**
 * 品牌分类关联
 *
 * @author KirkLin
 * @email linkirk@163.com
 * @date 2021-06-07 15:14:37
 */
public interface CategoryBrandRelationService extends IService<CategoryBrandRelationEntity> {

    PageUtils queryPage(Map<String, Object> params);

    void updateBrand(Long brandId, String name);

}

