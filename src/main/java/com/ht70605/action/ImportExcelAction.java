package com.ht70605.action;

import com.ht70605.entity.TestExcel;
import com.ht70605.service.ExcelImportService;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by fz on 2017/9/7.
 */
@Controller
@RequestMapping("/import")
public class ImportExcelAction extends BaseAction {
    @Autowired
    ExcelImportService excelImportService;
    @RequestMapping(value = "Excel",method =  RequestMethod.POST)
    @ResponseBody
    public Object excelImport(@RequestParam(value = "excelFile")MultipartFile file,HttpServletRequest request) throws Exception {
        InputStream in=file.getInputStream();
        String message="";
        ImportExcel poi = new ImportExcel();
        Workbook wb = null;
        /** 验证文件是否合法 */

        if (!poi.validateExcel(file.getOriginalFilename()))
        {

            System.out.println(poi.getErrorInfo());

            message="文件類型只能为xls或xlsx格式的";

        }

        /** 判断文件的类型，是2003还是2007 */

        boolean isExcel2003 = true;

        if (WDWUtil.isExcel2007(file.getOriginalFilename()))
        {

            isExcel2003 = false;

        }
        if (isExcel2003)
        {
            wb = new HSSFWorkbook(in);
        }
        else
        {
            wb = new XSSFWorkbook(in);
        }
        List<List<String>>listExcel=poi.read(wb);
        for(int i=0;i<listExcel.size();i++){
            List<String>coumnList=listExcel.get(i);
            TestExcel test=new TestExcel();
            test.setName(coumnList.get(0));
            test.setAge(coumnList.get(1));
            test.setAddress(coumnList.get(2));
            test.setEmail(coumnList.get(3));
            System.out.println(test);
            excelImportService.insert(test);

            System.out.println();
        }
         message="导入Excel信息成功";

            return message;
    }
    @RequestMapping(value = "outExcel",method =  RequestMethod.POST)
    @ResponseBody
    public  String outExcel(HttpServletRequest request,HttpServletResponse response)throws Exception{
        response.setCharacterEncoding("utf-8");
        response.setContentType("application/x-download");
        String fileName="日志记录.xls";
        fileName=URLEncoder.encode(fileName,"UTF-8");
        response.addHeader("Content-Disposition","attachment;filename="+fileName);

        ExcelTest test=new ExcelTest();
        java.util.List<Student> list=new ArrayList<>();
        list.add(new Student(1,"张三",13,new Date()));
        list.add(new Student(2,"李四",23,new Date()));
        list.add(new Student(3, "王五", 33, new Date()));
        test.outExcel(response,list);
        return "下载成功";
    }
}