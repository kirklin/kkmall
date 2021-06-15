package name.lkk.kkmall.ware.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import name.lkk.common.utils.PageUtils;
import name.lkk.common.utils.Query;
import name.lkk.kkmall.ware.dao.PurchaseDetailDao;
import name.lkk.kkmall.ware.entity.PurchaseDetailEntity;
import name.lkk.kkmall.ware.service.PurchaseDetailService;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import java.util.List;
import java.util.Map;


@Service("purchaseDetailService")
public class PurchaseDetailServiceImpl extends ServiceImpl<PurchaseDetailDao, PurchaseDetailEntity> implements PurchaseDetailService {

    /**
     * 采购需求模糊查询
     * status: 0
     * wareId: 1
     */
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        QueryWrapper<PurchaseDetailEntity> wrapper = new QueryWrapper<>();

        String key = (String) params.get("key");
        if(!ObjectUtils.isEmpty(key)){
            // 连续拼接
            wrapper.and(w-> w.eq("purchase_id",key).or().eq("sku_id",key));
        }

        String status = (String) params.get("status");
        if(!ObjectUtils.isEmpty(status)){
            wrapper.eq("status", status);
        }
        String wareId = (String) params.get("wareId");
        if(!ObjectUtils.isEmpty(wareId)){
            wrapper.eq("ware_id", wareId);
        }

        IPage<PurchaseDetailEntity> page = this.page(
                new Query<PurchaseDetailEntity>().getPage(params),
                wrapper
        );

        return new PageUtils(page);
    }

    /**
     * 根据采购单id 改变采购项
     */
    @Override
    public List<PurchaseDetailEntity> listDetailByPurchaseId(Long id) {
        // 获取所有采购项
        List<PurchaseDetailEntity> entities = this.list(new QueryWrapper<PurchaseDetailEntity>().eq("purchase_id", id));
        return entities;
    }

}