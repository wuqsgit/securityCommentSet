package com.ht70605.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ht70605.common.SnowflakeIdWorker;
import com.ht70605.dao.ProductMapper;
import com.ht70605.dao.ProductViewMapper;
import com.ht70605.entity.*;
import com.ht70605.service.LocationService;
import com.ht70605.service.ProductService;
import com.ht70605.service.ProductStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/5/10.
 */
@SuppressWarnings("SpringJavaAutowiringInspection")
@Service("ProductService")
public class ProductServiceImpl implements ProductService {
    @Resource
    public ServletContext applition;
    @Autowired
    private ProductMapper productMapper;

    @Autowired
    ProductViewMapper productViewMapper;

    @Autowired
    ProductStatusService productStatusService;

    @Autowired
    LocationService locationService;
    public void insert(Product product) throws Exception {
        productMapper.insertSelective(product);
    }
    @Transactional
    public void insert(Product product,List<Product>productList) throws Exception {


//编号434
        String proCode= product.getProCode();//获取列装号
        String serNum=product.getSerNum();//出厂编号
        StringBuilder stringBuilder=new StringBuilder(serNum);
       String fanzhuancode= stringBuilder.reverse().toString();//反转字符窜
            String str="";
         String qiqnzhui="";//出厂编号前缀
           for(int i=0;i<fanzhuancode.length();i++)
           {
              if( fanzhuancode.charAt(i)>=48&& fanzhuancode.charAt(i)<=57)
              {
                  str+= fanzhuancode.charAt(i);
              }
              else{
                  qiqnzhui= fanzhuancode.substring(str.length());
                  qiqnzhui= new StringBuilder(qiqnzhui).reverse().toString();//得到前缀
                  break;
              }
           }
           //正转字符串的到序列号
            StringBuilder stringBuilder1=new StringBuilder(str);
            String xulieCode=  stringBuilder1.reverse().toString();//得到最后的序列号

            String beginCode=proCode.substring(0,7);
            String liushuiCodeStr= proCode.substring(7);//流水号
            int liushuiCode= Integer.parseInt(liushuiCodeStr);
            SnowflakeIdWorker snowflakeIdWorker=new SnowflakeIdWorker(0,0);
            Date date = new Date(System.currentTimeMillis());
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String time=simpleDateFormat.format(date);
            int count=Integer.parseInt(product.getCount());
            List<ProductStatus> productStatusList=new ArrayList<>();

            String status=ProductStatusEnum.使用中.getStatus();
            //获取位置
           Location location= locationService.getLocationById(product.getLocationId());
       if("1".equals( location.getIsUserable()))//1-存储位置
       {
           status=ProductStatusEnum.在库.getStatus();;
       }

            //获取数量
            for(int i=0;i<count;i++)
            {
                String xuliehao=qiqnzhui+(Integer.parseInt(xulieCode)+i)+"";//出厂编号
                String code=beginCode+BuQi(liushuiCode+i)+"";
                long id=snowflakeIdWorker.nextId();
                product.setId(String.valueOf(id));
                product.setProCode(code);//生成列装号
                product.setSerNum(xuliehao);//生成出厂编号
                product.setStatus("1");
                product.setCreateTime(time);
                product.setProductId(null);
                productMapper.insertSelective(product);//插入密品

                ProductStatus productStatus=new ProductStatus();


                productStatus.setId(String.valueOf(id));//ID
                productStatus.setProductId(String.valueOf(id));
                productStatus.setUpdateTime(time);
                productStatus.setLocationId(product.getLocationId());
                productStatus.setLocationInfo(location.getLocinfo());
                productStatus.setSysUserId(product.getSysuserId());
                productStatus.setSysUserName(product.getSysuserName());
                productStatus.setDepartmentId(product.getDeptId());
                productStatus.setDepartmentName(product.getDepName());
                productStatus.setStatus(status);//1存储位置-对应“在库”状态  0-非存储位置对应“使用中”状态
                productStatusList.add(productStatus);

                for(int j=0;j<productList.size();j++)
                {
                  //  Product p=new Product();
                    Product product1= JSONObject.toJavaObject((JSON) JSONObject.toJSON(productList.get(j)), Product.class) ;
                     location= locationService.getLocationById(product1.getLocationId());
                    if("1".equals( location.getIsUserable()))//1-存储位置
                    {
                        status=ProductStatusEnum.在库.getStatus();
                    }
                    String mjid=String.valueOf(snowflakeIdWorker.nextId()) ;
                    product1.setId(mjid);
                    product1.setProductId(product.getId());//主设备ID
                    product1.setStatus("1");
                    product1.setCreateTime(time);
                    productMapper.insertSelective(product1);//插入随机密件

                    ProductStatus productStatus2=new ProductStatus();
                    productStatus2.setId(mjid);//ID
                    productStatus2.setProductId(mjid);
                    productStatus2.setUpdateTime(time);
                    productStatus2.setLocationId(product1.getLocationId());
                    productStatus2.setLocationInfo(location.getLocinfo());
                    productStatus2.setSysUserId(product.getSysuserId());
                    productStatus2.setSysUserName(product.getSysuserName());
                    productStatus2.setDepartmentId(product.getDeptId());
                    productStatus2.setDepartmentName(product.getDepName());
                    productStatus2.setStatus(status);//1存储位置-对应“在库”状态  0-非存储位置对应“使用中”状态
                    productStatusList.add(productStatus2);
                }
            }
         productStatusService.insertList(productStatusList,product.getDeptId()+"productstatus");
    }
//修改
    @Override
    public void update(Product entity, List<Product> productList) throws Exception {
        productMapper.updateByPrimaryKeySelective(entity);
        Date date = new Date(System.currentTimeMillis());
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time=simpleDateFormat.format(date);
        SnowflakeIdWorker snowflakeIdWorker=new SnowflakeIdWorker(0,0);
        if(productList!=null){
            for(int j=0;j<productList.size();j++)
            {
                Product product1= JSONObject.toJavaObject((JSON) JSONObject.toJSON(productList.get(j)), Product.class) ;
                Product products=productMapper.selectByPrimaryKey(product1.getId());
                if(products ==null)
                {
                    String mjid=String.valueOf(snowflakeIdWorker.nextId()) ;
                    product1.setId(mjid);
                    product1.setProductId(entity.getId());
                    product1.setStatus("1");
                    product1.setCreateTime(time);
                    productMapper.insertSelective(product1);//插入随机密件
                }
                else
                    {
                        product1.setUpdateTime(time);
                    }
                productMapper.updateByPrimaryKeySelective(product1);//修改随机密件
            }
        }
    }

