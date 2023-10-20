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
				<li><a href="SalesList.jsp">Online Sales</a></li>
				<li><a href="OfflineSalesList.jsp">Offline Sales</a></li>
				<li><a href="AdminHome.jsp">Back</a></li>
				<li><a href="LogoutServlet">LogOut</a></li>
			</ul>
		</div>
	</div>

	<div class="container">
		<div class="row header" style="text-align: center; color: green">
			<h3>Sales Details</h3>
		</div>
		<table id="myTable" class="table table-striped">
			<thead>
				<tr>
					<th>Customer ID</th>
					<th>Customer Name</th>
					<th>Total Amount Paid</th>

				</tr>
			</thead>
			<tbody>


				<%
					Statement stmt = DbConnection.getConnection();
					ResultSet rs = stmt.executeQuery("select * from promise_transaction");
					int flag = 0;
					while (rs.next()) {
						String item_id = rs.getString("cusid");
						String item_name = rs.getString("username");
						String mfd_date = rs.getString("amtpaid");
				%>
				<tr>
					<td><%=item_id%></td>
					<td><%=item_name%></td>
					<td><%=mfd_date%></td>

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
