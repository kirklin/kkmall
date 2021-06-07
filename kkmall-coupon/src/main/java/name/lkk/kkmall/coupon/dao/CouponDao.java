package name.lkk.kkmall.coupon.dao;

import name.lkk.kkmall.coupon.entity.CouponEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 优惠券信息
 * 
 * @author KirkLin
 * @email linkirk@163.com
 * @date 2021-06-07 16:10:19
 */
@Mapper
public interface CouponDao extends BaseMapper<CouponEntity> {
	
}
