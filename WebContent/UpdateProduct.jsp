<%@page import="java.sql.ResultSet"%>
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


	<div >
		<div class="collapse navbar-collapse" id="dropdown-thumbnail-preview">
			<ul class="nav navbar-nav">
				<li><a href="AdminHome.jsp" class="hvr-wobble-to-top-right">HOME</a></li>
				<!--						<li class="active"><a href="#" class="hvr-wobble-to-top-right">EDIT PRODUCT</a></li>
                                                                                                
                                                                                                <li><a href="NewProduct.jsp" class="hvr-wobble-to-top-right">ADD PRODUCT</a></li>
                                                                                                <li><a href="deleteproduct.jsp" class="hvr-wobble-to-top-right">DELETE PRODUCT</a></li>-->
				<li><a href="AdminHome.jsp" class="hvr-wobble-to-top-right">BACK</a></li>

				<li><a href="LogoutServlet" class="hvr-wobble-to-top-right">LogOut</a></li>
			</ul>
		</div>
	</div>



	<div class="container">
		<div class="row header" style="text-align: center; color: green">

		</div>

		<%
			String itemId = request.getParameter("iid");
			String itemName = request.getParameter("iname");
			String noOfQty = request.getParameter("noOfQty");
			String price = request.getParameter("price");
			String mdate = request.getParameter("mdate");
			String edate = request.getParameter("edate");

			Statement stmt = DbConnection.getConnection();

			String updquery = "UPDATE product_items SET itemname='" + itemName + "', mfddate='" + mdate + "', expdate='"
					+ edate + "',noOfQty='" + noOfQty + "',price='" + price + "' where itemId='" + itemId + "'";

			int resvalue = stmt.executeUpdate(updquery);

			if (resvalue == 1) {
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("/productstock.jsp");
				requestDispatcher.forward(request, response);
				out.println("Product Updated sucessfully");
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
