
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>

<script type="text/javascript">
	function sum() {
		// alert("1");
		var txtFirstNumberValue = document.getElementById('qty').value;
		var txtSecondNumberValue = document.getElementById('price').value;

		if (txtFirstNumberValue == "")
			txtFirstNumberValue = 0;
		if (txtSecondNumberValue == "")
			txtSecondNumberValue = 0;

		var result = parseInt(txtFirstNumberValue)
				* parseInt(txtSecondNumberValue);
		if (!isNaN(result)) {
			document.getElementById('tprice').value = result;
		}
	}
</script>
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
				<li><a href="AdminManualBilling.jsp">Billing</a></li>
				<li><a href="AdminHome.jsp">BACK</a></li>

				<li><a href="LogoutServlet">LogOut</a></li>
			</ul>
		</div>
	</div>

	<h1 align='center'>Manual Billing Page</h1>
	<form action="addManualBilling.jsp" method="post">
		<table align='center' border='1'>
			<tr>
				<th>Product Id</th>
				<th>Item Name</th>
				<th>Quantity</th>
				<th>Price</th>
				<th>Total Price</th>
			</tr>
			<td><input type="text" placeholder="Product Id" name="pid"
				required=""></td>
			<td><input type="text" placeholder="Item Name" name="iname"
				required=""></td>
			<td><input type="text" placeholder="Quantity" id="qty"
				onkeyup="sum()" name="qty"></td>
			<td><input type="text" placeholder="Price" id="price"
				onkeyup="sum()" name="price"></td>
			<td><input type="text" placeholder="Total Price" onclick="sum()"
				id="tprice" name="tprice"></td>
		</table>
		<br> <br>
		<table align='center'>
			<tr>
				<td><input type="submit" value="Total Amount to Pay" /></td>
			</tr>
		</table>
	</form>
</body>
</html>
