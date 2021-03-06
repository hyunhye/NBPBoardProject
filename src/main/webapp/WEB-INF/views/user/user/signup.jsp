<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<sec:csrfMetaTags/>
</head>
<body>
	<!-- header -->
	<%@include file="../../common/header.jsp"%>
	
	<div class="container">
		<div class="container-fluid">
			<form:form name="form" action="insert" method="post" class="form-horizontal">
				<div class="form-group">
					<label for="userId" class="col-sm-2 control-label"><b>ID</b></label> 
					<div class="col-sm-10">
						<input type="text"  placeholder="아이디를 입력하세요"  name="userId" class="userId form-control" oninput="idDuplicationCheck()" id="userId"> <br /> 
					</div>
				</div>
				<div class="form-group">
					<label for="userName" class="col-sm-2 control-label"><b>Name</b></label> 
					<div class="col-sm-10">
						<input type="text"  placeholder="이름을 입력하세요"  name="userName" id="userName" class="form-control"> <br /> 
					</div>
				</div>
				<div class="form-group">
					<label for="userPassword" class="col-sm-2 control-label"><b>Password</b></label> 
					<div class="col-sm-10">
						<input type="password"  placeholder="비밀번호"  name="userPassword" class="userPassword form-control" id="newUserPassword" oninput="rePasswordCheck()"> <br /> 
					</div>
				</div>
				<div class="form-group">
					<label for="reUserPassword" class="col-sm-2 control-label"> <b>Repeat Password</b></label> 
					<div class="col-sm-10">
						<input type="password"  placeholder="비밀번호 확인"  name="reUserPassword" class="reUserPassword form-control" id="newReUserPassword" oninput="rePasswordCheck()">
					</div>
					<br /> 
				</div>
				<div class="clearfix">
					<div class="form-group">
   						 <div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default" id="user-button" disabled="disabled">SignUp</button>
						</div>
					</div>
				</div>
			</form:form>
		</div>
	</div>
	
	<!-- footer -->
	<%@include file="../../common/footer.jsp"%>
</body>
</html>

<script src="<c:url value="/resources/common/js/user.js" />"></script>