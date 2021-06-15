package name.lkk.kkmall.ware.service;

import com.baomidou.mybatisplus.extension.service.IService;
import name.lkk.common.utils.PageUtils;
import name.lkk.kkmall.ware.entity.WareSkuEntity;

import java.util.Map;

/**
 * 商品库存
 *
 * @author KirkLin
 * @email linkirk@163.com
 * @date 2021-06-07 16:44:32
 */
public interface WareSkuService extends IService<WareSkuEntity> {

    PageUtils queryPage(Map<String, Object> params);

    /**
     * 保存库存的时候顺便查到商品价格
     */
    double addStock(Long skuId, Long wareId, Integer skuNum);

}

