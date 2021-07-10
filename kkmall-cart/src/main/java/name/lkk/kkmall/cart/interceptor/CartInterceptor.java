package name.lkk.kkmall.cart.interceptor;

import name.lkk.common.constant.AuthServerConstant;
import name.lkk.common.constant.CartConstant;
import name.lkk.common.constant.DomainConstant;
import name.lkk.common.vo.MemberRsepVo;
import name.lkk.kkmall.cart.to.UserInfoTo;
import org.springframework.util.ObjectUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.UUID;

/**
 * @author: kirklin
 * @date: 2021/7/10 3:12 下午
 * @description: 购物车拦截器。在执行业务之前 判断用户是否登录,并使用ThreadLocal封装UserInfoTo
 */
public class CartInterceptor implements HandlerInterceptor {
    public static ThreadLocal<UserInfoTo> userInfoToThreadLocal = new InheritableThreadLocal<>();

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        UserInfoTo userInfoTo = new UserInfoTo();
        HttpSession session = request.getSession();
        MemberRsepVo user = (MemberRsepVo) session.getAttribute(AuthServerConstant.LOGIN_USER);
        if (user != null) {
            //用户已经登陆了
            userInfoTo.setUsername(user.getUsername());
            userInfoTo.setUserId(user.getId());
        }
        Cookie[] cookies = request.getCookies();
        if (cookies != null && cookies.length > 0) {
            for (Cookie cookie : cookies) {
                String name = cookie.getName();
                if (name.equals(CartConstant.TEMP_USER_COOKIE_NAME)) {
                    userInfoTo.setUserKey(cookie.getValue());
                    userInfoTo.setTempUser(true);
                }
            }
        }
        if (ObjectUtils.isEmpty(userInfoTo.getUserKey())) {
            String uuid = UUID.randomUUID().toString().replace("-", "");
            userInfoTo.setUserKey(uuid);
        }
        userInfoToThreadLocal.set(userInfoTo);
        return HandlerInterceptor.super.preHandle(request, response, handler);
    }

    /**
     * 执行完毕之后分配临时用户让浏览器保存
     */
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
        UserInfoTo userInfoTo = userInfoToThreadLocal.get();
        userInfoToThreadLocal.remove();
        if (!userInfoTo.isTempUser()) {
            Cookie cookie = new Cookie(CartConstant.TEMP_USER_COOKIE_NAME, userInfoTo.getUserKey());
            // 设置这个cookie作用域 过期时间
            cookie.setDomain(DomainConstant.MALL_DOMAIN);
            cookie.setMaxAge(CartConstant.TEMP_USER_COOKIE_TIME_OUT);
            response.addCookie(cookie);
        }
    }
}
