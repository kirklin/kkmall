package name.lkk.kkmall.thirdserver.controller;

import name.lkk.common.exception.BizCodeEnum;
import name.lkk.common.utils.R;
import name.lkk.kkmall.thirdserver.component.SmsComponent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author: kirklin
 * @date: 2021/7/9 3:09 下午
 * @description:
 */
@RestController
@RequestMapping("sms")
public class SmsSendController {

    @Autowired
    SmsComponent smsComponent;

    @GetMapping("sendcode")
    public R sendCode(@RequestParam("phone") String phone, @RequestParam("code") String code) {
        if (!"fail".equals(smsComponent.mockSendCode(phone, code).split("_")[0])) {
            return R.ok();
        }
        return R.error(BizCodeEnum.SMS_SEND_CODE_EXCEPTION.getCode(), BizCodeEnum.SMS_SEND_CODE_EXCEPTION.getMsg());
    }

}
