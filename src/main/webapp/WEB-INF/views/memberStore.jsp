<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<head>
    <title>Page Title</title>
</head>
<body style="text-align: center">
<h1>매장</h1>
<p>로그인 후 ${sname} 페이지</p>
<form method="post" action="kakaoPay.do">
    <button>카카오페이로 결제하기</button>
</form>
<c:if test="${!empty scode}"> 
    <c:forEach items="${clist }" var="categoryVo">
                <table border='1' cellpadding='7' cellspacing='2' width='50%'>
                    <tr>
                        <th>카테고리명</th>
                    </tr>
                        <tr>
                            <td>${categoryVo.cname }</td>
                        </tr>
                        <table border='4' cellpadding='10' cellspacing='3' width='50%'>
                            <c:forEach items="${mlist}" var="menuVo">
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