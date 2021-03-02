package com.ht70605.service.impl;

import com.ht70605.dao.ProductStatusMapper;
import com.ht70605.entity.Page;
import com.ht70605.entity.ProductStatus;
import com.ht70605.entity.TestExcel;
import com.ht70605.service.ProductStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/8/29.
 */
@SuppressWarnings("SpringJavaAutowiringInspection")
@Service("ProductStatusService")
public class ProductStatusServiceImpl implements ProductStatusService {

    @Autowired
    private ProductStatusMapper productStatusMapper;

    @Override
    public void insertList(List<ProductStatus> productStatusList, String tableName) {
        for(ProductStatus productStatus : productStatusList) {
            String sql = "insert into " + tableName + "(id, product_id, update_time, status,location_id,location_info, sysUser_id,sysUser_name,department_id,department_name) values ('"+productStatus.getId()+ "','"+ productStatus.getProductId()+"','"+ productStatus.getUpdateTime()+"','"+productStatus.getStatus()+"','"+productStatus.getLocationId()+"','"+productStatus.getLocationInfo()+"','"+productStatus.getSysUserId()+"','"+productStatus.getSysUserName()+"','"+productStatus.getDepartmentId()+"','"+productStatus.getDepartmentName()+"')";
            productStatusMapper.insertList(sql);
        }
    }

    @Override
    public void createProductStatusTableAndView(String deptId) {
        String tableName = "`"+deptId+"productstatus`";
        productStatusMapper.createTable(tableName);

        tableName = deptId+"productstatus";
        String viewName = deptId+"temp_view";
        productStatusMapper.createTempView(tableName, viewName);

        viewName = deptId+"status_view";
        productStatusMapper.createStateView(tableName, viewName, deptId+"temp_view");

        tableName = deptId+"status_view";
        viewName = deptId+"productfather_view ";
        productStatusMapper.createFatherProductView(tableName, viewName);

        viewName = deptId+"productson_view ";
        productStatusMapper.createSonProductView(tableName, viewName);
        return;
    }

    @Override
    public void insert(ProductStatus test) throws Exception {

    }

    @Override
    public void update(ProductStatus entity) throws Exception {

    }

    @Override
    public void delete(ProductStatus entity) throws Exception {

    }

    @Override
    public void deleteList(String[] pks) throws Exception {

    }

    @Override
    public ProductStatus select(ProductStatus entity) {
        return null;
    }

    @Override
    public Page<ProductStatus> selectPage(Page<ProductStatus> page) {
        return null;
    }

    @Override
    public Page<ProductStatus> selectPageUseDyc(Page<ProductStatus> page) {
        return null;
    }
}
