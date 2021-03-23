<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="../include/header.jsp" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
</head>
<body>
	<form action="write" method="post" enctype="multipart/form-data">
		<table border="1">
			<tbody>
				<tr>
					<td>멤버번호(숫자로쓰세요)</td>
					<td><input type="text" name="bd_m_no" /></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="bd_title" /></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea rows="10" cols="25" name="bd_content"></textarea></td>
				</tr>
				<tr>
					<td>첨부</td>
					<td><input type="file" name="files" multiple /></td>
				</tr>
				<tr>
					<td colspan="2">
						<button>등록</button> <input type="button" value="목록"
						onclick="location.href ='boardList.do'" />
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>
<jsp:include page="../include/footer.jsp" />