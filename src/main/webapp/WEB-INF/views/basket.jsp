<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<c:if test="${!empty blist}">

    <table align="center" border='4' cellpadding='10' cellspacing='3' width='50%'>
        <tr>
            <th>이름</th>
            <th>수량</th>
            <th>가격</th>
            <th>장소</th>
        </tr>
            <form method="post" action="kakaoPay.do">
                <c:forEach items="${blist}" var="BasketVo">
                    <tr>
                        <td>${BasketVo.mname }</td>
                        <td>${BasketVo.bcount }</td>
                        <td>${BasketVo.mprice}</td>
                        
                    </tr>
                    <input type="hidden" name="bcount" id="bcount" value="${BasketVo.bcount}">
                    <input type="hidden" name="mname" id="mname" value="${BasketVo.mname}">
                    <input type="hidden" name="mprice" id="mprice" value="${BasketVo.mprice}">
                    <input type="hidden" name="kid" id="kid" value="${BasketVo.kid}">
                </c:forEach>
                    <th>
                        <select id="ospot" name="ospot">
                            <option value="S">매장</option>
                            <option value="P">포장</option>
                        </select>
                    </th>
                
                <input type="hidden" name="basketVo" id="blist" value="${blist}">
                <td><button type="submit">구매</button></td>
            </from>
        </table>
            
            

        </c:if>