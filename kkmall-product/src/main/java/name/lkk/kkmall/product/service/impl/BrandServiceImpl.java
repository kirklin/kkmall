package name.lkk.kkmall.product.service.impl;

import name.lkk.kkmall.product.service.CategoryBrandRelationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import name.lkk.common.utils.PageUtils;
import name.lkk.common.utils.Query;

import name.lkk.kkmall.product.dao.BrandDao;
import name.lkk.kkmall.product.entity.BrandEntity;
import name.lkk.kkmall.product.service.BrandService;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;


@Service("brandService")
public class BrandServiceImpl extends ServiceImpl<BrandDao, BrandEntity> implements BrandService {
    @Autowired
    private CategoryBrandRelationService categoryBrandRelationService;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<BrandEntity> page = this.page(
                new Query<BrandEntity>().getPage(params),
                new QueryWrapper<BrandEntity>()
        );

        return new PageUtils(page);
    }

    /**
     * 当品牌进行更新的时候 保证关联表的数据也需要进行更新
     */
    @Transactional
    @Override
    public void updateDetail(BrandEntity brand) {
        // 保证冗余字段的数据一致
        this.updateById(brand);
        if(!StringUtils.isEmpty(brand.getName())){
            // 同步更新其他关联表的数据
            categoryBrandRelationService.updateBrand(brand.getBrandId(), brand.getName());
            // TODO 更新其它关联

        }
    }

    @Override
    public List<BrandEntity> getBrandByIds(List<Long> brandIds) {
        return baseMapper.selectList(new QueryWrapper<BrandEntity>().in("brand_id",brandIds));
    }
}