<%@ page import="java.sql.*" contentType="text/html;charset=EUC-KR"%>
<%
 Class.forName("oracle.jdbc.driver.OracleDriver");
 String url="jdbc:oracle:thin:@localhost:1521:XE"; 
           /* 11g express edition은 orcl 대신 XE를 입력한다. */
 Connection dbconn=DriverManager.getConnection(url, "U_BANK", "mybank");
 Statement stmt = dbconn.createStatement();
 ResultSet myResultSet=stmt.executeQuery("SELECT * FROM B_CUSTOMERS");
%>
<html>

<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
<title>** 회원 정보 조회 **</title>
</head>

<body bgcolor="white" text="black" link="blue" vlink="purple" alink="red">

<form method="get" action="searchCust.jsp">
    고객명 검색 : <input type="text" name="searchname">
    <input type="submit" value="검색">
</form>

<table border="1" cellspacing="0" width="645" bordercolor="#9AD2F7" bordercolordark="white" bordercolorlight="#B9E0FA">
    <tr>
        <td width="60" height="20" bgcolor="#D2E9F9">
            <p align="center">
            <span style="font-size:8pt;"><b>고객명</b></span></p>
        </td>
        <td width="150" height="20" bgcolor="#D2E9F9">
            <p align="center">
            <span style="font-size:8pt;"><b>주소</b></span></p>
        </td>
        <td width="75" height="20" bgcolor="#D2E9F9">
            <p align="center">
            <span style="font-size:8pt;"><b>생년월일</b></span></p>
        </td>
        <td width="150" height="20" bgcolor="#D2E9F9">
            <p align="center">
            <span style="font-size:8pt;"><b>이메일</b></span></p>
        </td>
        <td width="150" height="20" bgcolor="#D2E9F9">
            <p align="center">
            <span style="font-size:8pt;"><b>전화번호</b></span></p>
        </td>
        <td width="60" height="20" bgcolor="#D2E9F9">
            <p align="center">
            <span style="font-size:8pt;"><b>직업</b></span></p>
        </td>
    </tr>
 <%
 if(myResultSet!=null){
  while(myResultSet.next()){
     String C_JUMIN=myResultSet.getString("cust_jumin");
     String C_NAME=myResultSet.getString("cust_name");
     String C_ADDR=myResultSet.getString("cust_addr");
     String C_BIRTH=myResultSet.getString("cust_birth");
     String C_EMAIL=myResultSet.getString("cust_email");
     String C_PHNUM=myResultSet.getString("cust_phnum");
     String C_JOB=myResultSet.getString("cust_job");
 %>   
    <tr>
	    <td width="60" height="20">
             <p><span style="font-size:9pt;">
             <a href="depositList.jsp?cust_jumin=<%=C_JUMIN%>">
             <font face="돋움체" color="black">
             <%=C_NAME%></font></a></span></p>
         </td>
	    <td width="150" height="20">
            <p align="center"><span style="font-size:9pt;">
            <font face="돋움체"><%=C_ADDR%></font></span></p>
        </td>

        <td width="75" height="20">
            <p align="center"><span style="font-size:9pt;">
            <font face="돋움체"><%=C_BIRTH%></font></span></p>
        </td>
        <td width="150" height="20">
            <p align="center"><span style="font-size:9pt;">
            <font face="돋움체"><%=C_EMAIL%></font></span></p>
        </td>
        <td width="150" height="20">
            <p align="center"><span style="font-size:9pt;">
            <font face="돋움체"><%=C_PHNUM%></font></span></p>
        </td>
        <td width="60" height="20">
            <p align="center"><span style="font-size:9pt;">
            <font face="돋움체"><%=C_JOB%></font></span></p>
        </td>
    </tr>
 <%
    }
   }
   stmt.close();
   dbconn.close();
 %>    
</table>
<table cellpadding="0" cellspacing="0" width="645" height="23">
    <tr>
        <td width="1350">
            <p align="right"><b><a href="customerView.jsp">
            <font size="1" face="돋움체" color="black">LIST</font></a></b></p>
        </td>
    </tr>
</table>
</body>
</html>
