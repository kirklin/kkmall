package name.lkk.kkmall.ware.controller;

import lombok.extern.slf4j.Slf4j;
import name.lkk.common.exception.BizCodeEnum;
import name.lkk.common.exception.NotStockException;
import name.lkk.common.to.es.SkuHasStockVo;
import name.lkk.common.utils.PageUtils;
import name.lkk.common.utils.R;
import name.lkk.kkmall.ware.entity.WareSkuEntity;
import name.lkk.kkmall.ware.service.WareSkuService;
import name.lkk.kkmall.ware.vo.WareSkuLockVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;
import java.util.Map;



/**
 * 商品库存
 *
 * @author KirkLin
 * @email linkirk@163.com
 * @date 2021-06-07 16:44:32
 */
@Slf4j
@RestController
@RequestMapping("ware/waresku")
public class WareSkuController {
    @Autowired
    private WareSkuService wareSkuService;

    @PostMapping("/lock/order")
    public R orderLockStock(@RequestBody WareSkuLockVo vo) {
        try {
            wareSkuService.orderLockStock(vo);
            return R.ok();
        } catch (NotStockException e) {
            log.warn("\n" + e.getMessage());
        }
        return R.error(BizCodeEnum.NOT_STOCK_EXCEPTION.getCode(), BizCodeEnum.NOT_STOCK_EXCEPTION.getMsg());
    }


    /**
     * 查询sku是否有库存
     * 返回当前id stock量
     */
    @PostMapping("/hasStock")
    public R getSkuHasStock(@RequestBody List<Long> skuIds) {
        List<SkuHasStockVo> vos = wareSkuService.getSkuHasStock(skuIds);
        return R.ok().setData(vos);
    }
    /**
     * 列表
     */
    @RequestMapping("/list")
    //@RequiresPermissions("ware:waresku:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = wareSkuService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    //@RequiresPermissions("ware:waresku:info")
    public R info(@PathVariable("id") Long id){
		WareSkuEntity wareSku = wareSkuService.getById(id);

        return R.ok().put("wareSku", wareSku);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    //@RequiresPermissions("ware:waresku:save")
    public R save(@RequestBody WareSkuEntity wareSku){
		wareSkuService.save(wareSku);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    //@RequiresPermissions("ware:waresku:update")
    public R update(@RequestBody WareSkuEntity wareSku){
		wareSkuService.updateById(wareSku);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    //@RequiresPermissions("ware:waresku:delete")
    public R delete(@RequestBody Long[] ids){
		wareSkuService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
