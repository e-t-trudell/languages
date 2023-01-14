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
    <title>Show</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="col-lg-6 offset-lg-3 border border-4 border-info mt-5 mx-auto p-5 d-flex justify-content-between">
   		<h3>Language Details</h3>
   		<h5><a href="/">Dashboard</a></h5>
   </div>
   <div class="container col-lg-6 offset-lg-3 border border-4 border-info mt-5 mx-auto p-5 d-flex flex-column justify-content-between">
   		<p >Name: <c:out  value="${language.name}"></c:out></p>
  		<p>Creator: <c:out value="${language.creator}"></c:out></p>
  		<p>Version: <c:out value="${language.version}"></c:out></p>
   		<div class="d-flex justify-content-around">
   			<a href="/language/edit/${language.id}"><button>Edit Me</button></a>
   			<form action="/language/${language.id}" method="post">
    			<input type="hidden" name="_method" value="delete">
    			<input type="submit" value="Delete">
			</form> 
		</div>
	</div>
</body>
</html>
