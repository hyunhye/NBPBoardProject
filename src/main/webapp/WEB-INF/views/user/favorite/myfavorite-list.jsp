<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/include/include.jsp"%>
<html>
<head>
<style type="text/css">
	#content{ 
		display: -webkit-box; 
		display: -ms-flexbox; 
		display: box; 
		margin-top:1px; 
		max-height:80px; 
		overflow:hidden; 
		vertical-align:top; 
		text-overflow: ellipsis; 
		word-break:break-all; 
		-webkit-box-orient:vertical; 
		-webkit-line-clamp:3

	}
</style>
</head>
<body>
	<!-- header -->
	<%@include file="../../common/header.jsp"%>
	
	<div class="container">
		<div class="container-fluid">
			<div class="row">
				<b>My Favorite</b>
			</div>
		</div>
		<div class="container-fluid">
			<div class="col-md-12">
				<c:forEach var="board" items="${list}">
					<h4>
						<a href="${path}/board/myfavorite/memo${pageMaker.makeQuery(pageMaker.cri.page)}&boardNo=${board.boardNo}" id="boardNo">${board.boardTitle}</a>
					</h4>
					<div>
						<span class="badge">Posted By ${board.userName}</span>
						<span class="badge" style="background-color:#ffffff; color:#8c8c8c">Posted <fmt:formatDate value="${board.boardDate}" pattern="yyyy/MM/dd"/></span>
						<div class="pull-right">
							<span class="label label-success">answer: ${board.commentCount}</span>
							<span class="label label-primary">views: ${board.boardViewCount}</span>
							<span class="label label-warning">${board.categoryItem}</span>
						</div>
					</div>
					<hr>
				</c:forEach>
			</div>

			<div class="page-nation">
				<ul class="pagination pagination-large">
					<c:if test="${pageMaker.prev}">
						<li class="disabled"><span><a href="/board/myfavorite${pageMaker.makeQuery(pageMaker.startPage-1)}">&laquo;</a></span></li>
					</c:if>

					<c:forEach var="idx" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<li 
							<c:out value="${pageMaker.cri.page == idx? 'class=active' : '' }" />>
							<a href="/board/myfavorite${pageMaker.makeQuery(idx)}"><span>${idx}</span></a>
						</li>
					</c:forEach>
					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li class="disabled"><span><a href="/board/myfavorite${pageMaker.makeQuery(pageMaker.endPage + 1)}">&raquo;</a></span></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<%@include file="../../common/footer.jsp"%>
</body>
</html>