    @Override
    public List<Product> selectAll(Page<Product> page) throws Exception {
      return null;
    }

    //补齐
     public  String BuQi(int code){
        String ret="";
        if(String.valueOf(code).length()==1)
        {
            ret="000"+code;
        }
        if(String.valueOf(code).length()==2)
        {
            ret="00"+code;
        }
        if(String.valueOf(code).length()==3)
        {
            ret="0"+code;
        }
        if(String.valueOf(code).length()==4)
        {
            ret=""+code;
        }
        return ret;
}
    public void update(Product entity) throws Exception {
        productMapper.updateByPrimaryKeySelective(entity);
    }

    public void delete(Product entity) throws Exception {
    }

    public void deleteList(String[] pks) throws Exception {
        productMapper.deleteList(pks);
    }

    public Product select(Product entity) {
        return productMapper.select(entity);
    }

    public Page<Product> selectPage(Page<Product> page) {

      List<Product> products=  productMapper.selectPageListUseDycForRecord(page);
      page.setList(products);
      return  page;

    }

    @Override
    public Page<Product> selectPageUseDyc(Page<Product> page) {

       List<Product> list = productMapper.selectPageListUseDyc(page);
       int TotalRecord= productMapper.selectPageCountUseDyc(page);
        List<Product> returnList = new ArrayList<>();
       for (int i = 0; i < list.size(); i++) {
            String ProductId=list.get(i).getProductId();
            if(ProductId==null)
            {
                returnList.add(list.get(i));//存入密品信息
               page.setParamEntity(list.get(i));
               List<Product> products=productMapper.selectSignalAndLeaves(page);
                returnList.addAll(products);//存入密品随即密件
           }
       }
        page.setList(returnList);
        page.setTotalRecord(TotalRecord);
        if (page.getPageSize() != null) {

          if (page.getTotalRecord() % page.getPageSize() == 0)
               page.setTotalPages(page.getTotalRecord() / page.getPageSize());//总页数
            else page.setTotalPages(page.getTotalRecord() / page.getPageSize() + 1);
        }
       return page;
    }
    public Page<Product> selectApplicationNum(Page<Product> page){
        List<Product> appliactionNums= productMapper.selectApplicationNum(page);
        Page<Product> p = new Page<Product>();
        p.setList(appliactionNums);
        return p;
    }

