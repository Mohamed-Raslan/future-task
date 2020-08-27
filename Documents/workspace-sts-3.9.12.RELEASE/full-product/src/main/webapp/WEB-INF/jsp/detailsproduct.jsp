<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="windows-1256">
<title>Home Page</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>


	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<%@include file="navbar.jsp"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<br>
	<br>

	<div class="container">

		<h2>Product Details</h2>

		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Name</th>
					<th scope="col">Description</th>
					<th scope="col">Edit</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="element" items="${myproduct}">

					<tr>
						<td>${element.id}</td>
						<td>${element.name}</td>
						<td>${element.description}</td>
						<td scope="col"><a href="/product/editpage/${element.id}">edit</a></td>
					</tr>
				</c:forEach>


			</tbody>
		</table>


	</div>



</body>
</html>