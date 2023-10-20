<%-- 
    Document   : bankTransfer
    Created on : 13 Feb, 2021, 7:29:21 AM
    Author     : user
--%>

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
            String usrname = request.getParameter("usrname");
            String totamt = request.getParameter("totamt");
        %>

        <h1 align="center">Welcome  <%=usrname%></h1>
        <form action="addPayment.jsp" method="post">
            <table align='center'>
                <tr>
                    <td>
                        Name
                    </td>
                    <td>
                        <input type="text" value="<%=usrname%>" name="uname" readonly="">
                    </td>
                </tr>
                <tr>
                    <td>
                        Amount
                    </td>
                    <td>
                        <input type="text" value="<%=totamt%>" name="tamt" readonly="">
                    </td>
                </tr>
                <tr>
                    <td>
                        Account Number
                    </td>
                    <td>
                        <input type="text" value="" name="anum" >
                    </td>
                </tr>
                <tr>
                    <td>
                        IFSC Code
                    </td>
                    <td>
                        <input type="text" value="" name="ifsc" >
                    </td>
                </tr>


                <tr>
                    <td>

                    </td>
                    <td>
                        <input type="submit" value="Pay">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
