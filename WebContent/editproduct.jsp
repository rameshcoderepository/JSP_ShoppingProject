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
				<li class="active"><a href="#">EDIT PRODUCT</a></li>
				<li><a href="NewProduct.jsp">ADD PRODUCT</a></li>
				<li><a href="deleteproduct.jsp">DELETE PRODUCT</a></li>
				<li><a href="productstock.jsp">BACK</a></li>
				<li><a href="LogoutServlet">LogOut</a></li>
			</ul>
		</div>
	</div>
	<div>
		<div style="text-align: center; color: green">
			<h3>EDIT Product</h3>
		</div>

		<%
			String itemId = request.getParameter("iid");
			String itemName = request.getParameter("iname");
			String noOfQty = request.getParameter("noOfQty");
			String price = request.getParameter("price");
			String mdate = request.getParameter("mdate");
			String edate = request.getParameter("edate");
		%>

		<form action="UpdateProduct.jsp" method="post">
			<table align="center">
				<tr>
					<td>Item_ID</td>
					<td><input type="text" name="iid" readonly=""
						value="<%=itemId%>" /></td>
				</tr>
				<tr>
					<td>Item_Name</td>
					<td><input type="text" name="iname" value="<%=itemName%>" /></td>
				</tr>
				<tr>
					<td>No_OF_Quantity</td>
					<td><input type="text" name="noOfQty" value="<%=noOfQty%>" />
					</td>
				</tr>
				<tr>
					<td>Price</td>
					<td><input type="text" name="price" value="<%=price%>" /></td>
				</tr>
				<tr>
					<td>MFD_Date</td>
					<td><input type="text" name="mdate" value="<%=mdate%>" /></td>
				</tr>
				<tr>
					<td>EXP_Date</td>
					<td><input type="text" name="edate" value="<%=edate%>" /></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="submit" /></td>
				</tr>
			</table>
		</form>
</body>
</html>
