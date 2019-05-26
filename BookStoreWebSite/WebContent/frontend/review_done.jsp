<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <script src="./libs/jquery/1.10.1/jquery.min.js"></script>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>review posted - online book Store</title>

</head>
<body>
<jsp:include page="header.jsp" />
<div align="center">
		<table>
				<tr>
					<td>
						<h2>Your reviews</h2>
					</td>
					<td>
						<h2>${loggedCustomer.fullname}</h2>
					</td>
				</tr>
				<tr>
					<td colspan="3"><hr/>
					
					</td>
				</tr>
					<tr>
					<td>
					${book.title }<br/>
					<img
					src="data:image/jpg;base64,${book.base64Image}" width="128"
					height="164" />
					<td colspan="2">
						<h3>Your review has been posted . Thank you!</h3>
					</td>
				</tr>
			</table>
	
	</form>

	</div>
</body>
</html>