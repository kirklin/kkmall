package name.lkk.kkmall.product.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import name.lkk.kkmall.product.entity.SkuSaleAttrValueEntity;
import name.lkk.kkmall.product.vo.ItemSaleAttrVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * sku销售属性&值
 * 
 * @author KirkLin
 * @email linkirk@163.com
 * @date 2021-06-07 15:14:37
 */
@Mapper
public interface SkuSaleAttrValueDao extends BaseMapper<SkuSaleAttrValueEntity> {

    List<ItemSaleAttrVo> getSaleAttrsBuSpuId(@Param("spuId") Long spuId);

    List<String> getSkuSaleAttrValuesAsStringList(@Param("skuId") Long skuId);
}
