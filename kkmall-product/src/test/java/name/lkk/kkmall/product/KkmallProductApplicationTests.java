package name.lkk.kkmall.product;

import name.lkk.kkmall.product.entity.BrandEntity;
import name.lkk.kkmall.product.service.impl.BrandServiceImpl;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class KkmallProductApplicationTests {

    @Autowired
    BrandServiceImpl brandService;

    @Test
    void contextLoads() {
//        BrandEntity brandEntity = new BrandEntity();
//        brandEntity.setName("华为");
//        brandService.save(brandEntity);
//        System.out.println("保存成功！！！");
    }

}
