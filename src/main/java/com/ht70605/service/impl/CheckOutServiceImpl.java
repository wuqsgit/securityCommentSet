package com.ht70605.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.ht70605.dao.*;
import com.ht70605.entity.*;
import com.ht70605.entity.TestExcel;
import com.ht70605.service.CheckOutService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/5/10.
 */
@SuppressWarnings("SpringJavaAutowiringInspection")
@Service("CheckOutBillService")
public class CheckOutServiceImpl implements CheckOutService {

    @Autowired
    private CheckoutbillMapper checkoutbillMapper;
    @Autowired
    private CheckoutbillitemMapper checkoutbillitemMapper;
    @Autowired
    private ApplicationMapper applicationMapper;
    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private DepartmentMapper departmentMapper;
    @Autowired
    private LocationMapper locationMapper;
    @Autowired
    private SysuserMapper sysuserMapper;
    @Autowired
    private ProductViewMapper productViewMapper;

    @Override
    public Checkoutbill getCheckoutBillByBillCodeAndDeptId(String billCode, String resDeptId){
        return checkoutbillMapper.getCheckoutBillByBillCodeAndDeptId(billCode, resDeptId);
    }

    @Transactional
    public void insert(Checkout checkout) throws Exception {
        if (checkout.getCheckoutbill() != null) {
            try {
                checkoutbillMapper.insertSelective(checkout.getCheckoutbill());
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (checkout.getCheckoutbillitemList() != null) {
            try {
                checkout.getCheckoutbillitemList().forEach(checkoutbillitem -> {
                    checkoutbillitemMapper.insertSelective(checkoutbillitem);
                });
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (checkout.getProductList() != null) {
            try {
                checkout.getProductList().forEach(product -> {
                    productMapper.updateByPrimaryKeySelective(product);
                });
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }

    public void update(Checkout checkout) throws Exception {
        if (checkout.getCheckoutbill() != null) {
            try {
                checkoutbillMapper.updateByPrimaryKeySelective(checkout.getCheckoutbill());
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (checkout.getCheckoutbillitemList() != null) {
            try {
                checkout.getCheckoutbillitemList().forEach(checkoutbillitem -> {
                    checkoutbillitemMapper.updateByPrimaryKeySelective(checkoutbillitem);
                });
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @Transactional
    public void delete(Checkout checkout) throws Exception {
        if (checkout.getCheckoutbill() != null) {
            try {
                Checkoutbill checkoutbill = checkoutbillMapper.selectByPrimaryKey(checkout.getCheckoutbill().getId());
                List<Checkoutbillitem> checkoutbillitems = checkoutbillitemMapper.selectByCheckOutBillId(checkoutbill.getId());
                checkoutbillitems.forEach(checkoutbillitem -> {
                    productMapper.deleteByPrimaryKey(checkoutbillitem.getProductId());
                    checkoutbillitemMapper.deleteByPrimaryKey(checkoutbillitem.getId());
                });
                checkoutbillMapper.deleteByPrimaryKey(checkoutbill.getId());
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void deleteList(String[] pks) throws Exception {

    }

    public Checkout select(Checkout checkout) {
        Checkout checkoutReturn = new Checkout();
        if (checkout.getCheckoutbill() != null) {
            try {
                checkoutReturn.setCheckoutbill(checkoutbillMapper.selectByPrimaryKey(checkout.getCheckoutbill().getId()));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        List<Checkoutbillitem> checkoutbillitemSelectList = new ArrayList<>();
        if (checkout.getCheckoutbillitemList() != null) {
            try {
                checkout.getCheckoutbillitemList().forEach(checkoutbillitem -> {
                    checkoutbillitemSelectList.add(checkoutbillitemMapper.selectByPrimaryKey(checkoutbillitem.getId()));
                });
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        checkoutReturn.setCheckoutbillitemList(checkoutbillitemSelectList);
        return checkoutReturn;
    }

    @Override
    public Page<Checkout> selectPage(Page<Checkout> page) {
        return null;
    }

    public Page<Checkout> selectPageUseDyc(Page<Checkout> page) {
        return null;
    }

    @Override
    public Page<Checkoutbill> selectPageUseDycCheckoutbill(Page<Checkoutbill> page) {
        List<Checkoutbill> checkoutbills = checkoutbillMapper.selectPageListUseDyc(page);
        Integer integer = checkoutbillMapper.selectPageCountUseDyc(page);
        page.setList(checkoutbills);
        page.setTotalRecord(integer);
        if (page.getPageSize() != null) {
            if (page.getTotalRecord() % page.getPageSize() == 0)
                page.setTotalPages(page.getTotalRecord() / page.getPageSize());
            else page.setTotalPages(page.getTotalRecord() / page.getPageSize() + 1);
        }
        return page;
    }

    public Page<Checkoutbillitem> selectPageUseDycCheckoutbillitem(Page<Checkoutbillitem> page) {
        List<Checkoutbillitem> checkoutbillitems = checkoutbillitemMapper.selectPageListUseDyc(page);
        Integer integer = checkoutbillitemMapper.selectPageCountUseDyc(page);
        for (int i = 0; i < checkoutbillitems.size(); i++) {
            CheckoutbillitemSelect checkoutbillitemSelect = (CheckoutbillitemSelect) checkoutbillitems.get(i);
            if (checkoutbillitemSelect.getProductProductId() != null) {
                Product product = productMapper.selectByPrimaryKey(checkoutbillitemSelect.getProductProductId());
                checkoutbillitemSelect.setProductModel(product.getModel());
                checkoutbillitemSelect.setProductProCode(product.getProCode());
                checkoutbillitemSelect.setProductSerNum(product.getSerNum());
            }
        }
        page.setList(checkoutbillitems);
        page.setTotalRecord(integer);
        if (page.getPageSize() != null) {
            if (page.getTotalRecord() % page.getPageSize() == 0)
                page.setTotalPages(page.getTotalRecord() / page.getPageSize());
            else page.setTotalPages(page.getTotalRecord() / page.getPageSize() + 1);
        }
        return page;
    }

    @Override
    public List<Application> selectApplication() {
        return applicationMapper.selectAll();
    }

    @Override
    public String selectDepartmentIdBySysUserId(String sysuserId) {
        return departmentMapper.selectDepartmentIdBySysUserId(sysuserId);
    }

    @Override
    public void updateProductStorage(Product product) {
        productMapper.updateByPrimaryKeySelective(product);
    }

    @Override
    public JSONObject addFormSelect(Page page) {
        page.setKeyWord("product");
        List<Product> products = productMapper.selectPageListAddFormSelect(page);
        Integer integer = products.size();
        if (page.getPageSize() != null) {
            if (page.getTotalRecord() % page.getPageSize() == 0)
                page.setTotalPages(page.getTotalRecord() / page.getPageSize());
            else page.setTotalPages(page.getTotalRecord() / page.getPageSize() + 1);
        }
        List<Product> productsRandom = new ArrayList<>();
        for (int i = products.size() - 1; i >= 0; i--) {
            Page page1 = new Page();
            page1.setPageIndex(1);
            page1.setKeyWord("random");
            page1.setParamEntity(products.get(i));
            List<Product> products1 = productMapper.selectPageListAddFormSelect(page1);
            //判断该密件和随机密件的组合是否在库
            if (products1.size() == 0 && (products.get(i).getStorage() == null || products.get(i).getStorage().equals("0"))) {
                products.remove(i);
                integer--;
            } else {
                Product product = products.get(i);
                products1.forEach(product1 -> {
                    product1.setModel(product.getModel());
                    product1.setProCode(product.getProCode());
                    product1.setSerNum(product.getSerNum());
                    product1.setSysuserId(product.getSysuserId());
                    product1.setApplicationId(product.getApplicationId());
                    product1.setApplicationName(product.getApplicationName());
                });
                productsRandom.addAll(products1);
            }
        }
        page.setList(products);
        page.setTotalRecord(integer);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("productsRandom", productsRandom);
        jsonObject.put("p", page);
        return jsonObject;
    }

    //在库的查询
    @Override
    public JSONObject addProductSelect(Page page, JSONObject jsonObject){
        JSONObject json = new JSONObject();
        List<ProductView> productViewList = new ArrayList<>();//父节点信息
        List<ProductView> productViewSonList = new ArrayList<>();
        page.setTotalPages(1);
        //先查询得到所有父节点id
        List<String> parentIds =  productViewMapper.selectFatherProductIds(selectProductViewSql(jsonObject));

        //再查询所有父节点
        String tableName = jsonObject.getString("deptId")+"productfather_view";
        String[] pIds = new String[parentIds.size()];
        for(int i=0; i < parentIds.size(); i++){
            pIds[i] = "'"+parentIds.get(i)+"'";
        }
        if(parentIds != null && parentIds.size() > 0) {
            //再查询出父节点信息
            List<ProductView> parentProduct = productViewMapper.selectReturnbjProductOne(selectSqlIn(pIds, tableName));
            for (ProductView product : parentProduct) {
                product.setIsTrue(0);
            }
            productViewList.addAll(parentProduct);

            //再查询出所有符合的节点信息
            List<ProductView> productViews = productViewMapper.selectReturnbjProductOne(selectPageProductViewSql(jsonObject, parentIds));
            //进行组合productView
            List<ProductView> returnProductViews = new ArrayList<>();
            for (ProductView product : productViewList) {
                returnProductViews.add(product);
                for (ProductView view : productViews) {
                    if (view.getId().equals(view.getProductId()) && view.getProductId().equals(product.getId())) {
                        product.setIsTrue(1);
                    } else if (!view.getId().equals(view.getProductId()) && view.getProductId().equals(product.getId())) {
                        productViewSonList.add(view);
                    }
                }
            }
        }

        page.setList(productViewSonList);//这个是子节点信息
        page.setTotalRecord(10);
        jsonObject.put("productsRandom", productViewList);//这个是父节点信息
        jsonObject.put("p", page);
        return json;
    }

    private String selectPageProductViewSql(JSONObject jsonObject, List<String> productIds){
        String deptId = jsonObject.getString("deptId");

        String sql = "select p.*,a.name as application_name from " +
                "(select * from "+deptId+"productfather_view " +
                "UNION " +
                "select * from "+deptId+"productson_view " +
                ")as p " +
                " left join application a on a.id = p.application_id "+
                " where p.status in ('"+ProductStatusEnum.在库.getStatus()+"') ";
        if(!StringUtils.isEmpty(jsonObject.getString("rfidCode")) && !"''".equals(jsonObject.getString("rfidCode"))){
            sql += " and rfid_code like '%"+jsonObject.getString("rfidCode")+"%'";
        }
        if(!StringUtils.isEmpty(jsonObject.getString("serNum")) && !"''".equals(jsonObject.getString("serNum"))){
            sql += " and ser_num like '%"+jsonObject.getString("serNum")+"%'";
        }
        if(!StringUtils.isEmpty(jsonObject.getString("proCode")) && !"''".equals(jsonObject.getString("proCode"))){
            sql += " and pro_code like '%"+jsonObject.getString("proCode")+"%'";
        }
        if(!StringUtils.isEmpty(jsonObject.getString("model")) && !"''".equals(jsonObject.getString("model"))){
            sql += " and model like '%"+jsonObject.getString("model")+"%'";
        }
        if(!StringUtils.isEmpty(jsonObject.getString("dictionaryId")) && !"''".equals(jsonObject.getString("dictionaryId"))){
            sql += " and dictionary_id='"+jsonObject.getString("dictionaryId")+"'";
        }
        if(!StringUtils.isEmpty(jsonObject.getString("applicationId")) && !"''".equals(jsonObject.getString("applicationId"))){
            sql += " and application_id='"+jsonObject.getString("applicationId")+"'";
        }

        sql += " and p.product_id IN (";
        String temp="";
        String ids[] = new String[productIds.size()];
        for(int i=0; i < productIds.size(); i++){
            temp += "%s,";
            ids[i]=productIds.get(i);
        }
        temp = temp.substring(0, temp.length() - 1);
        temp = String.format(temp, ids);
        sql+=temp+")";
        return sql;
    }

    private String selectSqlIn(String[] products, String tablename){
        if(StringUtils.isEmpty(tablename) || products == null || products.length == 0){
            return null;
        }
        String sql = "select p.*,a.name as application_name from "+ tablename+" p left join application a on a.id = p.application_id where p.product_id IN (";

        String temp="";
        for(int i=0; i < products.length; i++){
            temp += "%s,";
        }
        temp = temp.substring(0, temp.length() - 1);
        temp = String.format(temp, products);
        sql +=temp+")";
        return sql;
    }

    private String selectProductViewSql(JSONObject jsonObject){
        String deptId = jsonObject.getString("deptId");

        String sql = "select DISTINCT(product_id) from \n" +
                "(select * from "+deptId+"productfather_view\n" +
                "UNION\n" +
                "select * from "+deptId+"productson_view\n" +
                ")as table0\n" +
                "where status in ('"+ProductStatusEnum.在库.getStatus()+"') ";
        if(!StringUtils.isEmpty(jsonObject.getString("rfidCode")) && !"''".equals(jsonObject.getString("rfidCode"))){
            sql += " and rfid_code like '%"+jsonObject.getString("rfidCode")+"%'";
        }
       if(!StringUtils.isEmpty(jsonObject.getString("serNum")) && !"''".equals(jsonObject.getString("serNum"))){
            sql += " and ser_num like '%"+jsonObject.getString("serNum")+"%'";
        }
        if(!StringUtils.isEmpty(jsonObject.getString("proCode")) && !"''".equals(jsonObject.getString("proCode"))){
            sql += " and pro_code like '%"+jsonObject.getString("proCode")+"%'";
        }
        if(!StringUtils.isEmpty(jsonObject.getString("model")) && !"''".equals(jsonObject.getString("model"))){
            sql += " and model like '%"+jsonObject.getString("model")+"%'";
        }
        if(!StringUtils.isEmpty(jsonObject.getString("dictionaryId")) && !"''".equals(jsonObject.getString("dictionaryId"))){
            sql += " and dictionary_id='"+jsonObject.getString("dictionaryId")+"'";
        }
        if(!StringUtils.isEmpty(jsonObject.getString("applicationId")) && !"''".equals(jsonObject.getString("applicationId"))){
            sql += " and application_id='"+jsonObject.getString("applicationId")+"'";
        }
        sql += "  ORDER BY create_time";
        /*if(jsonObject.get("startPage") != null && jsonObject.get("pageSize") != null) {
            sql += " limit " + jsonObject.get("startPage") + "," + jsonObject.get("pageSize");
        }*/
        return sql;
    }

    @Override
    public List<Location> selectDeptLocations(String deptNodeid) {
        return locationMapper.selectLocationByDept(deptNodeid);
    }

    @Override
    public List<Sysuser> selectDeptSysusers(String deptNodeid) {
        return sysuserMapper.selectSysuserByUserDept(deptNodeid);
    }

    @Override
    public String selectSysUserIdByDepartmentId(String id) {
        return departmentMapper.selectSysUserIdByDepartmentId(id);
    }
}
