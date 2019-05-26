<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register customer</title>
<link rel="stylesheet" href ="/css/jquery-ui.min.css">
<script type="text/javascript" src ="/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src ="/js/jquery.validate.min.js"></script>

</head>
<body>
	<jsp:include page="header.jsp" />
	<div align="center">
		<h2 class = 'pageheading'>
			Edit my profile
		</h2>
	</div>
	
	<div align="center">

		<form action="update_profile" method="post" id ="customerForm" >
		<
			<table>
				<tr>
					<td align="right">E-mail</td>
					<td align="left">${loggedCustomer.email}(cannot be changed)</td>
				</tr>
				<tr>
					<td align="right">Full Name:</td>
					<td align="left">${loggedCustomer.fullname}</td>
				</tr>
				<tr>
					<td align="right">Phone Number:</td>
					<td align="left">${loggedCustomer.phone}</td>
				</tr>
				<tr>
					<td align="right">City:</td>
					<td align="left">${loggedCustomer.city}</td>
				</tr>
				<tr>
					<td align="right">Zip Code:</td>
					<td align="left">${loggedCustomer.zipcode}</td>
				</tr>
				<tr>
					<td align="right">Country:</td>
					<td align="left">${loggedCustomer.country}</td>
				</tr>
				<tr>
					<td align="right">Address:</td>
					<td align="left">${loggedCustomer.address}</td>
				</tr>
				
				<tr>
				<td colspan="2">Leave password fields blank if you dont want to change it</td>
				</tr> 
				
				<tr>
					<td align="right">Password:</td>
					<td align="left"><input type="text" id="password"
						name="password" size="45" /></td>
				</tr>
				<tr>
					<td align="right">Confirmed Password:</td>
					<td align="left"><input type="text" id="confirmedpassword"
						name="confirmedpassword" size="45"/></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="Save" />Save<input type="button" value="Cancel"
						onclick="javascript: history.go(-1)" />Cancel</td>
				</tr>

			</table>

		</form>
	</div>
	<jsp:include page="footer.jsp" />
</body>
<script type="text/javascript">
$(document).ready(function () {
	
	$("#customerForm").validate({
		rules:{
			email: {
				required: true,
				email: true
			},
			fullName:"required",
			confirmPassword:{
		
				equalTo: "#password",
			},
			publishDate: "required",
			Phone:"required" ,
			Address:"required" ,
			City: "required",
			ZipCode: "required",
			Country: "required",
		},
		messages:{
			email: {
				required: " please enter valid email",
				email: "please enter a valid email"
			},
			fullName:"please select a full name",

			confirmPassword:{
				equalTo: "Confirm password doesnt match with password"
			},
			Phone:"please enter phone" ,
			Address:"please enter address" ,
			City: "please enter city",
			ZipCode: "please enter zipcode",
			Country: "please enter country",
		}
	});
	
	$("#buttonCancel").click(function()){
		history.go(-1);
	});
	
});

</script>
</html>>