<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="../views/include/header.jsp" />

<!-- Style -->
<link rel="stylesheet" href="resources/css/index.css">

		<div class="index-top">
			<div class="index-top-box">
				<div class="slick-slider slick-initialized" dir="ltr">
					<button type="button" data-role="none" class="slick-arrow slick-prev" style="display: block;">autu-view
					</button>
					<a href="boardList.do">게시판쓰</a>
				</div>
				<div class="index-product">
					<a class="index-product-a" href="#">
						<div class="index-product-img">
							<img src="" width="194" height="194" alt='상품 이미지' />
						</div>
						<div class="index-product-content">
							<div class="index-product-name">
								이름
							</div>
							<div class="index-product-etc">
								<div class="index-product-price">
									가격
								</div>
								<div class="index-product-time">
									<span>시간</span>
								</div>
							</div>
						</div>
					</a>
				</div>
			</div>
		</div>
		<div class="index-bottom">
			<h2>상품</h2>
			<div class="index-bottom-box">
			</div>
		</div>
		
<jsp:include page="../views/include/footer.jsp" />