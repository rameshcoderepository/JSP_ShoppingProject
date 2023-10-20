<%-- 
    Document   : addPayment
    Created on : 13 Feb, 2021, 7:58:37 AM
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
            String usrname = request.getParameter("uname");
            String totamt = request.getParameter("tamt");
            String actnumber = request.getParameter("anum");
            String ifsccode = request.getParameter("ifsc");

            Statement stmt = DbConnection.getConnection();

            String query = "insert into bankdetails(username,totalamt,accountnumber,ifsc) values('" + usrname + "','" + totamt + "','" + actnumber + "','" + ifsccode + "')";
            int dbresponse = stmt.executeUpdate(query);
            if (dbresponse == 1) {
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("/findItemWithAddToCart.jsp");
                requestDispatcher.include(request, response);
                out.println("Transaction completed sucessfully");
                System.out.println("Transaction details updated sucessfully");

            }

        %>
    </body>
</html>
