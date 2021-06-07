package name.lkk.kkmall.member.dao;

import name.lkk.kkmall.member.entity.MemberLoginLogEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 会员登录记录
 * 
 * @author KirkLin
 * @email linkirk@163.com
 * @date 2021-06-07 16:27:46
 */
@Mapper
public interface MemberLoginLogDao extends BaseMapper<MemberLoginLogEntity> {
	
}
