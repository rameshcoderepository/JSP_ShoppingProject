<%@page import="DbConnection.DbConnection"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="cart" class="registrarbeans.ShoppingCart" scope ="session" />  
<%@page errorPage = "errorPage.jsp" %>
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
            String username = (String) session.getAttribute("username");
            int cusid = (Integer) session.getAttribute("cusid");
            out.println(username + " " + cusid);
            String url = "\"jdbc:mysql://localhost:3306/product\",\"root\",\"admin\"";

            int result = cart.checkOut(url, cusid);
            if (result == 1) {
                String totamt = request.getParameter("totalamt");
                out.println("Total Amount to Pay"+" "+totamt);
                
                session.setAttribute("totamt",totamt);
            }


        %>
        <a href="PaymentGateway.jsp">Click to pay</a>
    </body>
</html>
