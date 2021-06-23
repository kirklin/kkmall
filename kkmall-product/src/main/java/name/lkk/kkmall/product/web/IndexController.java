package name.lkk.kkmall.product.web;

import name.lkk.kkmall.product.entity.CategoryEntity;
import name.lkk.kkmall.product.service.CategoryService;
import name.lkk.kkmall.product.vo.Catelog2Vo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * @author: kirklin
 * @date: 2021/6/22 8:39 下午
 * @description:
 */
@Controller
public class IndexController {

    @Autowired
    private CategoryService categoryService;

    @RequestMapping("/hello")
    @ResponseBody
    public String hello(){
        return "Hello";
    }

    @RequestMapping({"/", "index", "/index.html"})
    public String indexPage(Model model) {
        // 获取一级分类所有缓存
        List<CategoryEntity> categorys = categoryService.getLevel1Categories();
        model.addAttribute("categorys", categorys);
        return "index";
    }

    /**
     * 首页二，三级分类
     * @return
     */
    @ResponseBody
    @RequestMapping("index/json/catalog.json")
    public Map<String, List<Catelog2Vo>> getCatelogJson() {

        Map<String, List<Catelog2Vo>> map = categoryService.getCatelogJson();
        return map;
    }
}
