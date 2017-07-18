<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/include.jsp"%>
<html>
<head>
<script>
	$(document).ready(
		function(){
			$('#searchButton').on("click", function(event){
				self.location = "list"
					+ '${pageMaker.makeQuery(1)}'
					+ "&categoryType="
					+ $("#categoryType option:selected").val()
					+ "&searchType="
					+ $("#searchType option:selected").val()
					+ "&keyword="+encodeURIComponent($('#keyword').val());
				
			});	
		
		});/* 
	function list(page) {
		location.href = "${path}/board/list?curPage=" + page
				+ "&categoryType=${map.categoryOption}"
				+ "&searchOption=${map.searchOption}"
				+ "&keyword=${map.keyword}";
	} */
</script>
</head>
<body>
	<!-- header start -->
	<%@include file="../common/header.jsp"%>
	<!-- header end -->
	<div class="container">
		<div class="container-fluid">
			<div class="row">
				<%@include file="../common/search.jsp"%>
				<c:if test="${sessionScope.userId != null}">
					<a href="<c:url value='/board/question'/>" id="question"
						class="btn btn-danger">Ask Question</a>
				</c:if>

			</div>
		</div>
		<div class="container-fluid">
			<div class="col-md-12">
				<c:forEach var="board" items="${list}">
					<h1>
						<a href="${path}/board/answer${pageMaker.makeSearch(pageMaker.cri.page)}&boardId=${board.boardId}"
							id="boardId">${board.title}</a>
					</h1>
					<p>${board.content}</p>
					<div>
						<span class="badge">Posted ${board.date}</span>
						<span class="badge">Posted By ${board.name}</span>
						<div class="pull-right">
							<span class="label label-primary">조회수: ${board.viewCount}</span>
							<span class="label label-warning">${board.item}</span>
						</div>
					</div>
					<hr>
				</c:forEach>
			</div>

			<div class="page-nation">
				<ul class="pagination pagination-large">
					<c:if test="${pageMaker.prev}">
						<li class="disabled"><span><a href="/board/list${pageMaker.makeSearch(pageMaker.startPage-1)}">&laquo;</a></span></li>
					</c:if>

					<c:forEach var="idx" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<li 
							<c:out value="${pageMaker.cri.page == idx? 'class=active' : '' }" />>
							<a href="/board/list${pageMaker.makeSearch(idx)}"><span>${idx}</span></a>
						</li>
					</c:forEach>
					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li class="disabled"><span><a href="/board/list${pageMaker.makeSearch(pageMaker.endPage + 1)}">&raquo;</a></span></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>
