<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/include.jsp"%>
<html>
<head>
<title>BOARD</title>
<script>
	$(document).ready(function() {
		$('.summernote').summernote({
			height : 300
		});
	});
</script>
</head>
<body>
	<!-- header start -->
	<%@include file="header.jsp"%>
	<!-- header end -->
	<div class="container">
		<div class="container-fluid">
			<form action="question/modify" method="post">
				Title <input type="text" name="TITLE" value="${dto.TITLE}" /> <br />
				<textarea class="summernote" cols="100" rows="30" name="CONTENT">${dto.CONTENT}</textarea>

				<input type="hidden" name="BID" value="${dto.BID}"> <br />
				<input type="submit" />
			</form>
		</div>
	</div>
</body>
</html>
