package name.lkk.kkmall.product.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import name.lkk.kkmall.product.entity.CategoryBrandRelationEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * 品牌分类关联
 * 
 * @author KirkLin
 * @email linkirk@163.com
 * @date 2021-06-07 15:14:37
 */
@Mapper
public interface CategoryBrandRelationDao extends BaseMapper<CategoryBrandRelationEntity> {

    void updateCategory(@Param("catId") Long catId, String name);

}
