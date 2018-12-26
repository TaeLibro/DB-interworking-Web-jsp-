<%@ page import="java.sql.*" contentType="text/html;charset=EUC-KR"%>
<%
  Class.forName("oracle.jdbc.driver.OracleDriver");
  String url="jdbc:oracle:thin:@localhost:1521:XE";
		/* 11g express edition은 orcl 대신 XE를 입력한다. */
  Connection dbconn=DriverManager.getConnection(url, "U_BANK", "mybank");
  Statement stmt = dbconn.createStatement();
  String acc_id=request.getParameter("acc_id");
  ResultSet myResultSet=stmt.executeQuery("SELECT * FROM B_CARDS WHERE acc_id='"+acc_id+"'");
%>
<html>

<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
<title>** 카드정보 **</title>
</head>

<body bgcolor="white" text="black" link="blue" vlink="purple" alink="red">

<table border="1" cellspacing="0" width="645" bordercolor="#9AD2F7" bordercolordark="white" bordercolorlight="#B9E0FA">
    <tr>
        <td width="60" height="20" bgcolor="#D2E9F9">
            <p align="center">
            <span style="font-size:8pt;"><b>카드 ID</b></span></p>
        </td>
        <td width="150" height="20" bgcolor="#D2E9F9">
            <p align="center">
            <span style="font-size:8pt;"><b>예금계좌 ID</b></span></p>
        </td>
        <td width="75" height="20" bgcolor="#D2E9F9">
            <p align="center">
            <span style="font-size:8pt;"><b>카드신청일자</b></span></p>
        </td>
        <td width="150" height="20" bgcolor="#D2E9F9">
            <p align="center">
            <span style="font-size:8pt;"><b>카드한도금액</b></span></p>
        </td>
        <td width="150" height="20" bgcolor="#D2E9F9">
            <p align="center">
            <span style="font-size:8pt;"><b>카드결제일자</b></span></p>
        </td>
        <td width="60" height="20" bgcolor="#D2E9F9">
            <p align="center">
            <span style="font-size:8pt;"><b>카드종류</b></span></p>
        </td>
    </tr>
 <%
 if(myResultSet!=null){
  while(myResultSet.next()){
     String C_CARDID=myResultSet.getString("card_id");
     String C_ACCID=myResultSet.getString("acc_id");
     String C_CARDREGISTERDATE=myResultSet.getString("card_register_date");
     String C_CARDLIMIT=myResultSet.getString("card_limit_money");
     String C_CARDAPPROVEDATE=myResultSet.getString("card_approve_date");
     String C_CARDTYPE=myResultSet.getString("card_type");
 %>

    <tr>
	    <td width="150" height="20">
            <p align="center"><span style="font-size:9pt;">
            <font face="돋움체"><%=C_CARDID%></font></span></p>
        </td>
	    <td width="150" height="20">
            <p align="center"><span style="font-size:9pt;">
            <font face="돋움체"><%=C_ACCID%></font></span></p>
        </td>
	    <td width="150" height="20">
            <p align="center"><span style="font-size:9pt;">
            <font face="돋움체"><%=C_CARDREGISTERDATE%></font></span></p>
        </td>

        <td width="75" height="20">
            <p align="center"><span style="font-size:9pt;">
            <font face="돋움체"><%=C_CARDLIMIT%></font></span></p>
        </td>
        <td width="150" height="20">
            <p align="center"><span style="font-size:9pt;">
            <font face="돋움체"><%=C_CARDAPPROVEDATE%></font></span></p>
        </td>
        <td width="150" height="20">
            <p align="center"><span style="font-size:9pt;">
            <font face="돋움체"><%=C_CARDTYPE%></font></span></p>
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
