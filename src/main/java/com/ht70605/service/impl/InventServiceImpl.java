package com.ht70605.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.ht70605.dao.InventoryMapper;
import com.ht70605.dao.InventoryitemMapper;
import com.ht70605.dao.ProductMapper;
import com.ht70605.dao.ProductViewMapper;
import com.ht70605.entity.*;
import com.ht70605.service.InventService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by Administrator on 2017/5/10.
 */
@SuppressWarnings("SpringJavaAutowiringInspection")
@Service("InventService")
public class InventServiceImpl implements InventService {

    @Autowired
    private InventoryMapper inventoryMapper;
    @Autowired
    private InventoryitemMapper inventoryitemMapper;
    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private ProductViewMapper productViewMapper;

    private Logger logger = LoggerFactory.getLogger(InventServiceImpl.class);

    public void insert(Invent invent) throws Exception {

        if (invent.getInventory() != null) {
            try {
                inventoryMapper.insertSelective(invent.getInventory());
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (invent.getInventoryitemList() != null) {
            try {
                invent.getInventoryitemList().forEach(inventoryitem -> {
                    inventoryitemMapper.insertSelective(inventoryitem);
                });
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public Page<Product> editPageUseSearch(Page<Product> page, String id){
        List<Inventoryitem> items = inventoryitemMapper.selectInventoryitemByInvenId(id);
        List<Product> returnObj = new ArrayList<>();
        String[] ids = new String[items.size()];
        Map<String, String> mapper = new HashMap<String, String>(items.size());
        Map<String, String> resultMap = new HashMap<>(items.size());
        Integer total = 0;
        for(int i=0 ;i< items.size(); i++) {
            ids[i] = items.get(i).getProductId();
            mapper.put(items.get(i).getProductId(), items.get(i).getId());
            resultMap.put(items.get(i).getProductId(), items.get(i).getResult());
        }

        if (ids != null && ids.length > 0){
            List<Product> pros = productMapper.selectPageListByMapperId(ids, page.getStart(), page.getPageSize());
            total = productMapper.selectPageCountListByMapperId(ids);
            Set<String> idSet = new HashSet<>();
            for(Product pro : pros){
                if(pro.getProductId() == null){
                    idSet.add(pro.getId());

                    // page.setParamEntity(pro);
                    pro.setItemId(mapper.get(pro.getId()));
                    pro.setInventId(id);
                    pro.setResult(resultMap.get(pro.getId()));

                    List<Product> sonList = new ArrayList<>();
                    for(Product proLeave : pros){
                        if(!StringUtils.isEmpty(proLeave.getProductId()) && pro.getId().equals(proLeave.getProductId())){
                            idSet.add(proLeave.getId());
                            proLeave.setResult(resultMap.get(proLeave.getId()));
                            sonList.add(proLeave);
                        }
                    }

                    pro.setProductList(sonList);
                    returnObj.add(pro);
                }
            }

            for(Product pro : pros){
                if(!idSet.contains(pro.getId())){
                    pro.setResult(resultMap.get(pro.getId()));
                    pro.setItemId(mapper.get(pro.getId()));
                    pro.setInventId(id);
                    returnObj.add(pro);
                }
            }
        }
        page.setList(returnObj);
        page.setTotalRecord(total);
        if (page.getPageSize() != null) {
            if (page.getTotalRecord() % page.getPageSize() == 0)
                page.setTotalPages(page.getTotalRecord() / page.getPageSize());//总页数
            else page.setTotalPages(page.getTotalRecord() / page.getPageSize() + 1);
        }
        return page;
    }

    public void update(Invent invent) throws Exception {
        if (invent.getInventory() != null) {
            try {
                inventoryMapper.updateByPrimaryKeySelective(invent.getInventory());
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (invent.getInventoryitemList() != null) {
            try {
                invent.getInventoryitemList().forEach(inventoryitem -> {
                    inventoryitemMapper.updateByPrimaryKeySelective(inventoryitem);
                });
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public void delete(Invent invent) throws Exception {
        if (invent.getInventory() != null) {
            try {
                inventoryMapper.deleteByPrimaryKey(invent.getInventory().getId());
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (invent.getInventoryitemList() != null) {
            try {
                invent.getInventoryitemList().forEach(inventoryitem -> {
                    inventoryitemMapper.deleteByPrimaryKey(inventoryitem.getId());
                });
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public List<Inventory> selectInventByUserId(String userId){

        List<Inventory> inventories = inventoryMapper.selectInventoryByUserId(userId);

        if(inventories != null){
            for(Inventory inventory : inventories){
                List<Inventoryitem> inventoryitemList = inventoryitemMapper.selectInventoryitemByInvenId(inventory.getId());
                List<InventoryitemSelect> inventorySelects = new ArrayList<InventoryitemSelect>();
                for(Inventoryitem inventoryitem : inventoryitemList){
                    InventoryitemSelect select = (InventoryitemSelect)inventoryitem;
                    inventorySelects.add(select);
                }

                inventory.setInventoryitemSelects(inventorySelects);
            }

        }

        return inventories;
    }

    @Override
    public void deleteList(String[] pks) throws Exception {
        inventoryMapper.deleteList(pks);
        inventoryitemMapper.deleteList(pks);
    }

    @Override
    public void deleteItem(String[] pks, String inventId) throws Exception {
        //删除其所有子节点
        for(String pk : pks) {
            Inventoryitem item = inventoryitemMapper.selectByPrimaryKey(pk);
            if(item!= null && !StringUtils.isEmpty(item.getProductId())) {
                List<Product> products = productMapper.selectSignalLeaves(item.getProductId());
                for(Product product : products) {
                    inventoryitemMapper.deleteItemByInventIdAndProductId(product.getId(), inventId);
                }
            }
        }
        inventoryitemMapper.deleteIdList(pks);

    }

    public Invent select(Invent invent) {
        return null;
    }

    @Override
    public Page<Invent> selectPage(Page<Invent> page) {
        return null;
    }

    public Page<Invent> selectPageUseDyc(Page<Invent> page) {
        return null;
    }

    @Override
    public Page<Inventory> selectPageUseSearch(Page<Inventory> page){

        List<Inventory> inventorys = inventoryMapper.selectPageListSearch(page);
        Integer integer = inventoryMapper.selectPageCountListSearch(page);
        page.setList(inventorys);
        page.setTotalRecord(integer);
        if (page.getPageSize() != null) {
            if (page.getTotalRecord() % page.getPageSize() == 0)
                page.setTotalPages(page.getTotalRecord() / page.getPageSize());
            else page.setTotalPages(page.getTotalRecord() / page.getPageSize() + 1);
        }
        return page;
    }

    @Override
    public List<ProductView> selectProductPage(Inventory page, JSONObject jsonObject){
        //父节点的id
        List<String> parentproductIds = productViewMapper.selectFatherProductIds(selectProductViewSql(jsonObject));

        String tableName = jsonObject.getString("deptId")+"productfather_view";
        String[] pIds = new String[parentproductIds.size()];
        for(int i=0; i < parentproductIds.size(); i++){
            pIds[i] = "'"+parentproductIds.get(i)+"'";
        }
        if(parentproductIds != null && parentproductIds.size() > 0) {
            //再查询出父节点信息
            List<ProductView> parentProduct = productViewMapper.selectReturnbjProductOne(selectSqlIn(pIds, tableName));
            for (ProductView product : parentProduct) {
                product.setIsTrue(0);
            }

            //再查询出所有符合的节点信息
            List<ProductView> productViews = productViewMapper.selectReturnbjProductOne(selectPageProductViewSql(jsonObject, parentproductIds));
            //进行组合productView
            List<ProductView> returnProductViews = new ArrayList<>();
            for (ProductView product : parentProduct) {
                returnProductViews.add(product);
                for (ProductView view : productViews) {
                    if (view.getId().equals(view.getProductId()) && view.getProductId().equals(product.getId())) {
                        product.setIsTrue(1);
                    } else if (!view.getId().equals(view.getProductId()) && view.getProductId().equals(product.getId())) {
                        returnProductViews.add(view);
                    }
                }
            }
            return  returnProductViews;
        }
        return  null;
    }

    private String selectProductViewSql(JSONObject jsonObject){
        String deptId = jsonObject.getString("deptId");

        String sql = "select DISTINCT(product_id) from \n" +
                "(select * from "+deptId+"productfather_view\n" +
                "UNION\n" +
                "select * from "+deptId+"productson_view\n" +
                ")as table0\n" +
                "where status in ('"+ProductStatusEnum.在库.getStatus()+"', '"+ProductStatusEnum.使用中.getStatus()+"') ";
        if(!StringUtils.isEmpty(jsonObject.getString("locationId")) && !"''".equals(jsonObject.getString("locationId"))){
            sql += " and location_id='"+jsonObject.getString("locationId")+"'";
        }
     /*   if(!StringUtils.isEmpty(jsonObject.getString("searchDepartment")) && !"''".equals(jsonObject.getString("searchDepartment"))){
            sql += " and department_id='"+jsonObject.getString("searchDepartment")+"'";
        }*/
        if(!StringUtils.isEmpty(jsonObject.getString("dictionaryId")) && !"''".equals(jsonObject.getString("dictionaryId"))){
            sql += " and dictionary_id='"+jsonObject.getString("dictionaryId")+"'";
        }
        if(!StringUtils.isEmpty(jsonObject.getString("applicationId")) && !"''".equals(jsonObject.getString("applicationId"))){
            sql += " and application_id='"+jsonObject.getString("applicationId")+"'";
        }
        sql += "  ORDER BY create_time";
        if(jsonObject.get("startPage") != null && jsonObject.get("pageSize") != null) {
            sql += " limit " + jsonObject.get("startPage") + "," + jsonObject.get("pageSize");
        }
        return sql;
    }

    private String selectCountProductViewSql(JSONObject jsonObject){
        String deptId = jsonObject.getString("deptId");

        String sql = "select count(DISTINCT(product_id)) from \n" +
                "(select * from "+deptId+"productfather_view\n" +
                "UNION\n" +
                "select * from "+deptId+"productson_view\n" +
                ")as table0\n" +
                "where status in ('"+ProductStatusEnum.在库.getStatus()+"', '"+ProductStatusEnum.使用中.getStatus()+"') ";
        if(!StringUtils.isEmpty(jsonObject.getString("locationId")) && !"''".equals(jsonObject.getString("locationId"))){
            sql += " and location_id='"+jsonObject.getString("locationId")+"'";
        }
       /* if(!StringUtils.isEmpty(jsonObject.getString("searchDepartment")) && !"''".equals(jsonObject.getString("searchDepartment"))){
            sql += " and department_id='"+jsonObject.getString("searchDepartment")+"'";
        }*/
        if(!StringUtils.isEmpty(jsonObject.getString("dictionaryId")) && !"''".equals(jsonObject.getString("dictionaryId"))){
            sql += " and dictionary_id='"+jsonObject.getString("dictionaryId")+"'";
        }
        if(!StringUtils.isEmpty(jsonObject.getString("applicationId")) && !"''".equals(jsonObject.getString("applicationId"))){
            sql += " and application_id='"+jsonObject.getString("applicationId")+"'";
        }
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

    //查询符合要求的并且Product_id也符合要求的
    private String selectPageProductViewSql(JSONObject jsonObject, List<String> productIds){
        String deptId = jsonObject.getString("deptId");

        String sql = "select p.*,a.name as application_name from " +
                "(select * from "+deptId+"productfather_view " +
                "UNION " +
                "select * from "+deptId+"productson_view " +
                ")as p " +
                " left join application a on a.id = p.application_id "+
                " where p.status in ('"+ProductStatusEnum.在库.getStatus()+"', '"+ProductStatusEnum.使用中.getStatus()+"') ";
        if(!StringUtils.isEmpty(jsonObject.getString("locationId")) && !"''".equals(jsonObject.getString("locationId"))){
            sql += " and p.location_id='"+jsonObject.getString("locationId")+"'";
        }
        /*if(!StringUtils.isEmpty(jsonObject.getString("searchDepartment")) && !"''".equals(jsonObject.getString("searchDepartment"))){
            sql += " and p.department_id='"+jsonObject.getString("searchDepartment")+"'";
        }*/
        if(!StringUtils.isEmpty(jsonObject.getString("dictionaryId")) && !"''".equals(jsonObject.getString("dictionaryId"))){
            sql += " and p.dictionary_id='"+jsonObject.getString("dictionaryId")+"'";
        }
        if(!StringUtils.isEmpty(jsonObject.getString("applicationId")) && !"''".equals(jsonObject.getString("applicationId"))){
            sql += " and p.application_id='"+ jsonObject.getString("applicationId")+"'";
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

    @Override
    public Page<ProductView> insertPageUseSearch(Page<ProductView> page, JSONObject jsonObject){
        //父节点的id
        List<String> parentproductIds = productViewMapper.selectFatherProductIds(selectProductViewSql(jsonObject));
        //获取总条
        int pages = productViewMapper.selectCountReturnbjProductOne(selectCountProductViewSql(jsonObject));

        String tableName = jsonObject.getString("deptId")+"productfather_view";
        String[] pIds = new String[parentproductIds.size()];
        for(int i=0; i < parentproductIds.size(); i++){
            pIds[i] = "'"+parentproductIds.get(i)+"'";
        }
        if(parentproductIds != null && parentproductIds.size() > 0) {
            //再查询出父节点信息
            List<ProductView> parentProduct = productViewMapper.selectReturnbjProductOne(selectSqlIn(pIds, tableName));
            for(ProductView product : parentProduct){
                product.setIsTrue(0);
            }

            //再查询出所有符合的节点信息
            List<ProductView> productViews = productViewMapper.selectReturnbjProductOne(selectPageProductViewSql(jsonObject, parentproductIds));
            //进行组合productView
            List<ProductView> returnProductViews = new ArrayList<>();
            for (ProductView product : parentProduct){
                returnProductViews.add(product);
                for(ProductView view : productViews){
                    if(view.getId().equals(view.getProductId()) && view.getProductId().equals(product.getId())){
                        product.setIsTrue(1);
                    }else if(!view.getId().equals(view.getProductId()) && view.getProductId().equals(product.getId())){
                         List<ProductView> productViewsList = product.getProductViewList();
                        if(productViewsList == null){
                            productViewsList = new ArrayList<>();
                        }
                        productViewsList.add(view);
                        product.setProductViewList(productViewsList);
                    }
                }
            }
            page.setList(returnProductViews);
            page.setTotalRecord(pages);
            if (page.getPageSize() != null) {
                if (page.getTotalRecord() % page.getPageSize() == 0)
                    page.setTotalPages(page.getTotalRecord() / page.getPageSize());//总页数
                else page.setTotalPages(page.getTotalRecord() / page.getPageSize() + 1);
            }
        }
        return page;
    }

    public void updateInventory(List<Inventory> inventoryList){
        Date date = new Date(System.currentTimeMillis());
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        if(inventoryList != null){
            for(Inventory inventory : inventoryList){
                inventory.setRettime(simpleDateFormat.format(date));
                inventory.setStatus("2");
                inventoryMapper.updateByPKey(inventory);

                List<Inventoryitem> inventoryitemList = inventory.getInventoryitems();
                if(inventoryitemList != null){
                    for(Inventoryitem inventoryitem : inventoryitemList){
                        inventoryitemMapper.updateByPrimaryKeySelective(inventoryitem);
                    }
                }
            }
        }
    }

    @Override
    public Page<Inventory> selectPageUseDycInventory(Page<Inventory> page) {
        List<Inventory> inventorys = inventoryMapper.selectPageListUseDyc(page);
        List<Inventory> returnInventory = new ArrayList<Inventory>();
        Set<String> invenSet = new HashSet<String>();

        Set<String> inset = new HashSet<String>();
        for(Inventory inventory : inventorys){
            inset.add(inventory.getId());
            InventorySelect select = (InventorySelect)inventory;
            if(invenSet.contains(inventory.getId())){
                continue;
            }else{
                invenSet.add(inventory.getId());
                if(select.getProductionId() == null) {
                    List<Product> products = productMapper.selectSignalLeaves(select.getProId());
                    inventory.setProducts(products);
                }
                returnInventory.add(inventory);
            }
        }
        //Integer integer = inventoryMapper.selectPageCountUseDyc(page);
        Integer integer = inventorys.size();
        page.setList(inventorys);
        page.setTotalRecord(integer);
        if (page.getPageSize() != null) {
            if (page.getTotalRecord() % page.getPageSize() == 0)
                page.setTotalPages(page.getTotalRecord() / page.getPageSize());
            else page.setTotalPages(page.getTotalRecord() / page.getPageSize() + 1);
        }
        return page;
    }

    public Page<Inventoryitem> selectPageUseDycInventoryitem(Page<Inventoryitem> page) {
        List<Inventoryitem> inventoryitems = inventoryitemMapper.selectPageListUseDyc(page);
        Set<Inventoryitem> inventoryitemsSet = new HashSet<Inventoryitem>(inventoryitems);
        inventoryitems = new ArrayList<Inventoryitem>(inventoryitemsSet);
        //Integer integer = inventoryitemMapper.selectPageCountUseDyc(page);
        Integer integer = inventoryitemsSet.size();
        page.setList(inventoryitems);
        page.setTotalRecord(integer);
        if (page.getPageSize() != null) {
            if (page.getTotalRecord() % page.getPageSize() == 0)
                page.setTotalPages(page.getTotalRecord() / page.getPageSize());
            else page.setTotalPages(page.getTotalRecord() / page.getPageSize() + 1);
        }
        return page;
    }

    @Override
    public void sendInventory(String inventoryId){
        Inventory inventory = new Inventory();
        inventory.setId(inventoryId);
        Date date = new Date(System.currentTimeMillis());
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //inventory.setRettime(simpleDateFormat.format(date));
        inventory.setStatus("1");
        inventoryMapper.updateByPrimaryKeySelective(inventory);
    }
    /*
         清点完成数量
     */
    public Page<InventorySelect> selectInComNum(Page<Inventory> page){
        List<InventorySelect> inventoryitems = inventoryMapper.selectInventoryComNum(page);
        Page<InventorySelect> p = new Page<InventorySelect>();
        p.setList(inventoryitems);
        return p;
    }

    /*
     清点未完成数量
 */
    public Page<InventorySelect> selectInNonComNum(Page<Inventory> page){
        List<InventorySelect> inventoryitems = inventoryMapper.selectInventoryNonComNum(page);
        Page<InventorySelect> p = new Page<InventorySelect>();
        p.setList(inventoryitems);
        return p;
    }

    public Page<InventorySelect> selectjys(Page<Inventory> page){
        List<InventorySelect> inventoryitems = inventoryMapper.selectjys(page);
        Page<InventorySelect> p = new Page<InventorySelect>();
        p.setList(inventoryitems);
        return p;
    }

}
