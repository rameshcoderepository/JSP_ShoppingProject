<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<link
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</head>
<body>

	<section id="header" class="cd-secondary-nav">
		<nav class="navbar navbar-default" role="navigation">
			<div class="container">
				<div class="row">
					<div class="col-sm-12 space_all">
						<div class="col-sm-4 space_all">
							<div class="navbar-header">
								<button type="button" class="navbar-toggle"
									data-toggle="collapse"
									data-target="#dropdown-thumbnail-preview">
									<span class="sr-only">Toggle navigation</span> <span
										class="icon-bar"></span> <span class="icon-bar"></span> <span
										class="icon-bar"></span>
								</button>
								<div class="header_2">
									<h2>
										<a class="navbar-brand" href="#"><i class="fa fa-users"></i>User
											Home </a>
									</h2>
								</div>
							</div>
						</div>
						<div class="col-sm-8 space_all">
							<div class="col-sm-12 space_all">
								<div class="header_5 clearfix">
									<div class="col-sm-5">
										<div class="header_3">
											<!--<input type="text" class="form-control" placeholder="Matrimony ID / Mobile No. / E-mail">-->
										</div>
									</div>
									<div class="col-sm-5">
										<div class="header_3">
											<!--<input type="text" class="form-control" placeholder="Password">-->
										</div>
									</div>
									<div class="col-sm-2">
										<div class="header_4">
											<!--<p><a href="#">Log In</a></p>-->
										</div>
									</div>
								</div>
								<div class="col-sm-12 space_all">
									<div class="header_6">
										<div class="col-sm-5 space_all">
											<div class="col-sm-12 space_all">
												<div class="col-sm-1 space_all">
													<div class="header_7">
														<!--				   <p><a href="#"><input type="checkbox"></a></p>-->
													</div>
												</div>
												<div class="col-sm-11 space_all">
													<div class="header_7">
														<!--				 <a href="#"><span class="well_2">Keep me logged in</span></a>-->
													</div>
												</div>
											</div>
										</div>
										<div class="col-sm-7">
											<div class="header_8"></div>
										</div>
									</div>
								</div>
								<div class="col-sm-12 space_all">
									<div class="collapse navbar-collapse"
										id="dropdown-thumbnail-preview">
										<ul class="nav navbar-nav">
											<li class="active"><a href="UserHome.jsp"
												class="hvr-wobble-to-top-right">HOME</a></li>
											<li><a href="UProductDetails.jsp"
												class="hvr-wobble-to-top-right">ALL PRODUCT DETAILS</a></li>
											<li><a href="findItemWithAddToCart.jsp"
												class="hvr-wobble-to-top-right">Buy Product</a></li>
											<!--						<li><a href="details.html" class="hvr-wobble-to-top-right">BILLING</a></li>
						<li><a href="contact.html" class="hvr-wobble-to-top-right">SALES</a></li>-->

											<li><a href="LogoutServlet"
												class="hvr-wobble-to-top-right">LogOut</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</nav>
	</section>


	<%
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Cache-Control", "no-store");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);

		if (session.getAttribute("username") == null)
			response.sendRedirect("Login.jsp");
	%>


	<%
		try {
			// open a connection
			Connection con = null;
			Class.forName("com.mysql.jdbc.Driver"); // load the driver
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/product", "root", "admin");
			// create the sql command
			Statement prep = con.createStatement();

			ResultSet rs = prep.executeQuery("Select * from product_items");
	%>
	<div>
		<div style="text-align: center; color: green">
			<h3>Product Details</h3>
		</div>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">ITEM_ID</th>
					<th scope="col">ITEM_NAME</th>
					<th scope="col">MFD_DATE</th>
					<th scope="col">EXP_DATE</th>
					<th scope="col">Price</th>
					<th scope="col"></th>

				</tr>
			</thead>
			<tbody>
				<%
					// process results one row at a timne    
						while (rs.next()) {
							out.println("<tr>");
							out.println("<td>" + rs.getString(1) + "</td>");
							out.println("<td>" + rs.getString(2) + "</td>");
							out.println("<td>" + rs.getString(3) + "</td>");
							out.println("<td>" + rs.getString(4) + "</td>");
							//out.println("<td>"+rs.getString(5)+"</td>");
							out.println("<td>" + rs.getString(6) + "</td>");

							String name = rs.getString(2);
							name = java.net.URLEncoder.encode(name, "UTF-8"); // fix name into a url ok       
							out.println("<td><a href='addItemToCart.jsp?id=" + rs.getString(1) + "&name=" + name
									+ "&quantity=1&price=" + rs.getString(6) + ""
									+ "'><input type='button' value='Add to Cart'/></A></td>");

							out.println("</tr>");
						}
				%>
			</tbody>
		</table>
	</div>
	<%
		prep.close();
			con.close();
		} catch (Exception ex) {
			out.println("Sorry, the system is unavailable<br/>");
			out.println(ex.toString() + "<br/>");
		}
	%>
</body>
</html>
