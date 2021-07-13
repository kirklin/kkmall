package name.lkk.kkmall.order.web;

import lombok.extern.slf4j.Slf4j;
import name.lkk.common.exception.NotStockException;
import name.lkk.kkmall.order.service.OrderService;
import name.lkk.kkmall.order.vo.OrderConfirmVo;
import name.lkk.kkmall.order.vo.OrderSubmitVo;
import name.lkk.kkmall.order.vo.SubmitOrderResponseVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

    /**
     * 下单功能
     */
    @PostMapping("/submitOrder")
    public String submitOrder(OrderSubmitVo submitVo, Model model, RedirectAttributes redirectAttributes) {

        try {
            SubmitOrderResponseVo responseVo = orderService.submitOrder(submitVo);
            // 下单失败回到订单重新确认订单信息
            if (responseVo.getCode() == 0) {
                // 下单成功取支付选项
                model.addAttribute("submitOrderResp", responseVo);
                return "pay";
            } else {

                String msg = "下单失败,";
                switch (responseVo.getCode()) {
                    case 1:
                        msg += "订单信息过期,请刷新在提交";
                        break;
                    case 2:
                        msg += "订单商品价格发送变化,请确认后再次提交";
                        break;
                    case 3:
                        msg += "商品库存不足";
                        break;
                    default:
                        msg += "未知错误";
                }

                redirectAttributes.addFlashAttribute("msg", msg);
                return "redirect:http://order.kkmall.com/toTrade";
            }
        } catch (Exception e) {
            if (e instanceof NotStockException) {
                String message = e.getMessage();
                redirectAttributes.addFlashAttribute("msg", message);
            }
            return "redirect:http://order.kkmall.com/toTrade";
        }
    }
}
