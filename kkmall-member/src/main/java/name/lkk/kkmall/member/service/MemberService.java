package name.lkk.kkmall.member.service;

import com.baomidou.mybatisplus.extension.service.IService;
import name.lkk.common.utils.PageUtils;
import name.lkk.kkmall.member.entity.MemberEntity;
import name.lkk.kkmall.member.exception.PhoneExistException;
import name.lkk.kkmall.member.exception.UserNameExistException;
import name.lkk.kkmall.member.vo.MemberLoginVo;
import name.lkk.kkmall.member.vo.SocialUser;
import name.lkk.kkmall.member.vo.UserRegisterVo;

import java.util.Map;

/**
 * 会员
 *
 * @author KirkLin
 * @email linkirk@163.com
 * @date 2021-06-07 16:27:46
 */
public interface MemberService extends IService<MemberEntity> {

    PageUtils queryPage(Map<String, Object> params);

    void register(UserRegisterVo userRegisterVo) throws PhoneExistException, UserNameExistException;

    void checkPhone(String phone) throws PhoneExistException;

    void checkUserName(String username) throws UserNameExistException;

    /**
     * 普通登录
     */
    MemberEntity login(MemberLoginVo vo);

    /**
     * 社交登录
     */
    MemberEntity login(SocialUser socialUser);
}

