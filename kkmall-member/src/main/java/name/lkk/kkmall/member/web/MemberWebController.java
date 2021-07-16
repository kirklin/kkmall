package name.lkk.kkmall.member.web;

import lombok.extern.slf4j.Slf4j;
import name.lkk.common.utils.R;
import name.lkk.kkmall.member.feign.OrderFeignService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;

@Slf4j
@Controller
public class MemberWebController {

    @Autowired
    private OrderFeignService orderFeignService;

    @GetMapping("/memberOrder.html")
    public String memberOrderPage(@RequestParam(value = "pageNum", required = false, defaultValue = "1") Integer pageNum, Model model) {
        // 这里可以获取到支付宝给我们传来的所有数据
        // 查出当前登录用户的所有订单
        HashMap<String, Object> page = new HashMap<>();
        page.put("page", pageNum);
        R r = orderFeignService.listWithItem(page);
        model.addAttribute("orders", r);
//		支付宝返回的页面数据
//		log.info(r.get("page").toString());
        return "orderList";
    }
}
