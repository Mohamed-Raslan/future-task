<%@page import="com.app.product.fullproduct.entities.ProductEntity"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

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
	<div class="container">


<div class="p-3 mb-2 bg-success text-white">  سبحان الخالق الذي رزقنا بأنواع متعدده من الخضروات لا تعد ولا تحصي عنيه بالفيتامينات والالياف المعدنيه الضروريه لنو الجسم والحفاظ علي صحته وهذه قائمه منها</div>


			<!--	<ul class="list-group list-group-horizontal-sm">
					<li class="list-group-item">Total Pages</li>
					<li class="list-group-item">${totalNumber}</li>
				</ul>
				<ul class="list-group list-group-horizontal-sm">
					<li class="list-group-item">Page Number</li>
					<li class="list-group-item">${pageNo}</li>
				</ul> -->

		<nav aria-label="Page navigation example">
			<ul class="pagination">



				<c:set var="PN" value="${pageNo}" />
				<c:choose>
					<c:when test="${PN > 0}">
					<li class="page-item"><a class="page-link" href="/product?pageNo=${pageNo-1}"
					                                  >Previous</a></li>
					</c:when>
				</c:choose>

				<li class="page-item"><a class="page-link" href="/product?pageNo=${1}">1</a></li>
				<li class="page-item"><a class="page-link" href="/product?pageNo=${2}">2</a></li>
				<li class="page-item"><a class="page-link" href="/product?pageNo=${3}">3</a></li>
				<li class="page-item"><a class="page-link"
					href="/product?pageNo=${pageNo+1}">Next</a></li>

			</ul>
		</nav>



		<!-- <nav aria-label="...">

			<ul class="pagination pagination-lg">

				<c:forEach begin="1" end="${totalNumber}" var="page">
					<li class="page-item"><a class="page-link"
						href="/product?pageNo=${page}">${page}</a></li>
				</c:forEach>				
				 
			</ul>
			
		</nav>  -->
		

		<br>
		<table class="table">
			<thead>
				<tr>

					<th scope="col">Name</th>
					<th scope="col">Description</th>
					<th scope="col">Details</th>
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

		<a href="/product/pageofadding" class="btn btn-secondary btn-sm">
			Add New Product</a>

		
	

	</div>
	<br><br>

</body>
</html>