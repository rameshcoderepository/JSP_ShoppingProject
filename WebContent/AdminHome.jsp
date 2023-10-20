<%-- 
    Document   : AdminHome
    Created on : 29 Jan, 2021, 8:35:00 PM
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

	<div>
		<div>
			<ul>
				<li><a href="AdminHome.jsp">HOME</a></li>
				<li><a href="ProductDetails.jsp">PRODUCT DETAILS</a></li>
				<li><a href="AdminManualBilling.jsp">BILLING</a></li>

				<li><a href="SalesList.jsp">SALES</a></li>
				<li><a href="chkexpdate.jsp">Check Expiry Date</a></li>

				<li><a href="#" data-toggle="dropdown">CATEGORY <b></b>
				</a>
					<ul>
						<li><a href="customerdetails.jsp">CUSTOMER DETAILS</a></li>
						<li><a href="supplierdetails.jsp">SUPPLIER DETAILS</a></li>
						<li><a href="productstock.jsp">PRODUCT STOCK</a></li>
					</ul></li>
				<li><a href="LogoutServlet">LogOut</a></li>
			</ul>
		</div>
	</div>

	<%
		//   request.getRequestDispatcher("link.html").include(request, response);
		request.getSession(false);

		if (session != null) {
			String name = (String) session.getAttribute("username");

			out.print("Hello, " + name + " Welcome to Shopping Admin Home Page");
		} else {
			out.print("Please login first");
			request.getRequestDispatcher("Login.html").include(request, response);
		}
	%>

</body>
</html>
