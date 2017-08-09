<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<style>
.wrapper {
	height: 40px;
}
.welcome-wrapper {
	margin-left:20px;
	line-height: 35px;
	font-size: 0.9em;
}
.nav-wrapper {
	position:fixed;
	height:50px;
	width:100%;
	top:0;
	background-color: #fff;
	padding:10px 40px;
	z-index:100;
	box-shadow: 5px 0px 20px lightgray;
}
.nav-title {
	text-decoration: none; 
	color:#000000;
	font-size: 1.3em;
	margin: 0 15px;
	line-height: 30px;
}
</style>
<script>
function userInfo() {
	$.ajax({
		type : "GET",
		url : "/user/info",
		success : function(result) {
			$("#user-info-dialog").html(result);
		}
	});
	$("#user-info-dialog").dialog({
			autoOpen: true,
			modal: true,
			resizable:false,
			position: { my: "top", at: "bottom", of: "#user-info-button" },
			title: "회원 정보"
	});
}
</script>

<div class="nav">
	<div class="nav-wrapper">
		<div class="pull-left">		
			<a href="<c:url value='/board'/>" class="nav-title">BOARD</a>
		</div>
		<sec:authorize access="isAuthenticated()">
			<div class="pull-left wrapper-1">
				<form:form action="/user/logout" method="POST"  class="pull-left">
					<input type="submit" id="logout" class="btn btn-default btn-sm" value="LogOut">
				</form:form>
			</div>
			<div class="pull-left welcome-wrapper">
				<sec:authentication property="name"/>님 환영합니다.
				<a href='javascript:userInfo()'  class="glyphicon glyphicon-user" id="user-info-button" style="color:black"></a>
				<div id="user-info-dialog"></div>
			</div>
			<div class="pull-right">
				<a href="<c:url value='/board/myquestions'/>" id="my-qustions" class="btn btn-default btn-sm">My Questions</a>
				<a href="<c:url value='/board/myfavorite'/>" id="favorite" class="btn btn-default btn-sm">My Favorite</a>
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<a href="<c:url value='/admin/admin'/>" id="admin" class="btn btn-success btn-sm">ADMIN</a>
				</sec:authorize>
			</div>
		</sec:authorize>
		<sec:authorize access="isAnonymous()">
			<a href="<c:url value='/user/loginPage'/>" id="login" class="btn btn-default btn-sm">LogIn</a>
			<a href="<c:url value='/user/signup'/>" id="signup" class="btn btn-default btn-sm">SingUp</a>
		</sec:authorize>
	</div>
</div>