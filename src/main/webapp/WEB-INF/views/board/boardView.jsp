<%@page import="java.net.URLDecoder"%>
<%@page import="com.march.seventeen.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="../include/header.jsp" />
<style>
table {
	margin-top: 200px;
	border: 1px solid black;
	width: 100%;
	z-index: auto;
}

td>a {
	color: red;
}

table>tbody>tr>td {
	border: 2px solid black;
	padding: 10px;
	text-align: center;
}

table>thead>tr>td {
	border: 2px solid black;
	padding: 10px;
	text-align: center;
}

table>tfoot>tr>td>input[type=button] {
	border-radius: 5px;
	background-color: black;
	color: white;
	width: 8em;
	padding: 6px;
}

table>tfoot>tr>td>input[type=button]:hover {
	background-color: white;
	color: black;
	transition-property: background-color, color;
	transition-duration: 0.6s;
}
</style>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정페이지</title>
</head>
<%
		BoardDto boardDto = (BoardDto)request.getAttribute("boardDto");
		String filename = URLDecoder.decode(boardDto.getFilename(), "utf-8");
		pageContext.setAttribute("filename", filename);
	%>

<script type="text/javascript">
	function fn_update(f) {
		alert('수정 완료');
		f.action = "BoardUpdate";
		f.submit();
	}
	function fn_delete(f) {
		alert('삭제 완료');
		f.action = "BoardDelete";
		f.submit();
	}
</script>
<body>

	<form method="post">
		<table border="1">
			<tbody>
				<tr>
					<td>글번호</td>
					<td><input type="text" name="bd_no" value="${boardDto.bd_no}"
						readonly /></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="bd_title"
						value="${boardDto.bd_title}" readonly/></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea rows="10" cols="30" name="bd_content" readonly>${boardDto.bd_content}</textarea></td>
				</tr>
				<tr>
					<td>첨부이미지</td>
					<td><a href="download.do?filename=${boardDto.filename}">첨부파일 다운로드</a></td>
				</tr>
				<tr>
				<td colspan="2"><br/><br/>
		<img alt="${boardDto.filename}" src="resources/storage/${filename}" width="300"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="수정"
						onclick="fn_update(this.form)" /> <input type="button"
						value="목록으로" onclick="location.href='boardList'" /> <input
						type="button" value="삭제하기" onclick="fn_delete(this.form)" />
				</tr>

				<%-- hidden --%>
			</tbody>
		</table>
				<input type="hidden" name="bd_no" value="${boardDto.bd_no}" />
				<input type="hidden" name="filename" value="${boardDto.filename}" />
	</form>
</body>
</html>
<jsp:include page="../include/footer.jsp" />