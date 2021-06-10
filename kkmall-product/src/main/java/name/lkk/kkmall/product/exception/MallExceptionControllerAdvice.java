package name.lkk.kkmall.product.exception;


import lombok.extern.slf4j.Slf4j;
import name.lkk.common.exception.BizCodeEnum;
import name.lkk.common.utils.R;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.bind.support.WebExchangeBindException;

import java.util.HashMap;
import java.util.Map;

/**
 * <p>Title: MallExceptionControllerAdvice</p>
 * Description：集中处理所有异常
 * date：2020/6/1 21:19
 * @author kirklin
 */
@Slf4j
@RestControllerAdvice(basePackages = "com.firenay.mall.product.controller")
public class MallExceptionControllerAdvice {


	@ExceptionHandler(value = {WebExchangeBindException.class})
	public R handleVaildException(WebExchangeBindException e) {
		log.error("数据校验出现问题{}，异常类型：{}", e.getMessage(), e.getClass());
		BindingResult bindingResult = e.getBindingResult();

		Map<String, String> errorMap = new HashMap<>();
		bindingResult.getFieldErrors().forEach((fieldError) -> {
			// 错误字段 、 错误提示
			errorMap.put(fieldError.getField(), fieldError.getDefaultMessage());
		});
		return R.error(BizCodeEnum.VAILD_EXCEPTION.getCode(), BizCodeEnum.VAILD_EXCEPTION.getMsg()).put("data", errorMap);
	}

	@ExceptionHandler(value = Throwable.class)
	public R handleException(Throwable throwable) {

		log.error("错误：", throwable);
		return R.error(BizCodeEnum.UNKNOW_EXCEPTION.getCode(), BizCodeEnum.UNKNOW_EXCEPTION.getMsg());
	}
}
