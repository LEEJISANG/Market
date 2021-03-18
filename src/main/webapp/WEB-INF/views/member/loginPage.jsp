<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
	$(function(){
		fn_login();
	});
	function fn_login(){
		$('#login_btn').on('click', function(){
			login();
		})
		$('#m_pw').keypress(function(event){
			if(event.which == 13)
			login();
		});
	}
	function login(){
		var m_id = $('#m_id').val();
		var m_pw = $('#m_pw').val();
		var sendByIdPw = {
			"m_id" : m_id,
			"m_pw" : m_pw
		}
		$.ajax({
			url: 'login.do',
			type: 'post',
			data: JSON.stringfy(sendByIdPw),
			contentType: 'application/json',
			dataType: 'json',
			success: function(responseObj){
				if(responseObj.loginResult == 1){
					
				}
			}
		});
	}
</script>
<body>
	<div>
		<table>
			<tbody>
				<tr>
					<td>
						<input type="text" name="m_id" id="m_id" placeholder="아이디"/>
					</td>
					<td rowspan="2">
						<button id="login_btn">로그인</button>
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="m_pw" id="m_pw" placeholder="비밀번호"/>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>