package name.lkk.kkmall.ware.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import name.lkk.common.utils.PageUtils;
import name.lkk.common.utils.Query;
import name.lkk.kkmall.ware.dao.WareInfoDao;
import name.lkk.kkmall.ware.entity.WareInfoEntity;
import name.lkk.kkmall.ware.service.WareInfoService;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import java.util.Map;


@Service("wareInfoService")
public class WareInfoServiceImpl extends ServiceImpl<WareInfoDao, WareInfoEntity> implements WareInfoService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        QueryWrapper<WareInfoEntity> wrapper = new QueryWrapper<>();

        String key = (String) params.get("key");
        if(!ObjectUtils.isEmpty(key)){
            wrapper.eq("id", key).or().like("name",key).or().like("address", key).or().like("areacode", key);
        }
        IPage<WareInfoEntity> page = this.page(
                new Query<WareInfoEntity>().getPage(params),
                wrapper
        );
        return new PageUtils(page);
    }

}