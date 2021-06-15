package name.lkk.kkmall.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import name.lkk.common.utils.PageUtils;
import name.lkk.kkmall.product.entity.AttrEntity;
import name.lkk.kkmall.product.vo.AttrGroupRelationVo;
import name.lkk.kkmall.product.vo.AttrRespVo;
import name.lkk.kkmall.product.vo.AttrVo;

import java.util.List;
import java.util.Map;

/**
 * 商品属性
 *
 * @author KirkLin
 * @email linkirk@163.com
 * @date 2021-06-07 15:14:37
 */
public interface AttrService extends IService<AttrEntity> {

    PageUtils queryPage(Map<String, Object> params);

    void saveAttr(AttrVo attrVo);

    /**
     * 规格参数的分页模糊查询
     */
    PageUtils queryBaseAttrPage(Map<String, Object> params, Long catelogId, String attrType);

    /**
     *
     */
    AttrRespVo getAttrInfo(Long attrId);

    /**
     * 更改规格参数：参数名、参数id、参数、状态的一一对应
     */
    void updateAttr(AttrVo attrVo);

    List<AttrEntity> getRelationAttr(Long attrgroupId);

    void deleteRelation(AttrGroupRelationVo[] vos);

    PageUtils getNoRelationAttr(Map<String, Object> params, Long attrgroupId);

    /**
     * 在指定的集合里面挑出可检索的属性
     */
    List<Long> selectSearchAttrIds(List<Long> attrIds);
}


