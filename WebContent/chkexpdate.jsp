<%@page import="java.sql.ResultSet"%>
<%@page import="DbConnection.DbConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
</head>
<body style="background-color: #f7ecb5">
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
				<li><a href="chkexpdate.jsp">Check Expiry Date</a></li>
				<li><a href="AdminHome.jsp">BACK</a></li>

				<li><a href="LogoutServlet">LogOut</a></li>
			</ul>
		</div>
	</div>

	<div class="container">
		<div class="row header" style="text-align: center; color: green">
			<h3>Product Details</h3>
		</div>

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

					String query = " ";

					DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
					String currentformattedDate = df.format(new Date());

					Date date1 = new SimpleDateFormat("dd-MM-yyyy").parse(currentformattedDate);

					// Date current = new Date();
					long prevDay = System.currentTimeMillis() - 1000 * 60 * 60 * 24;

					DateFormat df1 = new SimpleDateFormat("dd-MM-yyyy");

					String prev = df1.format(new Date(prevDay));

					Date date2 = new SimpleDateFormat("dd-MM-yyyy").parse(exp_date);

					if (date2.before(date1)) {
						System.out.println("Product is going to expiry");
			%>
			Product
			<%=item_name%>
			is Expired
			<%=exp_date%>
			<br>



			<%
				} else if (date1.before(date2)) {
			%>
			<!--Product <%=item_name%> is Expired <%=exp_date%> <br>-->
			<%
				}
				}
			%>
		
	</div>
</body>
<script>
	$(document).ready(function() {
		$('#myTable').dataTable();
	});
</script>
</body>
</html>
