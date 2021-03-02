package com.ht70605.service;

import com.ht70605.entity.Page;
import com.ht70605.entity.Product;
import com.ht70605.entity.ProductView;

import java.util.List;

//继承Service接口基类
public interface ProductService extends BaseService<Product> {
    public void insert(Product entity, List<Product> productList) throws Exception;
    public void update(Product entity, List<Product> productList) throws Exception;
    public List<Product> selectAll(Page<Product>page) throws Exception;
    Page selectApplicationNum(Page<Product> page);
    Page selectProductNumByApplication(Page<Product> page);
    Page selectProductNumByType(Page<Product> page);
    Page selectProductNumByLocation(Page<Product> page);

    Product selectOneById(String id);

    /**
     * FF新增查询用于密品信息2017-07-20
     * @param page
     * @return
     */
    public Page selectListByParamEntity(Page<Product> page);

    /**
     * FF新增查询用于密品信息2018-09-02
     * @param page
     * @return
     */
    public Page selectProductViewListByParamEntity(Page<ProductView> page,Product Product);


}
