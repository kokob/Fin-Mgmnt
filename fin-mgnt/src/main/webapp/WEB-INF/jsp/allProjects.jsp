<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All projects</title>
<link href="assets/css/bootstrap.css" rel="stylesheet">
<link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
</head>
<body>

	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<div class="navbar-header">
					<a class="brand" href="/"> Home Page</a> 
					<a class="btn btn-primary offset8" href="/addProject"> Add Project </a>
					<ul class="nav">
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="col-md-12 text-center hero-unit">
		
		<h1>All Projects</h1>
		
		<br />
		<br />
		
			<table class="table table-striped table-hover">
				<tr>
					<th>Project Code</th>
					<th>Project Name</th>
				</tr>

				<c:forEach items="${projects}" var="project">
					<tr>
						<td>${project.projectCode}</td>
						<td>${project.projectName}</td>

						<td><a class="btn btn-info" href="getProjectById/${project.id}"> View </a> 
							<a class="btn btn-danger btn-lg" href="deleteProjectById/${project.id}"> Delete </a>
							
						</td>

					</tr>

				</c:forEach>

			</table>
		</div>

	</div>

</body>
</html>