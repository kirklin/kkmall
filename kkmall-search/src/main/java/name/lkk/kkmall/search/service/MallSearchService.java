package name.lkk.kkmall.search.service;


import name.lkk.kkmall.search.vo.SearchParam;
import name.lkk.kkmall.search.vo.SearchResult;


public interface MallSearchService {

	/**
	 * 检索所有参数
	 */
	SearchResult search(SearchParam Param);
}
