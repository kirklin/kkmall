package name.lkk.kkmall.order.web;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;


@Controller
public class HelloController {


    /**
     * 用于测试各个页面是否能正常访问
     * http://order.kkmall.com/confirm.html
     * http://order.kkmall.com/detai.html
     * http://order.kkmall.com/list.html
     * http://order.kkmall.com/pay.html
     */
    @GetMapping("/{page}.html")
    public String listPage(@PathVariable("page") String page) {
        return page;
    }


}
