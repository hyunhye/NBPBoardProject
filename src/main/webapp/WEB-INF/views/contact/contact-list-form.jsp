<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"		uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="list-group">
	<div class="list-group-item">
		<div class="list-1"><b>제목</b></div>
		<div class="list-2"><b>작성자</b></div>
		<div class="list-3"><b>날짜</b></div>
	</div>
	<c:forEach var="contact" items="${contact}">
		<div class="list-group-item">
			<div  class="list-1">
				<c:choose>
					<c:when test="${contact.contactPassword ne null}">
						<a href="javascript:passwordIsCheck(${contact.contactNo})"><c:out value="${contact.contactTitle}" escapeXml="false"></c:out></a>
						<span class="label label-danger" id="secret-label">비밀글</span>
					</c:when>
					<c:otherwise>
						<a href="${path}/contact/view${pageMaker.makeQuery(pageMaker.cri.page)}&contactNo=${contact.contactNo}&option=0"><c:out value="${contact.contactTitle}" escapeXml="false"></c:out></a>
					</c:otherwise>
				</c:choose>
				<c:if test="${contact.contactCommentCount > 0}">
					<span class="label label-warning" id="secret-label">답변: ${contact.contactCommentCount}</span>
				</c:if>
			</div>
			<div class="list-2"> ${contact.userId} </div>
			<div class="list-3"> <fmt:formatDate value="${contact.contactDate}" pattern="yyyy/MM/dd"/></div>
		</div>
	</c:forEach>
</div>