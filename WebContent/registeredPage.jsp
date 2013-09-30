<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registered</title>
<link rel="stylesheet" type="text/css" href="css/demo.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/animate-custom.css" />
<link rel="stylesheet" type="text/css" href="css/preference.css">
</head>

<body>

	<div class="container">
		<div class="codrops-top">
			<a href="index.html"> <strong>&laquo; Back Home </strong></a>
			<div class="clr"></div>
		</div>
 
<header> 
		<h1 style="font-size: 60px;">&lt;Corsola&gt;</h1>
		<h2>
			<span>Scheduling your life.</span>
		</h2>
		
</header>

<p>
<c:set var="name" value="${requestScope.name}" />
<c:set var="loginUname" value="${requestScope.loginUname}"/>
<c:set var="error" value="You have failed to enter a Username or Password" />
<c:if test="${not empty loginUname}">
Welcome back to Corsola, <c:out value="${loginUname}"/>.</c:if>

<c:if test="${not empty name}">
Welcome <c:out value="${name}"/>, you've successfully registered with Corsola. </c:if>

</p>

<p>
<br/>
<a href="/Corsola/PreferredCourses" style="border-style: solid; border-width: 1px; 
margin: 5px; padding: 5px; background:white;"> Begin Scheduling </a>
<br/>
</p>

<p>
<br/>
<a href="/Corsola/courseHistory.jsp" style="border-style: solid; border-width: 1px; 
margin: 5px; padding: 5px;  background:white;"> View Course History </a>
</p>

<br/> 
<p style="border-style: solid; border-width:1px; background:white;" >
Account Details  <br/>
<c:if test="${not empty name}"> 
Username: <c:out value="${requestScope.name}"/> <br/>
Email: <c:out value="${requestScope.mail}"/> <br/>
Password: <c:out value="${requestScope.pass}"/> <br/> </c:if>

<c:if test="${not empty loginUname}">
Username/Email: <c:out value="${requestScope.loginUname}"/> <br/>
<!--Email: <c:out value="${requestScope.loginUmail}"/> <br/>  -->
Password: <c:out value="${requestScope.loginUpass}"/> <br/> </c:if>

<c:if test="${empty loginUname}">
<c:out value="${error}" />
</c:if>

<c:if test="${empty name}">
<c:out value="${error}" />
</c:if>


</p>

</body>
</html>