<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../include/header.jsp" />
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" href="resources/css/member.css"/>
<style>
	#login-box{
		display: flex;
	}
</style>
<script>
	$(document).ready(function(){
		fn_login();
		fn_join();
		fn_find();
	});
	function fn_join(){
		$('#join_btn').on('click', function(){
			location.href="joinPage";
		});
	}
	function fn_find(){
		$('#find_btn').on('click', function(){
			location.href="findPage";
		});
	}
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
					alert('아이디/비밀번호가 일치하지 않습니다.');
					history.back();
				}
			},
			error: function(){
				alert('error');
			}
		});
	}
</script>
	<div class="member-mainbox login">
		<div id="login-box">
			<div id="login-info-box">
				<input type="text" name="m_id" id="m_id" placeholder="아이디"/><br/>
				<input type="password" name="m_pw" id="m_pw" placeholder="비밀번호"/>
			</div>
			<div id="login-btn-box">
				<button id="login_btn">로그인</button>
			</div>
		</div>
		<div id="singin-box">
			<div>
				<button id="find_btn">아이디/비밀번호 찾기</button>
				<button id="join_btn">회원가입</button>
			</div>
		</div>
	</div>
<jsp:include page="../include/footer.jsp"/>