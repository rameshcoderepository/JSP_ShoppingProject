<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="student" class="registrarbeans.Student" scope="session" />
<%@page errorPage = "errorPage.jsp" %>
<%@page import="java.sql.*"%>
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

            if (!student.isLoggedIn()) {
                response.sendRedirect("login.html");
            } else {

                try {
                    // load the driver and create the connection
                    Connection con = null;
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/product", "root", "admin");

                    Statement prep = con.createStatement();
                  
                    ResultSet rs = prep.executeQuery("Select * from product_items");
                    out.println("<table>");
                    out.println("<tr><th>CRN</th><th>Title</th><th>Instructor</th></tr>");
                    while (rs.next()) {
                        out.println("<tr>");
                        out.println("<td>" + rs.getString(1) + "</td>");
                        out.println("<td>" + rs.getString(2) + "</td>");
                        out.println("<td>" + rs.getString(3) + "</td>");
                        out.println("</tr>");
                    }
                    out.println("</table>");
                    prep.close();

                    con.close();

                } catch (Exception ex) {
                    out.println("Sorry, system is unavailable");
                    out.println(ex.toString());

                }
            }
        %>  

    </body>
</html>
