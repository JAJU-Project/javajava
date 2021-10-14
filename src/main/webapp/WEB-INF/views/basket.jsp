<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<c:if test="${!empty blist}">

<!doctype html>
<html lang="ko">
  <head>
 
    <meta charset="utf-8">
    <title>CSS</title>
    <link href="/assets/css/client.css" rel="stylesheet">
    <style>
      table {
        width: 100%;
        border-top: 1px solid #c1bbbb;
        border-collapse: collapse;
        
      }
      th, td {
        border-bottom: 1px solid #c1bbbb;
        padding: 30px;
      }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- 상단바, 사이드바 스타일 시작 -->
<style>
    * {padding:0;margin:0;}
    body {background:#fff;}
    header {width:100%;background:#fbd39738;position:relative;z-index:10;}
    .header-list {width:1200px;margin:0 auto;font-size:0;padding:15px 0;}
    .header-list > li {font-size:12px;display:inline-block;vertical-align:middle;}
    .header-list > li:nth-child(1) {font-size:20px;width:200px;}
    .header-list > li:nth-child(2) {width:calc(100% - 250px);}
    .header-list > li:nth-child(3) {width:50px;}
    .header-list > li > div {width:auto;}
    
    .menu-ul {font-size:0;}
    .menu-ul > li {font-size:12px;display:inline-block;vertical-align:middle;}
    .menu-ul > li > a {display:block;width:auto;padding:15px;}
    
    input[id="menuicon"] {display:none;}
    input[id="menuicon"] + label {display:block;position:relative;width:100%;height:40px;cursor:pointer;}
    input[id="menuicon"] + label span {display:block;position:absolute;width:100%;height:3px;border-radius:30px;background:#666;transition:all .35s;}
    input[id="menuicon"] + label span:nth-child(1) {top:10%;}
    input[id="menuicon"] + label span:nth-child(2) {top:50%;transform:translateY(-50%);} /* 비슷하게 사용할 수 있는 style top:calc(50% - 2.5px); margin-top:-2.5px;*/
    input[id="menuicon"] + label span:nth-child(3) {bottom:10%;}
    input[id="menuicon"]:checked + label {z-index:2;}
    input[id="menuicon"]:checked + label span:nth-child(1) {top:50%;transform:translateY(-50%) rotate(45deg);}
    input[id="menuicon"]:checked + label span:nth-child(2) {opacity:0;}
    input[id="menuicon"]:checked + label span:nth-child(3) {bottom:50%;transform:translateY(50%) rotate(-45deg);}
    div[class="sidebar"] {width:100%;height:100%;background:#aaa;position:fixed;top:76px;left:0;z-index:1;transition:all .35s;overflow:hidden;}
    input[id="menuicon"]:checked + label + div {height:300px;}
    
    .sitemap-ul {font-size:0;width:1200px;margin:15px auto;text-align:center;}
    .sitemap-ul > li {font-size:12px;display:inline-block;vertical-align:top;width:20%;}
    </style>
     <style>
        input[id="menuicon"] {display:none;}
        input[id="menuicon"] + label {display:block;margin:30px;width:60px;height:50px;position:relative;cursor:pointer;}
        input[id="menuicon"] + label span {display:block;position:absolute;width:100%;height:5px;border-radius:30px;background:#000;transition:all .35s;}
        input[id="menuicon"] + label span:nth-child(1) {top:0;}
        input[id="menuicon"] + label span:nth-child(2) {top:50%;transform:translateY(-50%);} /* 비슷하게 사용할 수 있는 style top:calc(50% - 2.5px); margin-top:-2.5px;*/
        input[id="menuicon"] + label span:nth-child(3) {bottom:0;}
        input[id="menuicon"]:checked + label {z-index:2;}
        input[id="menuicon"]:checked + label span {background:#fff;}
        input[id="menuicon"]:checked + label span:nth-child(1) {top:50%;transform:translateY(-50%) rotate(45deg);}
        input[id="menuicon"]:checked + label span:nth-child(2) {opacity:0;}
        input[id="menuicon"]:checked + label span:nth-child(3) {bottom:50%;transform:translateY(50%) rotate(-45deg);}
        div[class="sidebar"] {width:300px;height:100%;background:#222;position:fixed;top:0;left:-300px;z-index:1;transition:all .35s;}
        input[id="menuicon"]:checked + label + div {left:0;}
        </style>

        <style>
            * {padding:0;margin:0;}
            input[id="menuicon"] {display:none;}
            input[id="menuicon"] + ul {display:block;position:fixed;right:0;top:50%;transform:translateY(-50%);transition:all .35s;text-align:right;}
            input[id="menuicon"] + ul > li {display:block;width:50px;height:50px;border:1px solid #f1f1f1;position:relative;margin-top:-1px;}
            input[id="menuicon"] + ul > li > a {display:block;width:auto;height:50px;overflow:hidden;transition:all .35s;}
            input[id="menuicon"] + ul > li > label {display:block;cursor:pointer;width:auto;height:50px;background:#dadada;}
            input[id="menuicon"] + ul > li:nth-child(1) label span {display:block;position:absolute;width:50%;height:3px;border-radius:30px;background:#333;transition:all .35s;}
            input[id="menuicon"] + ul > li:nth-child(1) label span:nth-child(1) {top:30%;left:50%;transform:translateX(-50%);}
            input[id="menuicon"] + ul > li:nth-child(1) label span:nth-child(2) {top:50%;left:50%;transform:translate(-50%,-50%);}
            input[id="menuicon"] + ul > li:nth-child(1) label span:nth-child(3) {bottom:30%;left:50%;transform:translateX(-50%);}
            input[id="menuicon"] + ul > li:nth-child(2) a .icon {background:url('./img/search.png') center center no-repeat;background-size:50%;display:inline-block;width:50px;height:50px;vertical-align:middle;}
            input[id="menuicon"] + ul > li:nth-child(3) a .icon {background:url('./img/sand-clock.png') center center no-repeat;background-size:50%;display:inline-block;width:50px;height:50px;vertical-align:middle;}
            input[id="menuicon"]:checked + ul {z-index:2;right:300px;}
            input[id="menuicon"]:checked + ul > li:nth-child(1) label {z-index:2;right:300px;}
            input[id="menuicon"]:checked + ul > li:nth-child(1) label span:nth-child(1) {top:50%;left:50%;transform:translate(-50%,-50%) rotate(45deg);}
            input[id="menuicon"]:checked + ul > li:nth-child(1) label span:nth-child(2) {opacity:0;}
            input[id="menuicon"]:checked + ul > li:nth-child(1) label span:nth-child(3) {bottom:50%;left:50%;transform:translate(-50%,50%) rotate(-45deg);}
            div[class="sidebar"] {width:300px;height:100%;background:#f5f5f5;position:fixed;top:0;right:-300px;z-index:1;transition:all .35s;}
            input[id="menuicon"]:checked + ul + div {right:0;}
            
    </style>
     <!-- 상단바, 사이드바 스타일 끝 -->

    <header>
        <meta name="viewport" content="width=device-width,initial-scale=1"><!--모바일 반응형 전용-->
        <ul class="header-list">
            <li id="titledes"><img src="" id="titlelogo"></li>
            <li>
                <div class="menu-ulul">
                    <ul class="menu-ul">
                        <li id="li2"><a href="client_category.do">Menu</a></li>
                        <li id="li3"><a href="creview.do">Review</a></li>
                        <li id="li4"><a href="basket.do">Basket</a></li>
                        <li id="li5"><a href="order.do">주문내역</a></li>
                    </ul>
                </div>
            </li>
            <li id="li6">
                <div id="menubox">
                    <input type="checkbox" id="menuicon">
                    <label for="menuicon" >
                        <span></span>
                        <span></span>
                        <span></span>
                    </label>
                    <div class="sidebar">
                        <ul class="sitemap-ul">
                                <ul>
                                    <p id="lili"><a href="client_category.do">Menu</a></p>
                                    <p id="lili"><a href="creview.do">Review</a></p>
                                    <p id="lili"><a href="basket.do">Basket</a></p>
                                    <p id="lili"><a href="order.do">주문내역</a></p>
                                </ul>
                                </ul>
                            </div>
                        </div>
                    </li>
                </ul>
            </header>
   
            <!-- 상단바 끝 -->
          
      

        <meta name="viewport" content="width=device-width, initial-scale=1">
       
        <style type="text/css">

      * {margin:0; padding:0;}
      
      li {float:left; list-style:none; margin:1px;}
      
      li a {display:block; width:130px; height:40px;   font-size:12px; 
      
       text-align:center; padding-top:10px; text-decoration:none;}
      
      li a span {display:block;}
            
   </style>
  </head>

  <div class="orderbarnamee" id="orderbarname" style="position: relative; top: 20px; bottom: 20px;">
    <body style="text-align: center">
        
        <h1>장바구니</h1>

        <a href="client_category.do" style="position: absolute; left:50px; top:10px; color:#f1cf9d; "> << 메뉴 더 담기</a>
    </div>
    

  <div class="cart2" style= "position: relative; top: 40px; bottom: 20px;">
  <body>
    <table>
      <thead>

      </thead>
      <tbody>
        <tr>
         <td>
          <p><input type = "checkbox" name="pick" value="S" onclick='checkOnlyOne(this)'/> 매장</p>
         <br><input type = "checkbox" name="pick" value="P" onclick='checkOnlyOne(this)' /> 포장
        </td>
          <td></td>
          <td></td>
          <td></td>
         <td> <a class="button" href="#">비우기</a></td>
        </tr>
<script>
function checkOnlyOne(element) {
  
  const checkboxes 
      = document.getElementsByName("pick");
  
  checkboxes.forEach((cb) => {
    cb.checked = false;
  })
  
  element.checked = true;
}
</script>

<!--수량

    <script>
      $(function (){
        $.ajax({
          url:"rest",
          type:"post",
          data:{catgo:"ICE"},
          success: function(data){
            var a = data[0];
            console.log(data[0]);
            console.log(document.getElementById("wlgns").innerHTML);
            var b = document.getElementById("wlgns").innerHTML;
            document.getElementById("wlgns").innerHTML = "<td><img src="+a.mimage+" id='new_img' width=100 height=100></td><td><P>"+a.mname+"</P><P id = 'menu3Price'> "+a.mprice+"</P></td>"+b;
            console.log(a.mprice);
          }
        });
      })
    </script>-->
    <form method="post" action="kakaoPay.do">
    <c:forEach items="${blist}" var="BasketVo">
        <script>
                function plusV(){
                  document.getElementById("menuCount").value++;
                  var price = document.getElementById("menuPrice").innerHTML;
                  var a = price * document.getElementById("menuCount").value ;
                  document.getElementById("wlgns").value = a ;
                  var total = Number(document.getElementById("total_amount").innerHTML);
                  total += Number(price);
                  document.getElementById("total_amount").innerHTML =total;
                  document.getElementById("menuIn").value =total;
                }
                
                function minusV(){
                  document.getElementById("menuCount").value--;
                  var price = document.getElementById("menuPrice").innerHTML;
                  var a = price * document.getElementById("menuCount").value ;
                  document.getElementById("wlgns").value = a ;
                  var total = Number(document.getElementById("total_amount").innerHTML);
                  total -= Number(price);
                  document.getElementById("total_amount").innerHTML =total;
                }
          </script>

 <tr id="wlgns">
            <td>${BasketVo.mname }</td>
           <td>
            <P id = 'menuPrice'>${BasketVo.mprice}</P>
            </td>

              <td>
                <form name="form" method="get">
                  <input type=button value=" - " onClick="minusV()">
                  <input id= "menuCount" type=text name="bcount" value="${BasketVo.bcount}" readonly="readonly" style="text-align:center;">
                  <input type="button" value=" + " onClick="plusV()">
                  </form>
              </td>
         
          <td> <input id="menuIn" type="text" name="sum" size="11" value="0" readonly>원</td>
          <td> <a class="button" href="#">삭제</a></td>
        </tr>
        </c:forEach>
      
<!--수량-->

<!--
        <tr >
          <td><img src=${menuVo.mimage} id="new_img" width=100 height=100></td>
          <td>
            <P>${BasketVo.mname }</P>
            <P>${BasketVo.bcount }</P>
            </td>
               
              <td>
                <form name="form" method="get">
                  <input type=hidden name="sell_price" value="5500">
                  <input type="button" value=" - " onclick="del();">
                  <input type=text name="amount" value=1 readonly="readonly" onchange="change();" style="text-align:center;">
                  <input type="button" value=" + " onclick="add();">
                  </form>
              </td>
         
          <td> <input type="text" name="sum" size="11" readonly>원</td>
          <td><a class="button" href="#">삭제</a></td>

        </tr>


        <tr>
          <td>이미지</td>
          <td>
            <P>레몬에이드</P>
           <p>2800</p>
             </td>
 
              <td>
                <form>
                  <input type=button value=" - " onClick="minusV();">
                  <input id= "menu3Count" type=text name=amount value=0 readonly="readonly" style="text-align:center;">
                  <input type="button" value=" + " onClick="plusV();">
                  </form>
              </td>
         
          <td> <input id="" type="text" name="sum" size="11" value="0" readonly>원</td>
          <td><a class="button" href="#">삭제</a></td>

        </tr>
        <tr>
          <td>이미지</td>
          <td>
            <P>녹차프라푸치노</P>
            <P> 4500원</P>
            </td>
               
              <td>
                <form>
                  <input type=button value=" - " onClick="javascript:this.form.amount.value--;">
                  <input type=text name=amount value=0 readonly="readonly" style="text-align:center;">
                  <input type=button value=" + " onClick="javascript:this.form.amount.value++;">
                  </form>
              </td>
         
          <td> <input type="text" name="sum" size="11" readonly>원</td>
          <td><a class="button" href="#">삭제</a></td>

        </tr>
        <tr>
          <td>이미지</td>
          <td>
            <P> 아이스바닐라라떼</P>
            <P> 4700원</P>
            </td>
               
              <td>
                <form>
                  <input type=button value=" - " onClick="javascript:this.form.amount.value--;">
                  <input type=text name=amount value=0 readonly="readonly" style="text-align:center;">
                  <input type=button value=" + " onClick="javascript:this.form.amount.value++;">
                  </form>
              </td>
         
          <td> <input type="text" name="sum" size="11" readonly>원</td>
          <td><a class="button" href="#">삭제</a></td>

        </tr>
-->
         
      </tbody>
    
    </table>
   

</div>

<div style="position: absolute; bottom:1px; right:30px;">
 <table>
 <tr>
  <td>총 금액</td> <td id="total_amount">0</td>
  <td><a href="">결제하기 >></a></td>
 </tr>
 </table>
</div>

</body>
</html>
</c:if>
