package name.lkk.kkmall.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import name.lkk.common.utils.PageUtils;
import name.lkk.kkmall.product.entity.SpuInfoEntity;
import name.lkk.kkmall.product.vo.SpuSaveVo;

import java.util.Map;

/**
 * spu信息
 *
 * @author KirkLin
 * @email linkirk@163.com
 * @date 2021-06-07 15:14:37
 */
public interface SpuInfoService extends IService<SpuInfoEntity> {

    PageUtils queryPage(Map<String, Object> params);


    void saveBatchSpuInfo(SpuInfoEntity spuInfoEntity);

    /**
     * SPU模糊查询
     */
    PageUtils queryPageByCondition(Map<String, Object> params);

    /**
     * 返回一个SpuEntity
     */
    SpuInfoEntity getSpuInfoBySkuId(Long skuId);

    void saveSpuInfo(SpuSaveVo vo);
}

