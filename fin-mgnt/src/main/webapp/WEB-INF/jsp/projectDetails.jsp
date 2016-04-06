<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Projects Detail</title>
<link href="../assets/css/bootstrap.css" rel="stylesheet">
<link href="../assets/css/bootstrap-responsive.css" rel="stylesheet">
</head>
<body>

	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<div class="navbar-header">
					<a class="brand" href="/homePage"> Home Page  |</a> 
					<a class="brand" href="/getAllProjects">
        				All Projects
        			</a>
					<a
						class="btn btn-primary offset7"
						href="../addContract/${project.id}"> Add Contract </a>
					<ul class="nav">
					</ul>
				</div>
			</div>
		</div>
	</div>


	<div class="container">
		<div class="col-md-12 text-center hero-unit">

			<h2><span>${project.projectName}</span>
				<a class="btn btn-primary offset5"  data-toggle="modal" data-target="#editProjectModal">
				Edit 
				</a>				
			</h2>

			<p>
				<strong>Project Code</strong> | ${project.projectCode}
			</p>
			<p>
				<strong>Vendor </strong> | ${project.projectVendor}
			</p>
			<p>
				<strong>Budget </strong> |${project.totalProjectBudget}
			</p>
		</div>
	</div>
	<hr></hr>

	<div id="editProjectModal" class="modal hide fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">${project.projectName}</h3>
		</div>
		
		<spring:url value="/updateProject/${project.id}" var="action" />
		<form:form action="${action}" method="POST" modelAttribute="project">
			<div class="modal-body">

				<div class="control-group">
					<label for="textinput1"> Project code: </label>
					<form:input path="projectCode" cssErrorClass="error" />

					<label for="textinput1"> Project Name: </label>
					<form:input path="projectName" cssErrorClass="error" />

					<label for="textinput1"> Project vendor: </label>
					<form:input path="projectVendor" cssErrorClass="error" />

					<label for="textinput1"> Project Budget: </label>
					<form:input class="numberOnly" path="totalProjectBudget" cssErrorClass="error" />

				</div>


			</div>
			<div class="modal-footer">
				<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
				<button type="submit" class="btn btn-primary">Save</button>
			</div>
		</form:form>
	</div>


	<div class="container">
		<div class="col-md-12 text-center hero-unit">
			<h3>All ${project.projectName} Contracts</h3>
			<table class="table table-striped table-hover">
				<tr>
					<th>Contract Code</th>
					<th>Contract Name</th>
					<th>Contract Description</th>
					<th>Budget Percentage</th>
				</tr>

				<c:forEach items="${project.pcontracts}" var="contract">
					<tr>
						<td>${contract.contractCode}</td>
						<td>${contract.name}</td>
						<td>${contract.description}</td>
						<td>${contract.percentageCompleted}</td>

						<td>
						<a class="btn btn-info" href="/getContractById/${contract.id}"> View </a>
						<a class="btn btn-danger" href="/deleteContractById/${contract.id}/${project.id}"> Delete </a></td>



					</tr>

				</c:forEach>

			</table>
		</div>
	</div>

	<script src="../jquery-1.11.2.js">
    </script>
    <script src="../assets/js/fin-mgnt.js">
    </script>

	<script src="../assets/js/bootstrap.js">
		
	</script>

</body>
</html>