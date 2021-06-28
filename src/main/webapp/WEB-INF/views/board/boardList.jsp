<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../include/header.jsp" />
<!DOCTYPE html>
<style>
	table {
	margin-top: 200px;
	border: 1px solid black !important;
	width: 100%;
	z-index:auto;
	}
	td > a{
	color: red;
	}
	table >tbody > tr > td {
		border: 2px solid black !important;
		padding:10px;
		text-align: center;
	}
	table >thead > tr > td {
		border: 2px solid black !important;
		padding:10px;
		text-align: center;
	}
	table >tfoot > tr> td>input[type=button] {
		border-radius: 5px !important;
	background-color: black !important;
	color: white !important;
	width: 8em !important;
	padding: 6px !important;
	}
	table >tfoot >tr>td>input[type=button]:hover{
	background-color: white !important;
	color: black !important;
	transition-property: background-color, color !important;
	transition-duration: 0.6s !important;
	}
</style>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

총 게시글 : ${totalBoard}개
	<br />
	<table border="1">
		<thead>
			<tr>
				<td>글번호</td>
				<td>멤버번호</td>
				<td>이미지</td>
				<td>제목</td>
				<td>작성일</td>
				<td>조회수</td>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty list}">
				<tr>
					<td colspan="5">게시물이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty list}">
				<c:forEach var="boardDto" items="${list}">
					<tr>
						<td>${boardDto.bd_no}</td>
						<%-- <td>${boardDto.bd_img}</td> --%>
						<td>${boardDto.bd_m_no}</td>
						<td>
							<img alt="${boardDto.filename}" src="resources/storage/${boardDto.filename}" width="300">
						</td>
						<td><a href="BoardView?bd_no=${boardDto.bd_no}">${boardDto.bd_title}</a></td>
						<td>${boardDto.bd_regDate}</td>
						<td>${boardDto.bd_hit}</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5"><input type="button" value="새글작성"
					onclick="location.href='boardWrite'" /></td>
			</tr>
		</tfoot>
	</table>

</body>
</html>
<jsp:include page="../include/footer.jsp" />