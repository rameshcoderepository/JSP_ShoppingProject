<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="cart" class="registrarbeans.ShoppingCart" scope ="session" />  

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

        %>
         <%
   
             
          session.setMaxInactiveInterval(1800); // make session expire after 30 minutes
          //
          // Remove the item
          String idstr = request.getParameter("id");
          try
          {
           int id = Integer.parseInt(idstr);
            synchronized(session)  // lock the session
            {
             cart.remove(id);   
            }               
          }
          catch(Exception ex)
          {
            out.println("Error: "+ ex.toString()+ "<br/>");
          }
          cart.display(out);
          %>   
           <a href="findItemWithAddToCart.jsp">Add more Products</a>
    </body>
</html>
