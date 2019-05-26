<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Order  - Evergreen Bookstore Administration</title>
<script type="text/javascript" src ="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src ="../js/jquery.validate.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div align="center">
		<h2>Edit order ID:${order.orderId}</h2>
	</div>
	
	<c:if test="${Message != null}">
	<div align="center">
	<h4>${Message}</h4>
	</div>
	</c:if>
	<form ac action="update_order" method ="post" id="orderForm">
	
	<div align="center" >
		
		<table>
			<tr>
				<td>Ordered By:</td>
				<td>${order.customer.fullname}</td>
			</tr>
			<tr>
				<td>order date:</td>
				<td>${order.orderDate}</td>
			</tr>
			<tr>
				<td>Recipient Name:</td>
				<td><input type="text" name =" recipientName" value="${order.recipientName}" size="45"/></td>
			</tr>
			<tr>
				<td>Recipient phone:</td>
				<td><input type="text" name =" recipientPhone" value="${order.recipientPhone}" size="45"/></td>
			</tr>
			<tr>
				<td>Shipping to:</td>
				<td><input type="text" name =" shippingAddress" value="${order.shippingAddress}" size="45"/></td>
				
			</tr>
			<tr>
				<td>Payment method:</td>
				<td>
				<select name="paymentMethod">
					<option value="Cash On Delivery">Cash On Delivery</option>
				</select>
			  </td>
			</tr>
			<tr>
				<td>Order Status:</td>
				<td>
				<select name="OrderStatus">
					<option value="processing">processing</option>
					<option value="shipping">shipping</option>
					<option value="delivered">Delivered</option>
					<option value="completed">completed</option>
					<option value="canceled">canceled</option>
				</select>
				
				</td>
				
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
					<td>${orderDetail.book.title}</td>
					<td>${orderDetail.book.author}</td>
					<td><fmt:formatNumber value=" ${orderDetail.book.price}"
										type="currency" /></td>
					 <td><input type = "hidden" name="bookId" value=" ${item.key.bookId}"size="5"/>
					<input type="text" name =" quantity" value="${item.value}" size="5"/></td>
					
					
					<td><fmt:formatNumber value=" ${orderDetail.subtotal}"
										type="currency" /></td>	
										
					<td><a href="remove_book_form_order?id=${orderDetail.book.bookId}" >Remove</a></td>			
				</tr>
				
				<tr>
					<td colspan="4" align="right">total</td>
					<td>${order.bookCopies}</td>
					<td><fmt:formatNumber value=" ${order.total}"
										type="currency" /></td>				
				</tr>
			</c:forEach>
		</table>
		<div align="center">
			<a href="javascript:showAddBookPopup()">Add Books</a>
			&nbsp; &nbsp;
			<input type="submit" value="save"/>
			<input type="button" value="cancel" onclick="javascript:window.location.href=list_order;"/>
			
		</div>	
	
	</div>
</form>
	<jsp:include page="footer.jsp" />
	<script type="text/javascript">
	function showAddBookPopup() {
		
		var width = 600;
		var height = 240;
		var left = (screen.width-width)/2;
		var top = (screen.height-height)/2;
		window.open('add_book_form', '_blank','width='+ width+ ', height='+height+', top='+top+',left='+left);
	}
	
	<script type="text/javascript">
	$(document).ready(function () {
		
		$("#orderForm").validate({
			rules:{
				
				recipientName:"required",
				recipientPhone:"required",
				shippingAddress:"required",
			},
			messages:{
		
				recipientName:"please select a full name",
				recipientPhone:"please enter phone",
				shippingAddress:"please enter address"
			},
		});
		
	
	</script>
	
</body>

</html>