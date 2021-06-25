package name.lkk.kkmall.search.controller;


import lombok.extern.slf4j.Slf4j;
import name.lkk.kkmall.search.service.MallSearchService;
import name.lkk.kkmall.search.vo.SearchParam;
import name.lkk.kkmall.search.vo.SearchResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;


@Controller
@Slf4j
public class SearchController {

	@Autowired
	private MallSearchService mallSearchService;


	@GetMapping("/list.html")
	public String listPage(SearchParam searchParam, Model model, HttpServletRequest request){

		// 获取路径原生的查询属性
		searchParam.set_queryString(request.getQueryString());
		// ES中检索到的结果 传递给页面
		SearchResult result = mallSearchService.search(searchParam);
		log.debug(result.toString());
		model.addAttribute("result", result);
		return "list";
	}
}
