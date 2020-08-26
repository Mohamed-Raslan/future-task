<%@page import="com.app.product.fullproduct.entities.ProductEntity"%>
<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
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
    <%@ page import="java.util.*" %>
	<br>
	<br>
	<div class="container">


		<nav aria-label="...">

			<ul class="pagination pagination-lg">

				<c:forEach begin="1" end="${totalNumber}" var="page">
					<li class="page-item"><a class="page-link"
						href="/product?pageNo=${page}">${page}</a></li>
				</c:forEach>


				<!--<li class="page-item"><a class="page-link"
					href="/product?pageNo=${1}">Page 1</a></li>
				<li class="page-item"><a class="page-link"
					href="/product?pageNo=${2}">Page 2</a></li>
				<li class="page-item"><a class="page-link"
					href="/product?pageNo=${3}">Page 3</a></li>
				<li class="page-item"><a class="page-link"
					href="/product?pageNo=${4}">Page 4</a></li> -->
				
				 
			</ul>
			
		</nav> 
		

		<br>
		<br>
		<table class="table">
			<thead>
				<tr>

					<th scope="col">Product Name</th>
					<th scope="col">Description</th>
					<th scope="col">Full Details</th>
					<th scope="col">Deleting</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="num" items="${products}">


					<tr>
						<td>${num.name}</td>
						<td>${num.description}</td>
						<td><a href="/product/det/${num.id}">open</a></td>
						<td><a href="/product/${num.id}">delete</a></td>
					</tr>


				</c:forEach>
			</tbody>
		</table>

		<br>
		<br>


		<a href="/product/pageofadding" class="btn btn-secondary btn-sm">
			Add New Product</a>





	</div>


</body>
</html>