    public Page<Product> selectProductNumByApplication(Page<Product> page){
        List<Product> appliactionNums= productMapper.selectProductNumByApplication(page);
        Page<Product> p = new Page<Product>();
        p.setList(appliactionNums);
        return p;
    }

    public Page<Product> selectProductNumByType(Page<Product> page){
        List<Product> appliactionNums= productMapper.selectProductNumByType(page);
        Page<Product> p = new Page<Product>();
        p.setList(appliactionNums);
        return p;
    }

    public Page<Product> selectProductNumByLocation(Page<Product> page){
        List<Product> appliactionNums= productMapper.selectProductNumByLocation(page);
        Page<Product> p = new Page<Product>();
        p.setList(appliactionNums);
        return p;
    }

    @Override
    public Product selectOneById(String id) {
        return productMapper.selectOneById(id);
    }


    @Override
    public Page<Product> selectListByParamEntity(Page<Product> page)
    {
        List<Product> returnList = new ArrayList<>();//返回数据
        List<Product> list = productMapper.selectListByParamEntity(page);//根据条件查询所有数据
        Integer TotalRecord= productMapper.selectListByParamEntityCount(page);
        for(int i=0;i<list.size();i++) {
            Product product0 = (Product) list.get(i);
            String sort = product0.getSort();
            if ("0".equals(sort))//父级
            {
                String id = product0.getId();//父级ID
                List<Product> productList = new ArrayList<>();//子节点的集合
                for (int j = 0; j < list.size(); j++) {
                    Product product1 = (Product) list.get(j);//判断是否有下级
                    String productId = product1.getProductId();
                    if (id.equals(productId))//有下级
                    {
                        product1.setSort("1");
                        productList.add(product1);
                    }
                }
                if(productList.size()>0)
                {
                    product0.setProductList(productList);
                }
                returnList.add(product0);
            }
        }
        for(int k=0;k<list.size();k++)
        {
            Product product=  (Product)list.get(k);
            String  sort2=product.getSort();
            if("2".equals(sort2))//没有下级
            {
                returnList.add(product);
            }

        }

        page.setList(returnList);
        page.setTotalRecord(TotalRecord);
        if (page.getPageSize() != null) {
            if (page.getTotalRecord() % page.getPageSize() == 0)
                page.setTotalPages(page.getTotalRecord() / page.getPageSize());//总页数
            else page.setTotalPages(page.getTotalRecord() / page.getPageSize() + 1);
        }
         return  page;
    }

