<%-- 
    Document   : addNewProduct
    Created on : 31 Jan, 2021, 8:34:13 AM
    Author     : user
--%>

<%@page import="DbConnection.DbConnection"%>
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
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Cache-Control", "no-store");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);

		if (session.getAttribute("username") == null)
			response.sendRedirect("Login.jsp");
	%>
        <%
                String itemId = request.getParameter("iid");
                String itemName = request.getParameter("iname");
                String mdate = request.getParameter("mdate");
                String edate = request.getParameter("edate");
                String noOfQty = request.getParameter("noOfQty");
                String price = request.getParameter("price");

                Statement stmt = DbConnection.getConnection();
                 String query="insert into product_items(itemid,itemname,mfddate,expdate,noOfQty,price) values('"
                         +itemId+"','"+itemName+"','"+mdate+"','"+edate+"','"+noOfQty+"','"+price+"')";
                int resvalue = stmt.executeUpdate(query);

                if (resvalue == 1) {
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("/productstock.jsp");
                    requestDispatcher.forward(request, response);
                    out.println("Product Updated sucessfully");
                }


            %>
    </body>
</html>
