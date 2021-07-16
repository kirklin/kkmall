package name.lkk.kkmall.order.listener;

import com.alipay.api.AlipayApiException;
import com.alipay.api.internal.util.AlipaySignature;
import lombok.extern.slf4j.Slf4j;
import name.lkk.kkmall.order.service.OrderService;
import name.lkk.kkmall.order.utils.AlipayTemplate;
import name.lkk.kkmall.order.vo.PayAsyncVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * 支付宝支付验证器
 *
 * @author kirklin
 */
@Slf4j
@RestController
public class OrderPayedListener {

	@Autowired
	private OrderService orderService;

	@Autowired
	private AlipayTemplate alipayTemplate;

	/**
	 * http://member.kkmall.com/memberOrder.html?
	 * charset=utf-8
	 * &out_trade_no=202107161613374701415947717195235330
	 * &method=alipay.trade.page.pay.return
	 * &total_amount=6005.00
	 * &sign=1B%2F3g1gCXnkeH0G3DyVpV1L670%2F6rl3tpMGMFIv4K3N2VJXi3lhwu%2FNqmXsWB8cziL7sWR0NsPF%2FiTx9EliM3%2FTaYzfwHEKoYuVrNt95wzQ%2BddLQR9YraXpHMbjP%2FCsBZ6f7gCkUmBOsA7mst03czcI%2FwY%2Far5U0DSEp6N1CDqRAS4qBmBCJerH76FCKh%2BPddSzOMhusI5VfVLdj2pc6ovO4riiff5QmRoAmk5c9rSWfuTdf0OJwzVjtL4%2B5G0TtMNL1te3RDrLeE46ZmFkQ5%2FOF4AVqNQZWL0HnMBB%2BsKZwQU%2FsQIZm6wqiBHitZ5TdwS044g004GJ40vTCY%2FiMyw%3D%3D&trade_no=2021071622001450870501339571&auth_app_id=2021000117689509&version=1.0&app_id=2021000117689509&sign_type=RSA2&seller_id=2088621956134182&timestamp=2021-07-16+16%3A20%3A13
	 *
	 * @param vo
	 * @param request
	 * @return
	 * @throws UnsupportedEncodingException
	 * @throws AlipayApiException
	 */
	@PostMapping("/payed/notify")
	public String handleAliPayed(PayAsyncVo vo, HttpServletRequest request) throws UnsupportedEncodingException, AlipayApiException {
		log.info("\n收到支付宝最后的通知数据：\n" + vo);
//		Map<String, String[]> result = request.getParameterMap();
//		String map = "";
//		for (String key : result.keySet()) {
//			map += key + "-->" + request.getParameter(key) + "\n";
//		}
		// 验签
		Map<String, String> params = new HashMap<>();
		Map<String, String[]> requestParams = request.getParameterMap();
		for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext(); ) {
			String name = iter.next();
			String[] values = requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}
			//乱码解决，这段代码在出现乱码时使用
//			valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			params.put(name, valueStr);
		}
		// 只要我们收到了支付宝给我们的异步通知 验签成功 我们就要给支付宝返回success
		if (AlipaySignature.rsaCheckV1(params, alipayTemplate.getAlipay_public_key(), alipayTemplate.getCharset(), alipayTemplate.getSign_type())) {
			return orderService.handlePayResult(vo);
		}
		log.warn("\n受到恶意验签攻击");
		return "fail";
	}
}
