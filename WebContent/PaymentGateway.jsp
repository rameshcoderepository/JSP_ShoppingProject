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
            String username = (String) session.getAttribute("username");
            int cusid = (Integer) session.getAttribute("cusid");
            String totalamt = (String) session.getAttribute("totamt");

            Statement stmt = DbConnection.getConnection();

            String query = "insert into promise_transaction(cusid,username,amtpaid) values('" + cusid + "','" + username + "','" + totalamt + "')";
            int dbresponse = stmt.executeUpdate(query);
            if (dbresponse == 1) {
               out.println("Transaction details updated sucessfully");

            }

        %>

        <h1 align="center">PAYMENT</h1>
        <table align="center">
            <tr>
                <td>
                    Name
                </td>
                <td>
                    <input type="text" value="<%=username%>">
                </td>
            </tr>
            <tr>
                <td>

                </td>
                <td>
                    <%
                        out.println(" <h1><a href='bankTransfer.jsp?totamt=" + totalamt + "&usrname=" + username + "'>Bank Transfer</a></h1>");

                    %>
                </td>
            </tr>
            <tr>
                <td>

                </td>
                <td>
                    <%
                        out.println(" <h1><a href='bankTransfer.jsp?totamt=" + totalamt + "&usrname=" + username + "'>PAYTM</a></h1>");

                    %>
                   
                </td>
            </tr>
            <tr>
                <td>

                </td>
                <td>
                   <%
                        out.println(" <h1><a href='bankTransfer.jsp?totamt=" + totalamt + "&usrname=" + username + "'>Google Pay</a></h1>");

                    %>
                </td>
            </tr>
            <tr>
                <td>

                </td>
                <td>
                     <%
                        out.println(" <h1><a href='bankTransfer.jsp?totamt=" + totalamt + "&usrname=" + username + "'>COD</a></h1>");

                    %>
                </td>
            </tr>
        </table>

    </body>
</html>
