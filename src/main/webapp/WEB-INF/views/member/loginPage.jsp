<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<style>
	#login-box{
		display: flex;
	}
</style>
<script>
	$(document).ready(function(){
		fn_login();
	});
	function fn_login(){
		$('#login_btn').on('click', function(){
			login();
		})
		$('#m_pw').keypress(function(event){
			if(event.which == 13){
			login();
			}
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
			url: 'login',
			type: 'post',
			data: JSON.stringify(sendByIdPw),
			contentType: 'application/json',
			dataType: 'json',
			success: function(responseObj){
				if(responseObj.loginResult == 1){
					alert('성공');
					location.href="index";
				}else{
					alert('실패');
				}
			},
			error: function(){
				alert('error');
			}
		});
	}
</script>
	<div id="login-box">
		<div id="login-info-box">
			<input type="text" name="m_id" id="m_id" placeholder="아이디"/><br/>
			<input type="password" name="m_pw" id="m_pw" placeholder="비밀번호"/>
		</div>
		<div id="login-btn-box">
			<button id="login_btn">로그인</button>
		</div>
	</div>
