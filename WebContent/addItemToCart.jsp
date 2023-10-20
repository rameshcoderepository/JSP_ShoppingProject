
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="registrarbeans.*"%>
<jsp:useBean id="item" class="registrarbeans.Item" scope = "request" />
<jsp:useBean id="cart" class="registrarbeans.ShoppingCart" scope ="session" />
<jsp:setProperty name="item" property="*" />

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
    //
    // set the session's inactive interval
    //
     session.setMaxInactiveInterval(1800); // 30 minutes  
            
    //
    // now add the item to the cart
    //
    synchronized(session)  // lock the session
    { 
       cart.add(item); // cart uses ArrayList which is not thread safe so we locked
       cart.display(out); // tell the cart to send its contents to the browser
     }
    %> 
    <a href="findItemWithAddToCart.jsp">Add more Products</a>
    </body>
</html>
