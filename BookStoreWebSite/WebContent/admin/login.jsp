<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <script src="./libs/jquery/1.10.1/jquery.min.js"></script>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>
</head>
<body>
<div align="center">
<h1>Books store Administartaion</h1>
<h1>Admin Login</h1>

<c:if test="${Message != null}"></c:if>
	<div align="center">
	<h4>${Message}</h4>
</div>
			<form id="formLogin" action="login" method="post"></form>
			<table>
				<tr>
					<td align="center">Email:</td>
					<td align="left"><input type="text" id="email" name="email"
						size="20" value="${user.email}" /></td>
				</tr>
				<tr>
					<td align="center">password:</td>
					<td align="left"><input type="password" id="password"
						name="password" size="20" value="${user.password}" /></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<button type ="submit">Login</button>
					</td>
				</tr>

			</table>
		</form>
	</div>
<script type="text/javascript">
$(document).ready(function () {
	$("#loginForm").validate({
		rules:{
			email:{
				required: true,
				email: true
			},
			password: "password",
		},
		messages:{
			email:{
				required: "please enter email",
				email:"please enter an valid email address"
			},
			password: "please enter password"
		}
	});
	
});
</script>

</body>
</html>