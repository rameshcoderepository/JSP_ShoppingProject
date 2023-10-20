<%-- 
    Document   : addManualBilling
    Created on : 13 Feb, 2021, 1:11:26 PM
    Author     : user
--%>

<%@page import="DbConnection.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
</head>
<body>
	<%
		Statement stmt = DbConnection.getConnection();

		String pid = request.getParameter("pid");
		String itemname = request.getParameter("iname");
		String qty = request.getParameter("qty");
		String price = request.getParameter("price");
		String totprice = request.getParameter("tprice");

		int rs = stmt.executeUpdate("insert into billing(pid,itemname,qty,price,totprice)values('" + pid + "','"
				+ itemname + "','" + qty + "','" + price + "','" + totprice + "')");

		if (rs == 1) {
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("/AdminHome.jsp");
			requestDispatcher.include(request, response);
			out.println("Manual Bill added Sucessfully");
		}
	%>
</body>
</html>
