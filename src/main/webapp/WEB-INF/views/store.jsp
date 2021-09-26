<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
	<script type="text/javascript">
		history.replaceState({}, null, location.pathname);
	</script>	
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<head>
    <title>Page Title</title>
</head>

<body style="text-align: center">
<h1>SpringBoot Index.jsp</h1>
<p>매장</p>
<c:if test="${empty list }">
    매장이 존재하지 않습니다.
</c:if>
<c:if test="${!empty list }">
<body style="text-align:center">
		<center>
			<h1>
				매장 리스트
			</h1>
			<table border='1' cellpadding='7' cellspacing='2' width='50%'>
			<tr>
			<th>매장코드</th>
			<th>매장명</th>
            <th>매장이동</th>
			</tr>

            <c:forEach items="${list }" var="storeVo">
				<tr>
				<td>${storeVo.scode }</td>
				<td>${storeVo.sname }</td>
				
				<td><a href="management.do?scode=${storeVo.scode}">매장관리</a></td>
				</tr>
			</c:forEach>
</c:if>
<a href="store_create.do">매장 생성</a><p>
<a href="logout.do">로그아웃</a><p>




</body>
</html>