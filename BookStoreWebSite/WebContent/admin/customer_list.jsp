<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Customer - Evergreen Bookstore Administration</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div align="center">
		<h2>Customer Mangment</h2>
		<a href="customer_form.jsp">Create New Customer</a>
	</div>
	
	<c:if test="${Message != null}"></c:if>
	<div align="center">
	<h4>${Message}</h4>
	</div>
	<div align="center" >
		<table border="1" cellpadding="5">
			<tr>
				<th>Index</th>
				<th>ID</th>
				<th>E-Mail</th>
				<th>Full Name</th>
				<th>City</th>
				<th>Country</th>
				<th>Registered Date</th>
				<th>Actions</th>
			</tr>
			<c:forEach var="customer" items="${listCustomer}" varStatus="status">
				<tr>
					<td>${status.index +1}</td>
					<td>${customer.customerId}</td>
					<td>${customer.email}</td>
					<td>${customer.fullname}</td>
					<td>${customer.city}</td>
					<td>${customer.country}</td>
					<td>${customer.registerDate}</td>
					<td><fmt:formatDate pattern ="MM/dd/yyyy" value= '${Book.publishDate}'/></td>
					<td><a href="edit_customer?id=${customer.customerId}">Edit Customer</a>&nbsp; 
					<a href="javascript:void(0);" class ="deletelink" id ="${customer.customerId}">Delete</a>
					&nbsp;</td>
				</tr>
			</c:forEach>
		</table>

	</div>

	<jsp:include page="footer.jsp" />
	<script type="text/javascript">
	$(document).ready(function(){
		$(".deleteLink").each(function(){
			$(this).on("click",function(){
				customerId=$(this).attr("id");
				if (confirm("Are you sure you want to delete the customer with id "+customerId}+"?")){
					window location = "delete_book?id="+customerId;
				}
			});
		});
	});
	</script>
	
</body>

</html>