<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>customer profile - Online Book Store </title>
</head>
<body>
	<jsp:include page="header.jsp" />
	
	<div align="center">
		<h3>Welcome,${loggedCustomer.fullname}</h3>

	<table>
	<tr>
	<td><b>E-mail Address : </b></td>
	<td>${loggedCustomer.email}</td>
	</tr>
	
	<tr>
	<td><b>Full Name: </b></td>
	<td>${loggedCustomer.fullname}</td>
	</tr>
	
	<tr>
	<td><b>Phone: </b></td>
	<td>${loggedCustomer.phone}</td>
	</tr>
	
	<tr>
	<td><b>Address: </b></td>
	<td>${loggedCustomer.address}</td>
	</tr>
	
	<tr>
	<td><b>city: </b></td>
	<td>${loggedCustomer.city}</td>
	</tr>
	
	<tr>
	<td><b>Zip code: </b></td>
	<td>${loggedCustomer.zipcode}</td>
	</tr>
	
	<tr>
	<td><b>country: </b></td>
	<td>${loggedCustomer.country}</td>
	</tr>
	
	<tr>
	<td>&nbasp;</td>
	</tr>
	
	<tr>
	<td colspan="2" align="center"><a href="edit_profile">edit my profile</a></td>
	</tr>
	
	
	</table>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>