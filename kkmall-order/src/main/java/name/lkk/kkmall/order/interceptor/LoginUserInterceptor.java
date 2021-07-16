package name.lkk.kkmall.order.interceptor;

import name.lkk.common.constant.AuthServerConstant;
import name.lkk.common.vo.MemberRsepVo;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

/**
 * @author: kirklin
 * @date: 2021/7/12 12:10 下午
 * @description:
 */
@Component
public class LoginUserInterceptor implements HandlerInterceptor {
    public static ThreadLocal<MemberRsepVo> threadLocal = new ThreadLocal<>();

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        String uri = request.getRequestURI();
        AntPathMatcher antPathMatcher = new AntPathMatcher();
        if (antPathMatcher.match("/order/order/status/**", uri)) {
            return true;
        }
        if (antPathMatcher.match("/payed/notify", uri)) {
            return true;
        }
        //获取登录的用户信息
        MemberRsepVo memberRsepVo = (MemberRsepVo) request.getSession().getAttribute(AuthServerConstant.LOGIN_USER);

        if (memberRsepVo != null) {
            //把登录后用户的信息放在ThreadLocal里面进行保存
            threadLocal.set(memberRsepVo);

            return true;
        } else {
            //未登录，返回登录页面
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('请先进行登录，再进行后续操作！');location.href='http://auth.kkmall.com/login.html'</script>");
            // session.setAttribute("msg", "请先进行登录");
            // response.sendRedirect("http://auth.kkmall.com/login.html");
            return false;
        }
    }
}
