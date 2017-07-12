<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/include.jsp"%>
<html>
<head>
<title>BOARD</title>
<link href="<c:url value="/resources/custom/css/custom.css" />"
	rel="stylesheet">
</head>
<body>
	<div class="container header">
		<h1 class="home btn"><a href="<c:url value='/'/>" class="home btn">BOARD</a></h1>
		<c:if test="${sessionScope.ID != null}">
			<h5 class="home welcome">${sessionScope.NAME}(${sessionScope.ID})님환영합니다.</h5>
		</c:if>
		<div class="container-fluid">
			<div class="row">
				<c:choose>
					<c:when test="${sessionScope.ID == null}">
						<a href="<c:url value='/login.do'/>" id="LOGIN"
							class="btn btn-primary">LogIn</a>
						<a href="<c:url value='/signup.do'/>" id="SIGNUP"
							class="btn btn-danger">SingUp</a>
					</c:when>
					<c:otherwise> ${sessionScope.NAME}님이 로그인중입니다.
						<a href="<c:url value='/logout.do'/>" id="LOGOUT"
							class="btn btn-primary">LogOut</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<hr />
	</div>
</body>
</html>