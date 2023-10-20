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
				<li><a href="SupplierHome.jsp">HOME</a></li>
				<li><a href="SProductDetails.jsp">ALL PRODUCT DETAILS</a></li>
				<li><a href="CheckDetails.jsp">Check Products</a></li>
				<li><a href="LogoutServlet">LogOut</a></li>
			</ul>
		</div>
	</div>

	<div class="container">
		<div class="row header" style="text-align: center; color: green">
			<h3>Product Details</h3>
		</div>
		<table id="myTable" class="table table-striped">
			<thead>
				<tr>
					<th>ITEM_ID</th>
					<th>ITEM_NAME</th>
					<th>MFD_DATE</th>
					<th>EXP_DATE</th>
				</tr>
			</thead>
			<tbody>


				<%
					Statement stmt = DbConnection.getConnection();
					ResultSet rs = stmt.executeQuery("select * from product_items");
					int flag = 0;
					while (rs.next()) {
						String item_id = rs.getString("itemid");
						String item_name = rs.getString("itemname");
						String mfd_date = rs.getString("mfddate");
						String exp_date = rs.getString("expdate");
				%>
				<tr>
					<td><%=item_id%></td>
					<td><%=item_name%></td>
					<td><%=mfd_date%></td>
					<td><%=exp_date%></td>
				</tr>
				<%
					}
				%>

			</tbody>
		</table>
	</div>
</body>
<script>
	$(document).ready(function() {
		$('#myTable').dataTable();
	});
</script>

</body>
</html>
