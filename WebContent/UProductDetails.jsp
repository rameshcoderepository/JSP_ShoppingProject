<%-- 
    Document   : AdminHome
    Created on : 29 Jan, 2021, 8:35:00 PM
    Author     : user
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="DbConnection.DbConnection"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>

<link href="css1/bootstrap.min.css" rel="stylesheet">
<link href="css1/style.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css1/font-awesome.min.css" />
<link href="https://fonts.googleapis.com/css?family=Philosopher"
	rel="stylesheet">
<link href="css1/animate.css" rel="stylesheet" type="text/css"
	media="all">
<script src="js/jquery-2.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<link
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css">
</style>
<script type="text/javascript"
	src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
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
										<a class="navbar-brand" href="index.html"><i
											class="fa fa-users"></i>Product Details </a>
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
											<li><a href="UserHome.jsp"
												class="hvr-wobble-to-top-right">HOME</a></li>
											<li class="active"><a href="UProductDetails.jsp"
												class="hvr-wobble-to-top-right">PRODUCT DETAILS</a></li>
											<li><a href="UserHome.jsp"
												class="hvr-wobble-to-top-right">BACK</a></li>
											<!--						<li><a href="details.html" class="hvr-wobble-to-top-right">BILLING</a></li>
						<li><a href="contact.html" class="hvr-wobble-to-top-right">SALES</a></li>-->
											<!--						<li class="dropdown">
						<a href="#" class="hvr-wobble-to-top-right" data-toggle="dropdown">CATEGORY <b class="caret"></b></a>
						  <ul class="dropdown-menu">
							 <li><a href="Listing.html" class="hvr-wobble-to-top-right">CUSTOMER DETAILS</a></li>
							 <li><a href="details.html" class="hvr-wobble-to-top-right">SUPPLIER DETAILS</a></li>
							 <li><a href="contact.html" class="hvr-wobble-to-top-right">PRODUCT STOCK</a></li>			 
						  </ul>
						</li>-->
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
