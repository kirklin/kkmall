package name.lkk.kkmall.product.vo;

import lombok.Data;
import name.lkk.kkmall.product.entity.SkuImagesEntity;
import name.lkk.kkmall.product.entity.SkuInfoEntity;
import name.lkk.kkmall.product.entity.SpuInfoDescEntity;

import java.util.List;

/**
 * 查询商品详情VO
 */
@Data
public class SkuItemVo {

	/**
	 * 基本信息
	 */
	SkuInfoEntity info;

	boolean hasStock = true;

	/**
	 * 图片信息
	 */
	List<SkuImagesEntity> images;

	/**
	 * 销售属性组合
	 */
	List<ItemSaleAttrVo> saleAttr;

	/**
	 * 介绍
	 */
	SpuInfoDescEntity desc;

	/**
	 * 参数规格信息
	 */
	List<SpuItemAttrGroup> groupAttrs;

	/**
	 * 秒杀信息
	 */
	SeckillInfoVo seckillInfoVo;
}
