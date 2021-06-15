package name.lkk.kkmall.ware.service;

import com.baomidou.mybatisplus.extension.service.IService;
import name.lkk.common.utils.PageUtils;
import name.lkk.kkmall.ware.entity.PurchaseEntity;
import name.lkk.kkmall.ware.vo.MergeVo;
import name.lkk.kkmall.ware.vo.PurchaseDoneVo;

import java.util.List;
import java.util.Map;

/**
 * 采购信息
 *
 * @author KirkLin
 * @email linkirk@163.com
 * @date 2021-06-07 16:44:32
 */
public interface PurchaseService extends IService<PurchaseEntity> {

    PageUtils queryPage(Map<String, Object> params);

    PageUtils queryPageUnreceivePurchase(Map<String, Object> params);

    void mergePurchase(MergeVo mergeVo);

    void received(List<Long> ids);

    void done(PurchaseDoneVo doneVo);
}

