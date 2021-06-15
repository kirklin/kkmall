package name.lkk.kkmall.coupon.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import name.lkk.common.to.MemberPrice;
import name.lkk.common.to.SkuReductionTO;
import name.lkk.common.utils.PageUtils;
import name.lkk.common.utils.Query;
import name.lkk.kkmall.coupon.dao.SkuFullReductionDao;
import name.lkk.kkmall.coupon.entity.MemberPriceEntity;
import name.lkk.kkmall.coupon.entity.SkuFullReductionEntity;
import name.lkk.kkmall.coupon.entity.SkuLadderEntity;
import name.lkk.kkmall.coupon.service.MemberPriceService;
import name.lkk.kkmall.coupon.service.SkuFullReductionService;
import name.lkk.kkmall.coupon.service.SkuLadderService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;


@Service("skuFullReductionService")
public class SkuFullReductionServiceImpl extends ServiceImpl<SkuFullReductionDao, SkuFullReductionEntity> implements SkuFullReductionService {

    @Autowired
    private SkuLadderService skuLadderService;

    @Autowired

    private MemberPriceService memberPriceService;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<SkuFullReductionEntity> page = this.page(
                new Query<SkuFullReductionEntity>().getPage(params),
                new QueryWrapper<SkuFullReductionEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public void saveSkuReduction(SkuReductionTO skuReductionTO) {

        // 保存sku的优惠、满减、会员价格等信息  [跨库] sms_sku_ladder
        SkuLadderEntity skuLadderEntity = new SkuLadderEntity();
        skuLadderEntity.setSkuId(skuReductionTO.getSkuId());
        skuLadderEntity.setFullCount(skuReductionTO.getFullCount());
        skuLadderEntity.setDiscount(skuReductionTO.getDiscount());
        // 是否参加其他优惠
        skuLadderEntity.setAddOther(skuReductionTO.getCountStatus());
        // 有的满减条件才保存
        if (skuReductionTO.getFullCount() > 0) {
            skuLadderService.save(skuLadderEntity);
        }
        skuLadderService.save(skuLadderEntity);

        // sms_sku_full_reduction
        SkuFullReductionEntity skuFullReductionEntity = new SkuFullReductionEntity();
        BeanUtils.copyProperties(skuReductionTO, skuFullReductionEntity);
        if ((skuFullReductionEntity.getFullPrice().compareTo(new BigDecimal("0")) == 1)) {
            this.save(skuFullReductionEntity);
        }

        // sms_member_price  保存价格等属性
        List<MemberPrice> memberPrice = skuReductionTO.getMemberPrice();
        List<MemberPriceEntity> collect = memberPrice.stream().map(m -> {
            MemberPriceEntity priceEntity = new MemberPriceEntity();
            priceEntity.setSkuId(skuReductionTO.getSkuId());
            priceEntity.setMemberLevelId(m.getId());
            priceEntity.setMemberLevelName(m.getName());
            priceEntity.setMemberPrice(m.getPrice());
            priceEntity.setAddOther(1);

            return priceEntity;

        }).filter(item ->
                // 输入的商品价格必须要大于0才保存
                (item.getMemberPrice().compareTo(new BigDecimal("0")) > 0)
        ).collect(Collectors.toList());
        memberPriceService.saveBatch(collect);
    }

}