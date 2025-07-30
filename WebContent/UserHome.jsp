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
		//   request.getRequestDispatcher("link.html").include(request, response);

		request.getSession(false);

		if (session != null) {
			String name = (String) session.getAttribute("username");
			int cusid = (Integer) session.getAttribute("cusid");

			out.print("<h1 align='center' style=color:blue>Hello, " + name + " Welcome to Shopping Home Page</h1>");
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
