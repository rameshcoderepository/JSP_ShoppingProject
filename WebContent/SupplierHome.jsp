<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
</head>
<body>


	<div class="col-sm-12 space_all">
		<div class="collapse navbar-collapse" id="dropdown-thumbnail-preview">
			<ul class="nav navbar-nav">
				<li class="active"><a href="SupplierHome.jsp"
					class="hvr-wobble-to-top-right">HOME</a></li>
				<li><a href="SProductDetails.jsp"
					class="hvr-wobble-to-top-right">ALL PRODUCT DETAILS</a></li>
				<li><a href="CheckDetails.jsp" class="hvr-wobble-to-top-right">Check
						Products</a></li>
				<li><a href="LogoutServlet" class="hvr-wobble-to-top-right">LogOut</a></li>

			</ul>
		</div>
	</div>



	<%
		//   request.getRequestDispatcher("link.html").include(request, response);

		request.getSession(false);

		if (session != null) {
			String name = (String) session.getAttribute("username");
			int cusid = (Integer) session.getAttribute("cusid");

			out.print("Hello, " + name + " Welcome to Shopping Home Page");
		} else {
			out.print("Please login first");
			request.getRequestDispatcher("Login.html").include(request, response);
		}
	%>
	<%
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Cache-Control", "no-store");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);

		if (session.getAttribute("username") == null)
			response.sendRedirect("Login.jsp");
	%>
</body>
</html>
