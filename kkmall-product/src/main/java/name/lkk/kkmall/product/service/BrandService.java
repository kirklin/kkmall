package name.lkk.kkmall.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import name.lkk.common.utils.PageUtils;
import name.lkk.kkmall.product.entity.BrandEntity;

import java.util.List;
import java.util.Map;

/**
 * 品牌
 *
 * @author KirkLin
 * @email linkirk@163.com
 * @date 2021-06-07 15:14:37
 */
public interface BrandService extends IService<BrandEntity> {

    PageUtils queryPage(Map<String, Object> params);

    /**
     * 当品牌进行更新的时候 保证关联表的数据也需要进行更新
     */
    void updateDetail(BrandEntity brand);

    List<BrandEntity> getBrandByIds(List<Long> brandIds);

}

