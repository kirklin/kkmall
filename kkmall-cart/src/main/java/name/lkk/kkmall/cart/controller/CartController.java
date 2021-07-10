package name.lkk.kkmall.cart.controller;

import lombok.extern.slf4j.Slf4j;
import name.lkk.kkmall.cart.interceptor.CartInterceptor;
import name.lkk.kkmall.cart.to.UserInfoTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @author: kirklin
 * @date: 2021/7/10 3:39 下午
 * @description:
 */
@Slf4j
@Controller
public class CartController {

    /**
     * 去购物车页面的请求
     * 浏览器有一个cookie:user-key 标识用户的身份，一个月过期
     * 如果第一次使用jd的购物车功能，都会给一个临时的用户身份:
     * 浏览器以后保存，每次访问都会带上这个cookie；
     * <p>
     * 登录：session有
     * 没登录：按照cookie里面带来user-key来做
     * 第一次，如果没有临时用户，自动创建一个临时用户
     *
     * @return
     */
    @GetMapping({"/", "/cart.html"})
    public String carListPage() {
        //快速得到用户信息：id,user-key
        UserInfoTo userInfoTo = CartInterceptor.userInfoToThreadLocal.get();
        log.info(userInfoTo.toString());
        return "cartList";
    }

}
