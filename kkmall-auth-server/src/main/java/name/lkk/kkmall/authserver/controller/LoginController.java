package name.lkk.kkmall.authserver.controller;

import lombok.extern.slf4j.Slf4j;
import name.lkk.common.constant.AuthServerConstant;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @author: kirklin
 * @date: 2021/6/26 3:21 下午
 * @description:
 */
@Controller
@Slf4j
public class LoginController {
    @GetMapping({"/login.html","/","/index","/index.html"})
    public String loginPage(){
            return "login";
    }
    @GetMapping({"/reg.html"})
    public String regPage(){
            return "reg";
    }

}
