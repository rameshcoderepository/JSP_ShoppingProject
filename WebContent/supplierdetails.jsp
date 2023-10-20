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


	<div>
		<div>
			<ul>
				<li><a href="AdminHome.jsp">HOME</a></li>
				<li><a href="supplierdetails.jsp">SUPPLIER DETAILS</a></li>
				<li><a href="AdminHome.jsp">BACK</a></li>
				<li><a href="LogoutServlet">LogOut</a></li>
			</ul>
		</div>
	</div>

	<div class="container">
		<div class="row header" style="text-align: center; color: green">
			<h3>Supplier Details</h3>
		</div>
		<table id="myTable" class="table table-striped">
			<thead>
				<tr>
					<th>SUPPLIER_ID</th>
					<th>SUPPLIER_NAME</th>
					<th>MAIL_ID</th>
					<th>MOBILE_NUMBER</th>
				</tr>
			</thead>
			<tbody>


				<%
					Statement stmt = DbConnection.getConnection();
					ResultSet rs = stmt.executeQuery("select * from register where category='" + 2 + "'");
					int flag = 0;
					while (rs.next()) {
						int item_id = rs.getInt("cusid");
						String item_name = rs.getString("username");
						String mfd_date = rs.getString("mailid");
						String exp_date = rs.getString("mobnum");
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
