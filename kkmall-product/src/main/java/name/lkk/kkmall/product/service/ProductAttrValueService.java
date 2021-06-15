package name.lkk.kkmall.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import name.lkk.common.utils.PageUtils;
import name.lkk.kkmall.product.entity.ProductAttrValueEntity;

import java.util.List;
import java.util.Map;

/**
 * spu属性值
 *
 * @author KirkLin
 * @email linkirk@163.com
 * @date 2021-06-07 15:14:37
 */
public interface ProductAttrValueService extends IService<ProductAttrValueEntity> {

    PageUtils queryPage(Map<String, Object> params);

    void saveProductAttr(List<ProductAttrValueEntity> collect);

    /**
     * 查询规格属性
     */
    List<ProductAttrValueEntity> baseAttrListForSpu(Long spuId);

    /**
     * 更新属性的规格
     */
    void updateSpuAttr(Long spuId, List<ProductAttrValueEntity> entities);
}

