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

                Statement stmt = DbConnection.getConnection();
                String sql = "DELETE FROM product_items WHERE itemid='" + itemId + "' and itemname='" + itemName + "'";
            

                 int resvalue = stmt.executeUpdate(sql);

                if (resvalue == 1) {
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("/deleteproduct.jsp");
                    requestDispatcher.forward(request, response);
                    out.println("Product Updated sucessfully");
                }
        %>
    </body>
</html>
