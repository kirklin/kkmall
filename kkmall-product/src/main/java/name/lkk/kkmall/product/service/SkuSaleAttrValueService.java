package name.lkk.kkmall.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import name.lkk.common.utils.PageUtils;
import name.lkk.kkmall.product.entity.SkuSaleAttrValueEntity;
import name.lkk.kkmall.product.vo.ItemSaleAttrVo;

import java.util.List;
import java.util.Map;

/**
 * sku销售属性&值
 *
 * @author KirkLin
 * @email linkirk@163.com
 * @date 2021-06-07 15:14:37
 */
public interface SkuSaleAttrValueService extends IService<SkuSaleAttrValueEntity> {

    PageUtils queryPage(Map<String, Object> params);
    List<ItemSaleAttrVo> getSaleAttrsBuSpuId(Long spuId);

    List<String> getSkuSaleAttrValuesAsStringList(Long skuId);
}

