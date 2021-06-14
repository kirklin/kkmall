package name.lkk.kkmall.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import name.lkk.common.utils.PageUtils;
import name.lkk.kkmall.product.entity.CategoryEntity;

import java.util.List;
import java.util.Map;

/**
 * 商品三级分类
 *
 * @author KirkLin
 * @email linkirk@163.com
 * @date 2021-06-07 15:14:37
 */
public interface CategoryService extends IService<CategoryEntity> {

    PageUtils queryPage(Map<String, Object> params);

    /**
     * 查出所有分类 以及子分类，以树形结构组装起来
     * @return
     */
    List<CategoryEntity> listWithTree();


    /**
     * 递归找所有的子菜单、中途要排序
     * @param root
     * @param all
     * @return
     */
    List<CategoryEntity> getChildrens(CategoryEntity root, List<CategoryEntity> all);

    void removeMenuByIds(List<Long> asList);
    /**
     * 找到catalogId 完整路径
     */
    Long[] findCateLogPath(Long catelogId);

}

