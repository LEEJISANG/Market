<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../include/header.jsp" />
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" href="resources/css/member.css"/>
<style>
	#email_input{
		display: none;
	}
</style>
<script>
	$(document).ready(function(){
		fn_switch(); //이메일 직접입력
		fn_activator(); //정규화 확인
	});
	function fn_activator(){
		$('#m_email2').on('blur',function(){
			fn_normalization();
		})
		$('#m_pw').on('keyup', function(){
			fn_normalization();
		})
		$('#m_pw2').on('keyup', function(){
			fn_pwChk();
		})
	
	}
	function fn_normalization(){
			var m_email1 = $('#m_email1').val();
			var email_select = $('#email_select').val();
			var email_input = $('#email_input').val();
			var m_email2 = '';
			if(email_select != 'manual'){
				m_email2 = email_select;
			}else{
				m_email2 = email_input;
			}
			var m_email = m_email1 + '@' + m_email2;
			var regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			if(regEmail.test(m_email)){
				$('#emailChkResult').text('사용할 수 있는 이메일입니다.').css('color', 'green');
				$('#eNor').val("2");
			}else{
				$('#emailChkResult').text('유효한 이메일 형식이 아닙니다.').css('color', 'red');
			}

			var m_pw = $('#m_pw').val();
			//숫자, 소문자 조합 8 - 12자리
			var regPw = /^(?=.*[a-z])(?=.*[0-9])[a-z0-9`~!@#$%^&*()-_=+]{8,12}$/;
			if(regPw.test(m_pw)){
				$('#pwNorResult').text('사용가능한 비밀번호 입니다.').css('color', 'green');
				$('#pwNor').val("2");
			}else{
				$('#pwNorResult').text('유효한 비밀번호 형식이 아닙니다.').css('color', 'red');
			}
			
			
	}
	function fn_emailChk(){
		var m_email1 = $('#m_email1').val();
		var email_select = $('#email_select').val();
		var email_input = $('#email_input').val();
		var m_email2 = '';
		if(email_select != 'manual'){ 	
			m_email2 = email_select; 	
		}else{	m_email2 = email_input;		}
			$.ajax({
				url: 'emailChk',
				type: 'post',
				data: 'm_email1=' + m_email1 + '&m_email2=' + m_email2,
				dataType: 'text',
				success: function(responseObj){
					if(responseObj == 1){
						alert('이미 가입된 이메일 입니다.');
					}else{
						alert('가입이 가능한 이메일 입니다.');
						$('#eChk').val("2");
					}
				},
				error: function(){
					alert('error');
				}
			});
		
	}
	function fn_pwChk(){
		var m_pw = $('#m_pw').val();
		var m_pw2 = $('#m_pw2').val();
		if(m_pw == m_pw2){
			$('#pwChkResult').text('비밀번호가 일치합니다.').css('color', 'green');
			$('#pwChk').val("2");
		}else{
			$('#pwChkResult').text('비밀번호가 일치하지 않습니다.').css('color', 'red');
		}
	}
	
	function fn_switch(){
		$('#email_select').change(function(){
			var m_email2 = $('#email_select').val();
			if(m_email2 == "manual"){
				$('#email_select').css('display', 'none');
				$('#email_input').css('display', 'inline');
			}
			});
	}
	function fn_join(f){
		var queryString = $("form[name=join-form]").serialize() ;
		var eChk = $('#eChk').val();
		var eNor = $('#eChk').val();
		var pwNor = $('#eChk').val();
		var pwChk = $('#eChk').val();
		var pwChk2 = $('#eChk').val();
		var eChk = $('#eChk').text();
		if(){ //eNor pwNor pwChk pwChk2
			
		$.ajax({
			url: 'join',
			type: 'post',
			data: queryString,
			dataType: 'application/json',
			success: function(responseObj){
				if(responseObj == 1){
					alert('회원 가입이 완료되었습니다.');
				}
			},
			error: function(){
				alert('error');
			}
		});
		}
		
	}
	
 </script>
 <form method="post" name="join-form">
<div class="member-mainbox">
	<div class="member-subbox">
		<span>회원가입</span>
			<div id="join-box">
				<div class="desc">
					이메일
				</div>
				<div class="data">
					<span>
					<input class="req" type="text" name="m_email1" id="m_email1" />@
					</span>
					<span id="email2">
						<select class="req" name="m_email2" id="email_select">
							<option value="gmail.com">gmail.com</option>
							<option value="naver.com">naver.com</option>
							<option value="nate.com">nate.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="kakao.com">kakao.com</option>
							<option value="manual">직접입력</option>
						</select>
						<input type="text" placeholder="직접입력" name="m_email2" id="email_input"/>
					</span>
					<input type="button" id="id_chk" onclick="fn_emailChk()" value="중복확인"/><br/>
					<span id="emailChkResult"></span>
				</div>
				<div class="desc">
					비밀번호
				</div>
				<div id="pw-desc">
					영소문자/숫자 조합, 8자~12자리
				</div>
				<div class="data">
					<input class="req" type="password" name="m_pw" id="m_pw" /><br/>
					<span id="pwNorResult"></span>
				</div>
				<div class="desc">
					비밀번호 확인
				</div>
				<div class="data">
					<input class="req" type="password" id="m_pw2" /><br/>
					<span id="pwChkResult"></span>
				</div>
				
				<div class="desc">
					이름
				</div>
				<div class="data">	
					<input class="req" type="text" name="m_name" id="m_name"/>
				</div>
				<div class="desc">
					별명
				</div>
				<div class="data">	
					<input class="req" type="text" name="m_nickname" id="m_nickname"/>
				</div>
				<div class="desc">
					연락처
				</div>
				<div class="data">	
					<select class="req" name="m_phone1" id="m_phone1">
						<option value="010" checked>010</option>
						<option value="02">02</option>
						<option value="031">031</option>
						<option value="032">032</option>
						<option value="033">033</option>
						<option value="041">041</option>
						<option value="042">042</option>
						<option value="043">043</option>
						<option value="044">044</option>
						<option value="051">051</option>
						<option value="052">052</option>
						<option value="053">053</option>
						<option value="054">054</option>
						<option value="055">055</option>
						<option value="061">061</option>
						<option value="062">062</option>
						<option value="063">063</option>
						<option value="064">064</option>
						<option value="0502">0502</option>
						<option value="0503">0503</option>
						<option value="0504">0504</option>
						<option value="0505">0505</option>
						<option value="0506">0506</option>
						<option value="0507">0507</option>
						<option value="070">070</option>
					</select>
					-<input class="req" type="text" name="m_phone2" id="m_phone2" size="4"/>
					-<input class="req" type="text" name="m_phone3" id="m_phone3" size="4"/>
				</div>
			<div class="mem-btn-box"> 
				<input type="hidden" id="eChk" value="1"/>
				<input type="hidden" id="eNor" value="1"/>
				<input type="hidden" id="pwNor" value="1"/>
				<input type="hidden" id="pwChk" value="1"/>
				<input type="hidden" id="pwChk2" value="1"/>
				<input type="button" id="join" onclick="fn_join(this.form)" value="가입하기"/>
			</div>

		</div> <!-- join box -->
 	</div> <!-- member-subbox -->
 </div> <!-- member-main-box -->
 </form>

<jsp:include page="../include/footer.jsp"/>