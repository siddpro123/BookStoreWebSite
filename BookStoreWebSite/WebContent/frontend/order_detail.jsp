<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Order details - Evergreen Bookstore Administration</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<c:if test="${order == null}">
	<h2>Sorry, You cannot anuthorized to view this order</h2>
	</c:if>
	
	<c:if test="${order != null}">
	<h2>Sorry, You cannot anuthorized to view this order</h2>	
	<div align="center">
		<h2>Your order ID:${order.orderId}</h2>
	</div>

	<div align="center" >
		<h2>Order Overview:</h2>
		<table>
			<tr>
				<td>order Status:</td>
				<td>${order.status}</td>
			</tr>
			<tr>
				<td>order date:</td>
				<td>${order.orderDate}</td>
			</tr>
			<tr>
				<td>Quantity:</td>
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
				<td>Shipping to:</td>
				<td>${order.shippingAddress}</td>
			</tr>
			<tr>
				<td>Payment method:</td>
				<td>${order.paymentMethod}</td>
			</tr>
		</table>
	</div>
	
	<div align="center">
	<table>
			<tr>
				<th>NO</th>
				<th>Book </th>
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
	</div>
	</c:if>
	<jsp:include page="footer.jsp" />
</body>
</html>