<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
try
{
Class.forName("com.mysql.cj.jdbc.Driver") ;	

Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/newbatch","root","Root@123");
PreparedStatement ps=con.prepareStatement("select * from singup where name=? and password=?");
ps.setString(1,request.getParameter("t1"));
ps.setString(2, request.getParameter("t2"));
ResultSet rs=ps.executeQuery();
if(rs.next()){
	%>
	<jsp:include page="menu.html"/>
	<% 
}
else {
	%>
	<h1>Login Failed</h1>
	<jsp:include page="Signin.html"/>
	<%
}
rs.close();
con.close();
}catch(Exception e){
	out.println(e);
}
%>
</body>
</html>