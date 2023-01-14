<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date"%>
 
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Languages</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
   <div class="row justify-content-center">
		<div class="col-lg-6">
   			<h1>Languages</h1>
   			<table class=" border border-4 border-warning table table responsive table-striped table-bordered table-hover.active p-5">
   				<thead class="container-fluid">
   					<tr >
   						<th class="col-lg-3">Name</th>
   						<th class="col-lg-3">Creator</th>
   						<th class="col-lg-3">Version</th>
   						<th class="col-lg-3">Actions</th>
   					</tr>
   				</thead>
   				<tbody>
   				<c:forEach var="language" items="${allLangs}">
   				<tr>
   					<td>
   						<a href="/language/show/${language.id}"><c:out value="${language.name}"></c:out></a>
   					</td>
   					<td><c:out value="${language.creator}"></c:out></td>
   					<td><c:out value="${language.version}"></c:out></td>
   			
   					<td><a href="/language/edit/${language.id}"><button>Edit Me</button></a></td>
   					<td><form action="/language/${language.id}" method="post">
    						<input type="hidden" name="_method" value="delete">
    						<input type="submit" value="Delete">
						</form>
					</td> 
   				</tr>
   				</c:forEach>
   				</tbody>
   			</table>
   		</div>
  </div>
   <form:form class="col-lg-6 offset-lg-3" action="/language/create" method="post" modelAttribute="language">
   		<h3>Add a Language:</h3>
   		<div class="form-group row align-items-center">
   			<form:label path="name">Name: </form:label>
   			<form:input class="form-control" path="name" placeholder="enter here"></form:input>
   			<form:errors path="name"></form:errors>
   		</div>
   		<div class="form-group row align-items-center">
   			<form:label path="creator">Creator: </form:label>
   			<form:input class="form-control" path="creator" placeholder="enter here"></form:input>
   			<form:errors path="creator"></form:errors>
   		</div>
   		<div class="form-group row align-items-center">
   			<form:label path="version">Version: </form:label>
   			<form:input class="form-control" path="version" ></form:input>
   			<form:errors path="version"></form:errors>
   		</div>
   		<div class="btn btn-primary">
   			<button>Submit</button>
   		</div>
   </form:form>
</body>
</html>
