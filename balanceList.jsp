<%@ page import="java.sql.*" contentType="text/html;charset=EUC-KR"%>
<%
  Class.forName("oracle.jdbc.driver.OracleDriver");
  String url="jdbc:oracle:thin:@localhost:1521:XE";
		/* 11g express edition은 orcl 대신 XE를 입력한다. */
  Connection dbconn=DriverManager.getConnection(url, "U_BANK", "mybank");
  Statement stmt = dbconn.createStatement();
  String acc_id=request.getParameter("acc_id");
  ResultSet myResultSet=stmt.executeQuery("SELECT * FROM B_ACC_TRADES WHERE acc_id='"+acc_id+"'");
%>
<html>

<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
<title>** 거례내역 **</title>
</head>

<body bgcolor="white" text="black" link="blue" vlink="purple" alink="red">

<table border="1" cellspacing="0" width="645" bordercolor="#9AD2F7" bordercolordark="white" bordercolorlight="#B9E0FA">
    <tr>
        <td width="60" height="20" bgcolor="#D2E9F9">
            <p align="center">
            <span style="font-size:8pt;"><b>예금계좌 ID</b></span></p>
        </td>
        <td width="150" height="20" bgcolor="#D2E9F9">
            <p align="center">
            <span style="font-size:8pt;"><b>입출금날짜</b></span></p>
        </td>
        <td width="75" height="20" bgcolor="#D2E9F9">
            <p align="center">
            <span style="font-size:8pt;"><b>거래번호</b></span></p>
        </td>
        <td width="150" height="20" bgcolor="#D2E9F9">
            <p align="center">
            <span style="font-size:8pt;"><b>예금구분</b></span></p>
        </td>
        <td width="150" height="20" bgcolor="#D2E9F9">
            <p align="center">
            <span style="font-size:8pt;"><b>예금내용</b></span></p>
        </td>
        <td width="60" height="20" bgcolor="#D2E9F9">
            <p align="center">
            <span style="font-size:8pt;"><b>거래금액</b></span></p>
        </td>
        <td width="60" height="20" bgcolor="#D2E9F9">
            <p align="center">
            <span style="font-size:8pt;"><b>예금잔고</b></span></p>
        </td>
    </tr>
 <%
 if(myResultSet!=null){
  while(myResultSet.next()){
     String B_ACCID=myResultSet.getString("acc_id");
     String B_IMPEXPDATE=myResultSet.getString("imp_exp_date");
     String B_TRADEID=myResultSet.getString("trade_id");
     String B_ACCCLASS=myResultSet.getString("acc_class");
     String B_ACCCONTENTS=myResultSet.getString("acc_contents");
     String B_TRADEMONEY=myResultSet.getString("trade_money");
     String B_ACCBALANCE=myResultSet.getString("acc_balance");
 %>

    <tr>
	    <td width="150" height="20">
            <p align="center"><span style="font-size:9pt;">
            <font face="돋움체"><%=B_ACCID%></font></span></p>
        </td>
	    <td width="150" height="20">
            <p align="center"><span style="font-size:9pt;">
            <font face="돋움체"><%=B_IMPEXPDATE%></font></span></p>
        </td>
	    <td width="150" height="20">
            <p align="center"><span style="font-size:9pt;">
            <font face="돋움체"><%=B_TRADEID%></font></span></p>
        </td>

        <td width="75" height="20">
            <p align="center"><span style="font-size:9pt;">
            <font face="돋움체"><%=B_ACCCLASS%></font></span></p>
        </td>
        <td width="150" height="20">
            <p align="center"><span style="font-size:9pt;">
            <font face="돋움체"><%=B_ACCCONTENTS%></font></span></p>
        </td>
        <td width="150" height="20">
            <p align="center"><span style="font-size:9pt;">
            <font face="돋움체"><%=B_TRADEMONEY%></font></span></p>
        </td>
        <td width="60" height="20">
            <p align="center"><span style="font-size:9pt;">
            <font face="돋움체"><%=B_ACCBALANCE%></font></span></p>
        </td>
    </tr>
 <%
    }
   }
   stmt.close();
   dbconn.close();
 %>
</table>
<table cellpadding="0" cellspacing="0" width="400" height="23">
   <tr>
	<td width="150">
	   <p align="right"><span style="font-size:9pt;">
	   <a href="depositList1.jsp?acc_id=<%=acc_id%>">
	   <font color="black">돌아가기</font></a></span></p>
	</td>
   </tr>
</table>
</body>
</html>
