package name.lkk.kkmall.product.controller;

import name.lkk.common.utils.PageUtils;
import name.lkk.common.utils.R;
import name.lkk.kkmall.product.entity.SkuInfoEntity;
import name.lkk.kkmall.product.service.SkuInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;



/**
 * sku信息
 *
 * @author KirkLin
 * @email linkirk@163.com
 * @date 2021-06-07 15:14:37
 */
@RestController
@RequestMapping("product/skuinfo")
public class SkuInfoController {
    @Autowired
    private SkuInfoService skuInfoService;

    @GetMapping("/{skuId}/price")
    public R getPrice(@PathVariable("skuId") Long skuId){

        SkuInfoEntity byId = skuInfoService.getById(skuId);
        return R.ok().setData(byId.getPrice().toString());
    }

    /**
     * SKU查询
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = skuInfoService.queryPageByCondition(params);

        return R.ok().put("page", page);
    }

    /**
     * 信息
     * 		库存保存的时候会远程调用这个接口
     */
    @RequestMapping("/info/{skuId}")
    public R info(@PathVariable("skuId") Long skuId){
        SkuInfoEntity skuInfo = skuInfoService.getById(skuId);

        return R.ok().put("skuInfo", skuInfo);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody SkuInfoEntity skuInfo){
        skuInfoService.save(skuInfo);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody SkuInfoEntity skuInfo){
        skuInfoService.updateById(skuInfo);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    //@RequiresPermissions("${moduleNamez}:skuinfo:delete")
    public R delete(@RequestBody Long[] skuIds){
        skuInfoService.removeByIds(Arrays.asList(skuIds));

        return R.ok();
    }
}

