package name.lkk.kkmall.ware.service;

import com.baomidou.mybatisplus.extension.service.IService;
import name.lkk.common.to.es.SkuHasStockVo;
import name.lkk.common.to.mq.OrderTo;
import name.lkk.common.to.mq.StockLockedTo;
import name.lkk.common.utils.PageUtils;
import name.lkk.kkmall.ware.entity.WareSkuEntity;
import name.lkk.kkmall.ware.vo.WareSkuLockVo;

import java.util.List;
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

    /**
     * 查询sku是否有库存
     *
     * @param skuIds
     * @return
     */
    List<SkuHasStockVo> getSkuHasStock(List<Long> skuIds);

    Boolean orderLockStock(WareSkuLockVo vo);


    void unlockStock(StockLockedTo to);

    /**
     * 由于订单超时而自动释放订单之后来解锁库存
     */
    void unlockStock(OrderTo to);
}

