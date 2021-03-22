<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="write" method="post">
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