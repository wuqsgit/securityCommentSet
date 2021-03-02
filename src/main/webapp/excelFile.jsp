<%--
  Created by IntelliJ IDEA.
  User: fz
  Date: 2017/9/7
  Time: 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.io.*,java.awt.Color.*,com.lowagie.text.*" contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.lowagie.text.pdf.PdfPTable" %>
<%@ page import="com.lowagie.text.pdf.PdfPCell" %>
<%@ page import="com.lowagie.text.pdf.PdfWriter" %>
<%

  Document document=new Document();
  PdfPTable pdfTable=new PdfPTable(6);
  for(int i=0;i<9;i++){
    PdfPCell pdfPCell=new PdfPCell();
    pdfPCell.addElement(new Paragraph(String.valueOf(i)));
    pdfTable.addCell(pdfPCell);
  }

//        OutputStream outputStream=new FileOutputStream(new File("D:/test.pdf"));
//        //PdfWriter pdfWriter=PdfWriter.getInstance(document,outputStream);
//        PdfWriter pdfWriter=PdfWriter.getInstance(document,outputStream);
//        document.open();
//        pdfWriter.add(pdfTable);
  // document.close();
  ByteArrayOutputStream buffer=new ByteArrayOutputStream();
  PdfWriter pdfWriter=PdfWriter.getInstance(document,buffer);
  document.open();
  document.add(pdfTable);
  document.close();
  byte[]bytes=buffer.toByteArray();
%>
<html>
<head>
    <title></title>
</head>
<body>
<form method="post" action="/import/outExcel.action" enctype="multipart/form-data">
<input type="file" id="excelFile" name="excelFile"/>
  <input type="submit" value="提交"/>
  </form>
</body>
</html>
