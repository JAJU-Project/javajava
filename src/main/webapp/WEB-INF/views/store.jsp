<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
	
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<head>
    <title>자주해요 Admin</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
</head>


<body style="text-align: center">
	<style>
	.swiper-container {
	width:550px;
	height:380px;
	border:5px solid silver;
	border-radius:7px;
	box-shadow:0 0 20px #ccc inset;
}
	.swiper-slide {
	text-align:center;
	display:flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
	align-items:center; /* 위아래 기준 중앙정렬 */
	justify-content:center; /* 좌우 기준 중앙정렬 */
}
swiper-slide img {
	box-shadow:0 0 5px #555;
}

	</style>
	
	<c:if test="${empty list }">
		매장이 존재하지 않습니다.
	</c:if>
	<c:if test="${!empty list }">
		<h1>자주해요</h1>
		<div class="swiper-container">
			<c:forEach items="${list }" var="storeVo">
			<div class="swiper-wrapper">
					<div class="swiper-slide">
						<a href="management.do?scode=${storeVo.scode}"">
						<img src="https://www.hollys.co.kr/websrc/images/layout/logo_210302.gif">
					</a>
					</div>
			</div>
			</c:forEach>
			<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
			<div class="swiper-button-prev"></div><!-- 이전 버튼 -->
		</div>
	

</c:if>
<a href="store_create.do">매장 생성</a><p></p>
	
	<script>
	new Swiper('.swiper-container', {
	navigation : {
		nextEl : '.swiper-button-next', // 다음 버튼 클래스명
		prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
	},
});

</script>
</body>
</html>