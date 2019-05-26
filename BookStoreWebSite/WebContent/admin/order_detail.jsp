<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Order details - Evergreen Bookstore Administration</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div align="center">
		<h2>Details of order ID:${order.orderId}</h2>
	</div>
	
	<c:if test="${Message != null}">
	<div align="center">
	<h4>${Message}</h4>
	</div>
	</c:if>
	<div align="center" >
		<h2>Order Overview:</h2>
		<table>
			<tr>
				<td>Ordered By:</td>
				<td>${order.customer.fullname}</td>
			</tr>
			<tr>
				<td>Book copies:</td>
				<td>${order.bookCopies}</td>
			</tr>
			<tr>
				<td>Total Amount:</td>
				<td><fmt:formatNumber value=" ${order.total}"
										type="currency" /></td>
			</tr>
			<tr>
				<td>Recipient Name:</td>
				<td>${order.recipientName}</td>
			</tr>
			<tr>
				<td>Recipient phone:</td>
				<td>${order.recipientPhone}</td>
			</tr>
			<tr>
				<td>Payment method:</td>
				<td>${order.paymentMethod}</td>
			</tr>
			<tr>
				<td>Shipping Address:</td>
				<td>${order.shippingAddress}</td>
			</tr>
			<tr>
				<td>order date:</td>
				<td>${order.orderDate}</td>
			</tr>
		</table>
	</div>
	
	<div align="center">
	<table>
			<tr>
				<th>Index</th>
				<th>Book Title</th>
				<th>Author</th>
				<th>Price</th>
				<th>Quantity</th>
				<th>Subtotal</th>
			</tr>
			<c:forEach var="order" items="${order.orderDetails}" varStatus="status">
				<tr>
					<td>${status.index + 1}</td>
					<td>
					<img style="vertical-align: " src="data:image/jpg;base64,${orderDetail.book.base64Image}" width ="48" height="64">
					${orderDetail.book.title}</td>
					<td>${orderDetail.book.author}</td>
					<td><fmt:formatNumber value=" ${orderDetail.book.price}"
										type="currency" /></td>
					<td>${orderDetail.quantity}</td>
					<td><fmt:formatNumber value=" ${orderDetail.subtotal}"
										type="currency" /></td>				
				</tr>
				
				<tr>
					<td colspan="4" align="right">total</td>
					<td>${order.bookCopies}</td>
					<td><fmt:formatNumber value=" ${order.total}"
										type="currency" /></td>				
				</tr>
			</c:forEach>
		</table>
		<div>
			<a href="edit_review?id=${review.reviewId}">Edit this order</a>&nbsp; 
			<a href="javascript:confirmDelete(${review.reviewId})">Delete this order</a>&nbsp;
		</div>	
	
	</div>

	<jsp:include page="footer.jsp" />
	<script type="text/javascript">
	function confirmDelete (categoryId) {
		if (confirm("Are you sure you want to delete the review with id "+reviewId+"?")){
			window location = "delete_review?id="+reviewId;
		}
		
	}
	
	
	</script>
	
</body>

</html>