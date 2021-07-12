package name.lkk.kkmall.order.web;

import lombok.extern.slf4j.Slf4j;
import name.lkk.kkmall.order.service.OrderService;
import name.lkk.kkmall.order.vo.OrderConfirmVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.concurrent.ExecutionException;

/**
 * @author: kirklin
 * @date: 2021/7/12 12:08 下午
 * @description:
 */
@Controller
@Slf4j
public class OrderWebController {

    @Autowired
    private OrderService orderService;


    @GetMapping("/toTrade")
    public String toTrade(Model model) throws ExecutionException, InterruptedException {
        OrderConfirmVo confirmVo = orderService.confirmOrder();
        log.info("toTrade页面数据" + confirmVo);
        model.addAttribute("orderConfirmData", confirmVo);
        return "confirm";
    }

}
