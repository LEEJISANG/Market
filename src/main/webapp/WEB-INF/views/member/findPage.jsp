<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../template/header.jsp" />
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" href="resources/css/member.css"/>

<form name="find" method="post">
<div class="member-mainbox">
	<div class="member-subbox">
		<h3>아이디 찾기</h3>
			<div class="find id">
				이름
				<input type="text" name="m_id" id="m_id" />
				이메일
				<input type="text" name="m_email" id="m_email" />
				<span id="find-id" style="display: none;">1</span>
			</div>
		<h3>비밀번호 찾기</h3>
			<div class="find pw">
				아이디
				<input type="text" name="m_id" id="m_id" />
				이름
				<input type="password" name="m_name" id="m_name" />
				<span id="find-id" style="display: none;">2</span>
			</div>
	</div>
	<div>
		<button>찾기</button>
	</div>
</div>
</form>

<jsp:include page="../template/footer.jsp"/>