<%@ page import="java.sql.*" contentType="text/html;charset=EUC-KR"%>
<%
  Class.forName("oracle.jdbc.driver.OracleDriver");
  String url="jdbc:oracle:thin:@localhost:1521:XE";
		/* 11g express edition은 orcl 대신 XE를 입력한다. */
  Connection dbconn=DriverManager.getConnection(url, "U_BANK", "mybank");
  Statement stmt = dbconn.createStatement();
  String cust_jumin=request.getParameter("cust_jumin");
  ResultSet myResultSet=stmt.executeQuery("SELECT * FROM B_ACCOUNTS WHERE cust_jumin='"+cust_jumin+"'");
  if(myResultSet!=null){
   myResultSet.next();
%>
<html>

<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
<title>** 마이페이지 **</title>
</head>

<body bgcolor="white" text="black" link="blue" vlink="purple" alink="red">
<table border="1" cellspacing="0" width="400" bordercolor="#9AD2F7"
		bordercolordark="white" bordercolorlight="#B9E0FA">
   <tr>
	<td width="150" height="23">
	   <p align="center">
	   <span style="font-size:9pt ;">예금계좌 ID</span></p>
	</td>
	<td width="513">
	   <p><span style="font-size:9pt;">
	   <%=myResultSet.getString("acc_id")%></span></p>
	</td>
   </tr>
   <tr>
	<td width="150" height="23">
	   <p align="center">
	   <span style="font-size:9pt ;">예금계좌종류</span></p>
	</td>
	<td width="513">
	   <p><span style="font-size:9pt;">
	   <%=myResultSet.getString("acc_type")%></span></p>
	</td>
   </tr>
   <tr>
	<td width="150" height="23">
	   <p align="center">
	   <span style="font-size:9pt ;">예금잔고</span></p>
	</td>
	<td width="513">
	   <p><span style="font-size:9pt;">
		<a href="balanceList.jsp?acc_id=<%=myResultSet.getString("acc_id")%>">
	   <%=myResultSet.getString("acc_balance")%></span></p>
	</td>
   </tr>
   <tr>
	<td width="150" height="23">
	   <p align="center">
	   <span style="font-size:9pt ;">카드신청여부</span></p>
	</td>

	<td width="513">

	   <p><span style="font-size:9pt;">
		<a href="cardList.jsp?acc_id=<%=myResultSet.getString("acc_id")%>">
	   <%=myResultSet.getString("card_ask")%></a></span></p>
	</td>

   </tr>
   <tr>
	<td width="150" height="23">
	   <p align="center">
	   <span style="font-size:9pt ;">예금개설일</span></p>
	</td>
	<td width="513">
	   <p><span style="font-size:9pt;">
	   <%=myResultSet.getString("acc_register_date")%></span></p>
	</td>
   </tr>
   <tr>
	<td width="150" height="23">
	   <p align="center">
	   <span style="font-size:9pt ;">예금자이름</span></p>
	</td>
	<td width="513">
	   <p><span style="font-size:9pt;">
	   <%=myResultSet.getString("acc_cust_name")%></span></p>
	</td>
   </tr>
   <tr>
	<td width="150" height="23">
	   <p align="center">
	   <span style="font-size:9pt ;">전화번호</span></p>
	</td>
	<td width="513">
	   <p><span style="font-size:9pt;">
	   <%=myResultSet.getString("acc_phnum")%></span></p>
	</td>
   </tr>
   <tr>
	<td width="150" height="23">
	   <p align="center">
	   <span style="font-size:9pt ;">이메일</span></p>
	</td>
	<td width="513">
	   <p><span style="font-size:9pt;">
	   <%=myResultSet.getString("acc_email")%></span></p>
	</td>
   </tr>
</table>
<table cellpadding="0" cellspacing="0" width="400" height="23">
   <tr>
	<td width="150">
	   <p align="right"><span style="font-size:9pt;">
	   <a href="customerView.jsp?">
	   <font color="black">목록</font></a></span></p>
	</td>
   </tr>
</table>
<%
  }
  stmt.close();
  dbconn.close();
%>
</body>
</html>
