<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>

<style>
body {
    font-family: 'Arimo', sans-serif;
    padding-top: 50px;
}

.menu-bar {
    position: absolute;
    top: 20px;    
    left: 50%;
    height: 14px;
    margin-left: -10px;
}

.bars {
    display: block;
    width: 20px;
    height: 3px;    
    background-color: #333;
    box-shadow: 0 5px 0 #333, 0 10px 0 #333;
}

.menu {
    display: none; 
    width: 100%;
    padding: 30px 10px 50px;
    margin: 0 auto;
    text-align: center;
    background-color: #fff;
}
.menu ul {
    margin-bottom: 0;
}
.menu a {
    color: #333; 
    text-transform: uppercase;
    opacity: 0.8;
}
.menu a:hover {
    text-decoration: none;
    opacity: 1;
    
}

.outer {
  text-align: center;
  font-weight: bold;
  font-size: 30px;
}
</style>
<!------ Include the above in your HEAD tag ---------->

    
    	<div class="outer" id="menu">
            <ul class="list-inline">
            <c:forEach items="${clist }" var="categoryVo">
                <li><a href="category.do?cname=${categoryVo.cname}">${categoryVo.cname}</a></li>
            </c:forEach>
            </ul>   
    	</div>

        <c:if test="${!empty mlist}">
        <table align="center" border='4' cellpadding='10' cellspacing='3' width='50%'>
        <tr>
        <th>이름</th>
        <th>가격</th>
        <th>개수 선택</th>
        <th> 장바구니 담기</th>
        <th> 장소 선택 </th>
        </tr>
            <c:forEach items="${mlist}" var="menuVo">
            <tr>
                <td>${menuVo.mname }</td>
                <td>${menuVo.mprice}</td>
                
                <c:forEach items="${clist}" var="categoryVo" >
                    <c:if test="${categoryVo.cname == menuVo.cname}">
                    <form action="category.do" method="post">
                        <th>
                            <select id="bcount" name="bcount" >
                                    <c:forEach var="i" begin="1" end="8">
                                        <option value="${i}">${i}</option>
                                    </c:forEach>
                            </select>
                        </th>
                        <th>
                            <select id="ospot" name="ospot">
                                <option value="S">매장</option>
                                <option value="P">포장</option>
                            </select>
                        </th>
                        <!--<td><a href="category.do?cname=${categoryVo.cname}">장바구니 담기</a></td>-->
                        <input type="hidden" name="cname" id="cname" value="${categoryVo.cname}">
                        <input type="hidden" name="mname" id="mname" value="${menuVo.mname}">
                        <input type="hidden" name="mprice" id="mprice" value="${menuVo.mprice}">
                        <td><button type="submit">장바구니 담기</button></td>
                        </form>
                    </c:if>
                    
                </c:forEach>
                
            </tr>
            </c:forEach>
            </table>
            <h1><a align="center" href="basket.do">장바구니</a></h1>
        </c:if>


    