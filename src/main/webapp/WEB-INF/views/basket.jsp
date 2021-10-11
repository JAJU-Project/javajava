<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<c:if test="${!empty blist}">
<div id="test">
    <table align="center" border='4' cellpadding='10' cellspacing='3' width='50%'>
        <tr>
            <th>이름</th>
            <th>수량</th>
            <th>가격</th>
            <th>수량변경</th>
        </tr>
            <form method="post" action="kakaoPay.do">
                <c:forEach items="${blist}" var="BasketVo">
                    <tr>
                        <td>${BasketVo.mname }</td>
                        <td>${BasketVo.bcount }</td>
                        <td>${BasketVo.mprice}</td>
                        <td>
                            <select id="count" name="count" onchange="test(this.value);">
                                <option value="${BasketVo.baseq}|${BasketVo.bcount}">${BasketVo.bcount}</option>
                                <option value="${BasketVo.baseq}|1">1</option>
                                <option value="${BasketVo.baseq}|2">2</option>
                                <option value="${BasketVo.baseq}|3">3</option>
                                <option value="${BasketVo.baseq}|4">4</option>
                                <option value="${BasketVo.baseq}|5">5</option>
                            </select>
                        </td>
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
        </div>
        </c:if>

    <script src="assets/js/jquery-1.10.2.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/materialize/js/materialize.min.js"></script>
	<script src="assets/js/jquery.metisMenu.js"></script> 
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.12.0.min.js" ></script>
    <script type="text/javascript"></script>

<script>
function test(sParam) {
    console.log(sParam);
    data = sParam.split("|")
    data[0] = data[0].trim();
    data[1] = data[1].trim();
    console.log("data0:::::"+data[0]);
    console.log("data1::::::"+data[1]);
    console.log(data);
    
    var countDate = {
        "data0":data[0],
        "data1":data[1],
        "data":data}
    
    $.ajax({
        url:"countTest",
        type:"post",
        data:countDate,
        success:function (data) {
            $("#test").load(window.location.href + "#test");
        }
    })
}
</script>