<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<sec:csrfMetaTags/>
</head>
<body>
	<!-- header -->
	<%@include file="../common/header.jsp"%>

	<div class="container">
		<div class="container-fluid" style="margin-bottom: 30px">
			<form:form action="/board/question/modify" method="post" name="form" class="modify-form form-horizontal" id="register-form" enctype="multipart/form-data">
				<div class="form-group">
					<label for="title">Title</label>
					<input type="text" name="boardTitle" id="title" value="${board.boardTitle}" maxlength="100" size="20" class="form-control"  /> 
				</div>
				<div class="form-group">
					<label for="category">Category</label>
					<category:category />
				</div>
				<textarea class="board-summernote" cols="100" rows="30" name="boardContent" maxlength="500" id="content">
					<c:out value="${board.boardContent}" escapeXml="true"/>
				</textarea>
				<div class="form-group">
					<div class="filebox"> 
						<input class="upload-name" value="파일선택" disabled="disabled" > 
						<label for="input-file">업로드</label> 
						<input type="file" name="files" multiple="multiple" class="file upload-hidden" id="input-file" onchange="fileUpload()" maxlength="5">
					</div>
						<div class="panel panel-default">
							<div class="list-group">
								<div class="list-group-item">
									<div class="list-1"><b>파일명</b></div>
									<div class="list-2"><b>크기</b></div>
									<div class="list-3"><b>삭제</b></div>
								</div>
								<c:if test="${not empty board.boardFileList}">
									<c:forEach var="attach" items="${board.boardFileList}">
										<div class="uploadedList">
											<div class="list-group-item">
												<div class="list-1">${attach.fileOriginName}</div>
												<div class="list-2"><file:size value = "${attach.fileSize}" /> </div>
												<div class="list-3"><a onclick="uploadedFileDelete('${attach.fileName}', this)" >[삭제]</a></div>
											</div>
										</div>
									</c:forEach>
								</c:if>
								<div class="newUploadedList"></div>
								<div class="summernoteUploadedList"></div>
							</div>
						</div>
				</div>
				<input type="hidden" name="boardNo" value="${board.boardNo}">
				<div class="pull-right">
					<button type="button" onclick="questionRegist()" class="btn btn-default">Modify</button>
				</div>
			</form:form>
		</div>
	</div>
	
	<!-- footer -->
	<%@include file="../common/footer.jsp"%>
</body>
</html>

<link href="<c:url value="/resources/common/css/file.css" />" rel="stylesheet">
<script src="<c:url value="/resources/common/js/file.js" />"></script>
<script src="<c:url value="/resources/common/js/board.js" />"></script>
<script>
	(function (){
		$("#category").val('${board.categoryNo}').prop("selected", true);
	}());
</script>
