package name.lkk.kkmall.authserver.feign;


import name.lkk.common.utils.R;
import name.lkk.kkmall.authserver.vo.SocialUser;
import name.lkk.kkmall.authserver.vo.UserLoginVo;
import name.lkk.kkmall.authserver.vo.UserRegisterVo;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;


@FeignClient("kkmall-member")
public interface MemberFeignService {

    @PostMapping("/member/member/register")
    R register(@RequestBody UserRegisterVo userRegisterVo);

    @PostMapping("/member/member/login")
    R login(@RequestBody UserLoginVo vo);

    @PostMapping("/member/member/oauth2/login")
    R login(@RequestBody SocialUser socialUser);
}
