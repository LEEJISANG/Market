<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>중고나라</title>

<!-- Style -->
<link rel="stylesheet" href="resources/css/marketreset.css">
<link rel="stylesheet" href="resources/css/header.css">

<!-- favicon -->
<link rel="shortcut icon" href="resources/icon/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/icon/favicon.ico" type="image/x-icon">

</head>
<script type="text/javascript">
</script>
<body>
	<!-- full-page start -->
	<div class="full-page">
		<!-- header start -->
		<div class="header-top">
			<div class="header-top-box">
				<div class="sign-btn-box">
					<a class="sign-a" href="loginPage">로그인</a>
					<a class="sign-a" href="logout">로그아웃</a>
					<a class="sign-a" href="myPage">마이페이지</a>
				</div>
			</div>
		</div>
		<div class="header-bottom">
			<div class="header-bottom-box">
				<div class="header-bottom-top-box">
					<div class="logo-box">
						<a href="index">
							<img src="resources/img/logo_black.png" width="136" height="40" alt="중고나라 로고" />
						</a>
					</div>
					<div class="search-box1">
						<div class="search-box2">
							<input type="text" placeholder="상품명, 지역명" class="search-input" />
							<a href="#">
								<img src="resources/svg/search.svg" width="16" height="16" alt="검색 버튼 아이콘">
							</a>
						</div>
					</div>
					<div class="btn-box">
						<a class="btn-a2" href="#">
							<img src="resources/svg/messenger-white.svg" width="23" height="24" alt="톡톡톡 이미지">
							톡톡톡
						</a>
						<a class="btn-a1" href="#">
							<img src="resources/svg/user-white.svg" width="23" height="24" alt="내상점 이미지">
							내상점
						</a>
						<a class="btn-a1" href="boardList">
							<img src="resources/svg/sale-white.svg" width="23" height="24" alt="판매하기 이미지">
							판매하기
						</a>
					</div>
				</div>
				<div class="header-bottom-bottom-box">
					<div class="menu-box">
						<img src="resources/img/menu.png" width="20" height="16" alt="메뉴 버튼 아이콘" />
						<div class="category-box1">
							<div class="category-box2">
								<div class="all-category">전체 카테고리</div>
								<div class="category-list">
									<a class="category" href="#">여성의류</a>
									<a class="category" href="#">패션잡화</a>
									<a class="category" href="#">남성의류</a>
									<a class="category" href="#">디지털/가전</a>
									<a class="category" href="#">도서/티켓/취미/애완</a>
									<a class="category" href="#">스타굿즈</a>
									<a class="category" href="#">생활/문구/가구/식품</a>
									<a class="category" href="#">스포츠/레저</a>
									<a class="category" href="#">뷰티/미용</a>
									<a class="category" href="#">유아동/출산</a>
									<a class="category" href="#">차량/오토바이</a>
									<a class="category" href="#">기타</a>
									<a class="category" href="#">재능</a>
									<a class="category" href="#">구인구직</a>
									<a class="category" href="#">지역 서비스</a>
									<a class="category" href="#">번개나눔</a>
									<a class="category" href="#">원룸/함께살아요</a>
									<a class="category" href="#">커뮤니티</a>
								</div>
							</div>
						</div>
					</div>
					<div class="menu-box-name">
						<strong>전체 카테고리</strong>
					</div>
				</div>
			</div>
			<div class="side-box1">
				<div class="side-box2">
					<div class="side-box3">
						<div class="wishlist-product">찜한상품</div>
						<div class="wishlist-box">
							<a class="wishlist-a" href="#">
								<img src="resources/img/heart.png" width="9" height="9" alt="찜 아이콘">
								0
							</a>
						</div>
					</div>
					<div class="side-box3">
						<div class="recently-view">최근본상품</div>
						<div class="recently-count-box">
							<div class="recently-count">
								
							</div>
						</div>
						<!-- 최근 본 상품 없을 때 -->
						<div class="recently-none">
							<img src="resources/img/recent.png" width="28" height="16" alt="빈 최근본상품 아이콘">
							<div>
								최근 본 상품이<br>없습니다.
							</div>
						</div>
						<!-- 최근 본 상품 없을 때 -->
						<!-- 최근 본 상품 있을 때 -->
						
						<!-- 최근 본 상품 있을 때 -->
					</div>
					<div class="side-box3">
						<button class="top-btn">TOP</button>
					</div>
				</div>
			</div>
		</div>
		<!-- header end -->