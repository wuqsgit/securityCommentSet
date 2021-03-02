package com.ht70605.action;

import com.lowagie.text.*;
import com.lowagie.text.Font;
import com.lowagie.text.Rectangle;
import com.lowagie.text.pdf.*;
import com.lowagie.text.html.HtmlWriter;
import org.apache.poi.hssf.usermodel.*;

import javax.servlet.http.HttpServletResponse;
import javax.swing.*;
import javax.swing.filechooser.FileSystemView;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.List;

/**
 * Created by fz on 2017/9/6.
 */
public class ExcelTest {
    private static String name;
    private static String []  aa={"序号","姓名","登录名","组织机构","是否为业务负责人","角色"};
    Cell cell;
    public ExcelTest(){

    }
    public void pdout()throws  Exception{
        Document document=new Document(new Rectangle(400,800));
        PdfWriter pdfWriter=PdfWriter.getInstance(document,new FileOutputStream("d:/ttt.pdf"));
        Table table1=new Table(6);
        PdfPTable table=new PdfPTable(6);
        Cell cell=new Cell();

        table1.addCell(cell);
        Font font=new Font();
        for(int i=0;i<aa.length;i++){
            table.addCell(new Paragraph(aa[i]));
        }
        table.setHeaderRows(1);
        document.open();
        pdfWriter.add(table1);
        document.close();
        document.add(table);
    }
    public void pdfout()throws Exception{
        Table table=new Table(6);
        table.setBorderWidth(1);
        table.setPadding(1);
        table.setSpacing(1);
        cell=new Cell(new Paragraph("序号"));
        cell.setHeader(true);
        cell.setColspan(1);
        table.addCell(cell);
        cell=new Cell(new Paragraph("姓名"));
        cell.setHeader(true);
        cell.setColspan(1);
        table.addCell(cell);
        cell=new Cell(new Paragraph("登录名"));
        cell.setHeader(true);
        cell.setColspan(1);
        table.addCell(cell);
        cell=new Cell(new Paragraph("组织机构"));
        cell.setHeader(true);
        cell.setColspan(1);
        table.addCell(cell);
        cell=new Cell(new Paragraph("是否为业务负责人"));
        cell.setHeader(true);
        cell.setColspan(1);
        table.addCell(cell);
        cell=new Cell(new Paragraph("角色"));
        cell.setHeader(true);
        cell.setColspan(1);
        table.addCell(cell);
        table.endHeaders();
        Document document=new Document();


        OutputStream outputStream=new FileOutputStream(new File("D:/test.pdf"));
//        //PdfWriter pdfWriter=PdfWriter.getInstance(document,outputStream);
//        PdfWriter pdfWriter=PdfWriter.getInstance(document,outputStream);
//        document.open();
//        pdfWriter.add(pdfTable);
       // document.close();
        PdfWriter pdfWriter=PdfWriter.getInstance(document,outputStream);
        document.open();
        pdfWriter.add(table);
        document.close();
    }

    public void outExcel(HttpServletResponse response,List<Student> list)throws Exception{
        HSSFWorkbook wb=new HSSFWorkbook();
        HSSFSheet sheet=wb.createSheet("学生表1");
        HSSFRow row=sheet.createRow((int) 0);
        HSSFCellStyle style=wb.createCellStyle();
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        HSSFCell cell=row.createCell((short)0);
        cell.setCellValue("学号");
        cell.setCellStyle(style);
        cell=row.createCell((short)1);
        cell.setCellValue("姓名");
        cell.setCellStyle(style);
        cell=row.createCell((short)2);
        cell.setCellValue("年龄");
        cell.setCellStyle(style);
        cell=row.createCell((short)3);
        cell.setCellValue("日期");
        cell.setCellStyle(style);
        for(int i=0;i<list.size();i++){
            row=sheet.createRow((int)i+1);
            Student student=list.get(i);
            row.createCell((short)0).setCellValue((double) student.getId());
            row.createCell((short)1).setCellValue(student.getName());
            row.createCell((short)2).setCellValue((double)student.getAge());
            row.createCell((short)3).setCellValue(new SimpleDateFormat("yyyy-mm-dd").format(student.getBirth()));
        }
        OutputStream fs=response.getOutputStream();
        wb.write(fs);
        fs.close();
    }
    public  void sayHello()throws Exception{

        Document document=new Document();
        OutputStream outputStream=new FileOutputStream(new File("D:/test.html"));
        HtmlWriter
                htmlWriter=HtmlWriter.getInstance(document, outputStream);
        htmlWriter.add(new String("aaaa"));
        document.close();

    }
    public static ExcelTest getInstance()throws Exception{
        ExcelTest object=(ExcelTest)Class.forName("com.ht70605.action.ExcelTest").newInstance();
        Method method=object.getClass().getMethod("sayHello",String.class);
        method.invoke(object,"傻妞");

        return object;
    }
    public static void main(String[] args)throws Exception {
        //ExcelTest test=new ExcelTest();
       // test.pdout();
        JFileChooser dialog=new JFileChooser();
        dialog.setDialogTitle("保存文件");
        dialog.setFileSelectionMode(JFileChooser.FILES_ONLY);
        FileSystemView fsv=FileSystemView.getFileSystemView();
        System.out.println("桌面的路径是：" + fsv.getHomeDirectory());
        dialog.setSelectedFile(new File("日志"+Calendar.getInstance().getTimeInMillis()+".xls"));
        int result=dialog.showSaveDialog(dialog);
        if(result==JFileChooser.APPROVE_OPTION){
            File file=dialog.getSelectedFile();
            String fileName=file.getAbsolutePath();
            System.out.println("文件的全路径是："+fileName+"文件名："+file.getName());
        }

    }
}
