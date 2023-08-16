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
try {
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/newbatch","root","Root@123");
PreparedStatement ps=con.prepareStatement("insert into singup(Name,password,Email) values(?,?,?)");
ps.setString(1,request.getParameter("t1"));
ps.setString(2, request.getParameter("t2"));
ps.setString(3, request.getParameter("t3"));

int i=ps.executeUpdate();
if(i>0)
	out.println("<a href='Signin.html'>Click here to Signin</a>");
else
	out.println("<h1>Login failed</h1>");
con.close();
}catch(Exception e){
	out.println(e);
}
%>
</body>
</html>