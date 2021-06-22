package cn.kirklin.kkmall.search.service;

import name.lkk.common.to.es.SkuEsModel;

import java.io.IOException;
import java.util.List;

/**
 * @author: kirklin
 * @date: 2021/6/22 3:43 下午
 * @description:
 */
public interface ProductSaveService {

    boolean productStatusUp(List<SkuEsModel> skuEsModels) throws IOException;

}
