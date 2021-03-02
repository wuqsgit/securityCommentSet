package servlets;

import com.ht70605.common.SnowflakeIdWorker;
import com.ht70605.entity.Dictionary;
import com.ht70605.service.DictionaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/5/17.
 */
@Controller
@WebServlet(name = "Servlet")
public class Servlet extends HttpServlet {

    @Autowired
    DictionaryService dictionaryService;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    public SnowflakeIdWorker snowflakeIdWorker;

    public void init() throws ServletException {
        ServletContext  application=this.getServletContext();
        super.init();
        WebApplicationContext wac= WebApplicationContextUtils.getWebApplicationContext(getServletContext());
        AutowireCapableBeanFactory factory=wac.getAutowireCapableBeanFactory();
        factory.autowireBean(this);
//     //获取所有的数据字典信息在初始化的时候一次完成
      List<Dictionary> dictionaryList= dictionaryService.selectAll();
      Map<String,Object> sysParamMap =new HashMap<String,Object>();
      for(int i=0;i<dictionaryList.size();i++)
      {
          if(dictionaryList.get(i).getType()=="productType")//密品类别
          {
              sysParamMap.put(dictionaryList.get(i).getCode(), dictionaryList.get(i).getValue());
          }
      }

        application.setAttribute("sysParam", sysParamMap);


//        Map<String,Object> supTypeMap =new HashMap<String,Object>();
//        supTypeMap.put("1", "一级供应商");
//        supTypeMap.put("2", "二级供应商");
//        supTypeMap.put("3", "三级供应商");
//        sysParamMap.put("supType", supTypeMap);
//
//        Map<String,Object> goodsColorMap =new HashMap<String,Object>();
//        goodsColorMap.put("1","红色");
//        goodsColorMap.put("2","绿色");
//        goodsColorMap.put("3","蓝色");
//        sysParamMap.put("goodsColor", goodsColorMap);
//        this.getServletContext().setAttribute("sysParam", sysParamMap);

        //加载雪花算法
       snowflakeIdWorker = new SnowflakeIdWorker(0, 0);
       this.getServletContext().setAttribute("snowflakeIdWorker", snowflakeIdWorker);
//
        System.out.println("-------------------系统参数加载成功---------------------");
    }

}
