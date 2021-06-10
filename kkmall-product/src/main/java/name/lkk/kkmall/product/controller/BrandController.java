package name.lkk.kkmall.product.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import name.lkk.common.valid.AddGroup;
import name.lkk.common.valid.UpdateGroup;
import name.lkk.common.valid.UpdateStatusGroup;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import name.lkk.kkmall.product.entity.BrandEntity;
import name.lkk.kkmall.product.service.BrandService;
import name.lkk.common.utils.PageUtils;
import name.lkk.common.utils.R;



/**
 * 品牌
 *
 * @author KirkLin
 * @email linkirk@163.com
 * @date 2021-06-07 15:14:37
 */
@RestController
@RequestMapping("product/brand")
public class BrandController {
    @Autowired
    private BrandService brandService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    //@RequiresPermissions("product:brand:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = brandService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{brandId}")
    //@RequiresPermissions("product:brand:info")
    public R info(@PathVariable("brandId") Long brandId){
		BrandEntity brand = brandService.getById(brandId);

        return R.ok().put("brand", brand);
    }

    @GetMapping("/infos")
    public R info(@RequestParam("brandIds") List<Long> brandIds) {
        List<BrandEntity> brand = brandService.getBrandByIds(brandIds);
        return R.ok().put("data", brand);
    }

    /**
     * 保存 开启JSR303校验 规定这是新增分组 实现新增的规则
     * POSTman：{"name":"aaa","logo":"abc","brandId":1}
     * POSTman :{"name":"aaa","logo":"https://github.com/1046762075","sort":0,"firstLetter":"d","showStatus":0}
     */
    @RequestMapping("/save")
    public R save(@Validated(AddGroup.class) @RequestBody BrandEntity brand) {
        brandService.save(brand);

        return R.ok();
    }

    /**
     * 修改
     * POSTman：{"name":"aaa","logo":"abc"}
     */
    @RequestMapping("/update")
    public R update(@Validated(UpdateGroup.class) @RequestBody BrandEntity brand) {
        brandService.updateDetail(brand);
        return R.ok();
    }

    /**
     * 修改状态
     */
    @RequestMapping("/update/status")
    public R updateStatus(@Validated(UpdateStatusGroup.class) @RequestBody BrandEntity brand) {
        brandService.updateById(brand);
        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    //@RequiresPermissions("product:brand:delete")
    public R delete(@RequestBody Long[] brandIds){
		brandService.removeByIds(Arrays.asList(brandIds));

        return R.ok();
    }

}
