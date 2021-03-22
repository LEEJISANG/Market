<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정페이지</title>
</head>
<script type="text/javascript">
 	function fn_update(f){
 		alert('수정 완료');
 		f.action= "boardUpdate";
 		f.submit();
 	}
 	function fn_delete(f){
 		allert('삭제 완료');
 		f.action="boardDelete";
 		f.submit();
 	}
</script>
<body>
	<form method="post">
		<table border="1">
			<tbody>
				<tr>
					<td>글번호</td>
					<td><input type="text" name="bd_no" value="${boardDto.bd_no}" readonly /></td>
				</tr>	
				<tr>
					<td>제목</td>
					<td><input type="text" name="bd_title" value="${boardDto.bd_title}"/></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea rows="10" cols="30" name="bd_content">${boardDto.bd_content}</textarea></td>
				</tr>
				<tr>
					<td colspan="2">
					<input type="button" value="수정" onclick="fn_update(this.form)"/>
					<input type="button" value="목록으로" onclick="location.href='boardList'"/>
					<input type="button" value="삭제하기" onclick="fn_delete(this.form)"/>
				</tr>
			</tbody>		
		</table>
	</form>
</body>
</html>