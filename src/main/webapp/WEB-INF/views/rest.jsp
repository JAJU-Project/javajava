<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<head>
    <title>Page Title</title>
</head>
<body style="text-align: center">
<h1>SpringBoot Index.jsp</h1>
<p>주소록</p>

<table border='1' cellpadding='7' cellspacing='2' width='50%' align="center">
        <tr>
            <th>번호</th>
            <th>이름</th>
            <th>주소</th>
            <th>날짜</th>
            <th>삭제</th>
        </tr>

        <c:if test="${empty list}">
            <tr>
                <td align='center' colspan="5">데이터가 하나도 없음</td>
            </tr>
        </c:if>
        <c:forEach items="${list}" var="address">
            <tr>
                <td align='center'> ${address.seq}</td>
                <td>${address.name}</td>
                <td>${address.addr}</td>
                <td>${address.rdate}</td>
                <td align='center'><a href='del.do?seq=${address.seq}'>삭제</a></td>
            </tr>
        </c:forEach>

    </table>
</body>
</html>