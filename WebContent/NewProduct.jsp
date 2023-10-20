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
	<div class="col-sm-12 space_all">
		<div class="collapse navbar-collapse" id="dropdown-thumbnail-preview">
			<ul class="nav navbar-nav">
				<li><a href="AdminHome.jsp" class="hvr-wobble-to-top-right">HOME</a></li>
				<li class="active"><a href="NewProduct.jsp"
					class="hvr-wobble-to-top-right">NEE PRODUCT</a></li>

				<li><a href="AdminHome.jsp" class="hvr-wobble-to-top-right">BACK</a></li>

				<li><a href="LogoutServlet" class="hvr-wobble-to-top-right">LogOut</a></li>
			</ul>
		</div>
	</div>

	<form action="addNewProduct.jsp" method="post">
		<table align="center">
			<tr>
				<td>Item_ID</td>
				<td><input type="text" name="iid" value="" /></td>
			</tr>
			<tr>
				<td>Item_Name</td>
				<td><input type="text" name="iname" value="" /></td>
			</tr>
			<tr>
				<td>MFD_Date</td>
				<td><input type="text" name="mdate" value="" /></td>
			</tr>
			<tr>
				<td>EXP_Date</td>
				<td><input type="text" name="edate" value="" /></td>
			</tr>
			<tr>
				<td>No.of.Quantity</td>
				<td><input type="text" name="noOfQty" value="" /></td>
			</tr>
			<tr>
				<td>Price</td>
				<td><input type="text" name="price" value="" /></td>
			</tr>


			<tr>
				<td></td>
				<td><input type="submit" value="submit" /></td>
			</tr>
		</table>
	</form>
</body>
</html>
