<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<script src="./libs/jquery/1.10.1/jquery.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Login</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div align="center">
		<h1>Shopping Cart</h1>

		<c:if test="${Message != null}">
			<div align="center">
				<h4>${Message}</h4>
			</div>
		</c:if>

		<c:set  var="cart" value="${sessionScope['cart']}"></c:set>

		<c:if test="${cart.totalItems ==0}">
			<h2>there is no item in your car</h2>
		</c:if>

		<c:if test="${cart.totalItems > 0}">
		
				<form action ="update_cart" method="post" id="cartForm">
				<div>
					<table>
						<tr>
							<th>No</th>
							<th colspan="2">Book</th>
							<th>Quantity</th>
							<th>Price</th>
							<th>Subtotal</th>
							<th></th>
						</tr>
						<c:forEach items="${cart.items }" var="item" varStatus="status">
							<tr>
								<td>${status.index+1}</td>
								<td><img src="data:image/jpg;base64,${item.key.base64Image}"/>
								</td>
								<td>
								${item.key.title}</td>
								<td>
								<input type = "hidden" name="bookId" value=" ${item.key.bookId}"size="5"/>
								<input type = "text" name="quantity ${status.index+1}" value=" ${item.value}"size="5"/>
								</td>
								<td><fmt:formatNumber value=" ${item.key.price}"
										type="currency" /></td>
								<td><fmt:formatNumber
										value=" ${item.value * item.key.price}" type="currency" /></td>
								<td><a href="remove_form_cart?book_id=${item.key.bookId}">Remove </a></td>
							</tr>

						</c:forEach>
						<tr>
							<td></td>
							<td></td>
							<td>${cart.totalQuantity}book(s)</td>
							<td>Total:</td>
							<td span="2"><fmt:formatNumber
										value=" ${cart.totalAmount}" type="currency" /></td>
						</tr>
					</table>
					</div>
				</form>
				<div>
				<table>
				<tr>
				<td><button type="submit" >Update</button></td>
				<td><input type="button" id="clearCart" value="clear_cart"/></td>
				<td><a href="${pageContext.request.contextPath}/">Continue Shopping</a></td>
				<td><a href="checkout">Checkout</a></td>
				</tr>
				</table>
			</div>
		</c:if>

	</div>
	<jsp:include page="footer.jsp" />
	<script type="text/javascript">
		$(document).ready(function(){
			$("#clearCart").click(function()){
				window.location = 'clear_cart';
			});
			
			$("#cartForm").validate({
				rules : {
					<c:forEach items="${cart.items }" var="item" varStatus="status">
					quantity ${status.index+1}:{required:true, number: true, min: 1}
					</c:forEach>
				},
				messages : {
					<c:forEach items="${cart.items }" var="item" varStatus="status">
					quantity${status.index+1}:{required: "please enter quantity", number: "quantity must be a number",
						min:"quantitiy must be grater than 0"},
					</c:forEach>
				}
			});

		});
	</script>

</body>
</html>