<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<script src="./libs/jquery/1.10.1/jquery.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout - online book store</title>
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

		<c:set var="cart" value="${sessionScope['cart']}"></c:set>

		<c:if test="${cart.totalItems ==0}">
			<h2>there is no item in your car</h2>
		</c:if>

		<c:if test="${cart.totalItems > 0}">

			<h2>
				Review your order details <a href="view_cart"></a>Edit
			</h2>
			<div>
				<table>
					<tr>
						<th>No</th>
						<th colspan="2">Book</th>
						<th>Author</th>
						<th>Price</th>
						<th>Quantity</th>
						<th>Subtotal</th>
						<th></th>
					</tr>
					<c:forEach items="${cart.items }" var="item" varStatus="status">
						<tr>
							<td>${status.index+1}</td>
							<td><img src="data:image/jpg;base64,${item.key.base64Image}" />
							</td>
							<td><span id="book-title"> ${item.key.title}</span></td>
							<td>${item.key.author}</td>
							<td><fmt:formatNumber value=" ${item.key.price}"
									type="currency" /></td>
							<td>
							<td><input type="text" name="quantity ${status.index+1}"
								value=" ${item.value}" size="5" readonly="readonly" /></td>
							<td><fmt:formatNumber
									value=" ${item.value * item.key.price}" type="currency" /></td>

						</tr>

					</c:forEach>
					<tr>
						<td></td>
						<td></td>
						<td>${cart.totalQuantity}book(s)</td>
						<td>Total:</td>
						<td span="2"><fmt:formatNumber value=" ${cart.totalAmount}"
								type="currency" /></td>
					</tr>
				</table>
				<h2>Your shipping information</h2>
				<form id=" orderForm" action="place_order" method="post">
					<table>
						<tr>
							<td>Recipient Name:</td>
							<td><input type="text" name="recipientName"
								value="${loggedCustomer.fullname}" /></td>
						</tr>
						<tr>
							<td>Recipient Phone:</td>
							<td><input type="text" name="recipientPhone"
								value="${loggedCustomer.phone}" /></td>
						</tr>
						<tr>
							<td>Street Address:</td>
							<td><input type="text" name="address"
								value="${loggedCustomer.address}" /></td>
						</tr>
						<tr>
							<td>City:</td>
							<td><input type="text" name="city"
								value="${loggedCustomer.city}" /></td>
						</tr>
						<tr>
							<td>Zip Code:</td>
							<td><input type="text" name="zipCode"
								value="${loggedCustomer.zipCode}" /></td>
						</tr>
						<tr>
							<td>Country:</td>
							<td><input type="text" name="country"
								value="${loggedCustomer.country}" /></td>
						</tr>
					</table>
					<div>
						<h2>payment</h2>
						Choose your payment method <select name="paymentMethod">
							<option value="cash on delivery">Cash on delivery</option>

						</select>
					</div>
					<div>
						<table>
							<tr>
								<td><button type="submit">Place order</button></td>
								<td><a href="${pageContext.request.contextPath}/">Continue
										Shopping</a></td>
							</tr>
						</table>
					</div>
				</form>
			</div>
		</c:if>

	</div>
	<jsp:include page="footer.jsp" />
	<script type="text/javascript">
		$(document).ready(function(){
			
			$("#orderForm").validate({
				rules : {
					recipientName:"required",
					recipientPhone:"required",
					address:"required",
					city:"required",
					zipCode:"required",
					country:"required"
				},
				messages : {
					
					recipientName:"please enter recipient name",
					recipientPhone:"please enter recipient phone",
					address: "please enter Street address",
					city:"please enter city",
					zipCode: "please enter zip code",
					country: "please enter country"
				}
			});

		});
	</script>

</body>
</html>