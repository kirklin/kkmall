package name.lkk.kkmall.member.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import name.lkk.kkmall.member.entity.MemberLevelEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 会员等级
 * 
 * @author KirkLin
 * @email linkirk@163.com
 * @date 2021-06-07 16:27:46
 */
@Mapper
public interface MemberLevelDao extends BaseMapper<MemberLevelEntity> {
    MemberLevelEntity getDefaultLevel();
}
