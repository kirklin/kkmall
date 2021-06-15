package name.lkk.kkmall.ware.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import name.lkk.kkmall.ware.entity.WareSkuEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * 商品库存
 * 
 * @author KirkLin
 * @email linkirk@163.com
 * @date 2021-06-07 16:44:32
 */
@Mapper
public interface WareSkuDao extends BaseMapper<WareSkuEntity> {

    void addStock(@Param("skuId") Long skuId, @Param("wareId") Long wareId, @Param("skuNum") Integer skuNum);

}
