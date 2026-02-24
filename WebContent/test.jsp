<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page import="java.io.*,java.util.*, jakarta.servlet.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      
        <%
            DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
            String formattedDate = df.format(new Date());

            out.println(formattedDate);
        %>
    </body>
</html>
