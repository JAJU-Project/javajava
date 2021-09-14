<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<head>
    <title>Page Title</title>
</head>
<body style="text-align: center">
<h1>SpringBoot management.jsp</h1>
<p>매장관리</p>
<a href="category_in.do">카테고리 생성</a>&nbsp&nbsp&nbsp&nbsp&nbsp
<a href="menu_in.do">메뉴 생성</a><p>&nbsp&nbsp&nbsp&nbsp&nbsp
<a href="logout.do">로그아웃</a><p>
<c:if test="${empty category_list}">
    카테고리 및 메뉴가 존재하지 않습니다.
</c:if>
<c:if test="${!empty category_list }">
<body style="text-align:center">
		<center>
			<h1>
				매장관리
			</h1>
            <c:forEach items="${category_list }" var="categoryVo">
                <table border='1' cellpadding='7' cellspacing='2' width='50%'>
                    <tr>
                        <th>매장코드</th>
                        <th>카테고리명</th>
                        <th>생성날짜</th>
                    </tr>

                        <tr>
                            <td>${categoryVo.scode }</td>
                            <td>${categoryVo.cname }</td>
                            <td>${categoryVo.sdate }</td>
                        </tr>
                        <table border='1' cellpadding='7' cellspacing='2' width='50%'>
                            <c:forEach items="${mList}" var="menuVo">
                                <c:if test="${categoryVo.cname == menuVo.cname}">
                                    <tr><th>${menuVo.mname }</th></tr>
                                </c:if>
                            </c:forEach>
                        </table>
                    </c:forEach>
                </table>
</c:if>


</body>
</html>