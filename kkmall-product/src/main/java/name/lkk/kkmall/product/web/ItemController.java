package name.lkk.kkmall.product.web;

import name.lkk.kkmall.product.service.SkuInfoService;
import name.lkk.kkmall.product.vo.SkuItemVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.concurrent.ExecutionException;

/**
 * @author: kirklin
 * @date: 2021/6/25 9:04 下午
 * @description: 查询商品详情页面转发器
 */
@Controller
public class ItemController {
    @Autowired
    private SkuInfoService skuInfoService;

    @RequestMapping("/{skuId}.html")
    public String skuItem(@PathVariable("skuId") Long skuId, Model model) throws ExecutionException, InterruptedException {
        SkuItemVo vo = skuInfoService.item(skuId);
        model.addAttribute("item", vo);
        return "item";
    }

}
