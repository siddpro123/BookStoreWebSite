<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Evergreen Bookstore Administration</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div align="center">
		<h2>Administrative Dashboard</h2>
	</div>
	<div align="center">
		<hr width="60%" />
		<h2>Quick Actions:</h2>
		<b> <a href="create_Book">New Book</a>&nbsp; <a href="create_user">New
				User</a>&nbsp; <a href="create_catagory">New Catagory</a>&nbsp; <a
			href="create_customer">New Customer</a>&nbsp;
		</b>
		<hr width="60%" />
	</div>
	<div align="center">Recent Sales:</div>
	<hr width="60%" />
	<div align="center">Recent Reviews:</div>
	<hr width="60%" />
	<div align="center">Statistics:</div>
	<hr width="60%" />
	<jsp:include page="footer.jsp" />
</body>
</html>