    //2017-09-02修改查询包含父子级查询带分页
    @Override
    public Page selectProductViewListByParamEntity(Page<ProductView> page,Product p ) {

        String deptId=p.getDeptId();//部门ID
        String sqlwhere="1=1";
        if(p.getDictionaryId()!=null)//密品类别
        {
            sqlwhere+=" and dictionary_id='"+p.getDictionaryId()+"'";
        }
        if(p.getModel()!=null)//密品型号
        {
            sqlwhere+=" and model='"+p.getModel()+"'";
        }
        if(p.getSerNum()!=null)//出厂编号
        {
            sqlwhere+=" and ser_num='"+p.getSerNum()+"'";
        }
        if(p.getApplicationId()!=null)//所属系统
        {
            sqlwhere+=" and application_id='"+p.getApplicationId()+"'";
        }
        if(p.getRfidCode()!=null)//RFID
        {
            sqlwhere+=" and rfid_code like'%"+p.getRfidCode()+"%'";
        }
        if(p.getSysuserId()!=null)//责任人
        {
            sqlwhere+=" and sysUser_id='"+p.getSysuserId()+"'";
        }
        if(p.getSysuserId()!=null)//责任人
        {
            sqlwhere+=" and sysUser_id='"+p.getSysuserId()+"'";
        }
        if(p.getProCode_begin()!=null)//列装号起始
        {
            sqlwhere+=" and pro_code>='"+p.getProCode_begin()+"'";
        }
        if(p.getProCode_end()!=null)//列装号起始
        {
            sqlwhere+=" and pro_code<='"+p.getProCode_end()+"'";
        }

        if(p.getIsReadCard()!=null)//是否已发标签
        {
            if("是".equals(p.getIsReadCard()))
            {
                sqlwhere+=" and rfid_code  is not null ";
            }
            else
                {
                    sqlwhere+=" and rfid_code is null ";
                }

        }
       // 获取查询的密品，可能是主，可能是子，可能主子都有
        String sql = "select *,application.`name` as 'application_name' from (select * from "+deptId+"productson_view  " +
                "union all " +
                "SELECT * from "+deptId+"productfather_view )as table0 " +
                "left join application on table0.application_id=application.id " +
                "where  "+sqlwhere+"";
        List<ProductView>productViewList=productViewMapper.selectReturnbjProductOne(sql);

        //获取查询总个数
        String sqlcount = "select Count(DISTINCT product_id)as count from (select * from "+deptId+"productson_view where rfid_code " +
                "union all " +
                "SELECT * from "+deptId+"productfather_view where rfid_code)as table0 " +
                "where  "+sqlwhere+"";
        Integer TotalRecord=productViewMapper.selectCountReturnbjProductOne(sqlcount);

        //获取父级密品
        String sql2 = "select DISTINCT product_id from (select * from "+deptId+"productson_view  " +
                "union all " +
                "SELECT * from "+deptId+"productfather_view )as table0 " +
                "where  "+sqlwhere+" limit "+page.getStart()+","+page.getPageSize()+"";
        List<ProductView>productViewList2=productViewMapper.selectReturnbjProductOne(sql2);
        sqlwhere="";
        for(int i=0;i< productViewList2.size();i++)
        {
            sqlwhere+="'"+productViewList2.get(i).getProductId()+"',";
        }
        sqlwhere=sqlwhere.substring(0,sqlwhere.lastIndexOf(","));
        //根据父ID获取对应的密品信息
        String sql3="select *,application.`name` as 'application_name' from "+deptId+"productfather_view as table0 " +
                "left join application on table0.application_id=application.id " +
                "where table0.id in ("+sqlwhere+") ";
        List<ProductView>productViewList3=productViewMapper.selectReturnbjProductOne(sql3);
        for(int i=0;i<productViewList3.size();i++)
        {
            String id= productViewList3.get(i).getId();
            //根据父ID找出该ID下的子节点
            List<ProductView> productViewListz=new ArrayList<ProductView>();
            for(int j=0;j<productViewList.size();j++)
            {
                String zid= productViewList.get(j).getId();//子ID
                String proid= productViewList.get(j).getProductId();//上级ID
                if(id.equals(proid)&&!zid.equals(proid))
                {
                   // productViewListz.add(productViewList.get(j));
                    productViewList3.add(productViewList.get(j));
                }
            }
            //productViewList3.get(i).setProductViewList(productViewListz);//子节点加入父节点中
        }
        page.setList(productViewList3);
        page.setTotalRecord(TotalRecord);
        if (page.getPageSize() != null) {
            if (page.getTotalRecord() % page.getPageSize() == 0)
                page.setTotalPages(page.getTotalRecord() / page.getPageSize());//总页数
            else page.setTotalPages(page.getTotalRecord() / page.getPageSize() + 1);
        }
        return page;
    }
}
