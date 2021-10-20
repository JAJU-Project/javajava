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
     <style>/* 이부분 없어도 될듯*/
        input[id="menuicon"] {display:none;}
        input[id="menuicon"] + label {display:block;margin:30px;width:60px;height:50px;position:relative;cursor:pointer;}
        input[id="menuicon"] + label span {display:block;position:absolute;width:100%;height:5px;border-radius:30px;background:#000;transition:all .35s;}
        input[id="menuicon"] + label span:nth-child(1) {top:0;}
        input[id="menuicon"] + label span:nth-child(2) {top:50%;transform:translateY(-50%);} 
        input[id="menuicon"] + label span:nth-child(3) {bottom:0;}
        input[id="menuicon"]:checked + label {z-index:2;}
        input[id="menuicon"]:checked + label span {background:#fff;}
        input[id="menuicon"]:checked + label span:nth-child(1) {top:50%;transform:translateY(-50%) rotate(45deg);}
        input[id="menuicon"]:checked + label span:nth-child(2) {opacity:0;}
        input[id="menuicon"]:checked + label span:nth-child(3) {bottom:50%;transform:translateY(50%) rotate(-45deg);}
        div[class="sidebar"] {width:300px;height:100%;background:#222;position:fixed;top:0;left:-300px;z-index:1;transition:all .35s;}
        input[id="menuicon"]:checked + label + div {left:0;}
        </style><!-- 이부분 없어도 될듯-->

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
            
            #modal.modal-overlay {
      width: 100%;
      height: 100%;
      position: absolute;
      left: 0;
      top: 0;
      display: none;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      background: rgba(255, 255, 255, 0.25);
      box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
      backdrop-filter: blur(1.5px);
      -webkit-backdrop-filter: blur(1.5px);
      border-radius: 10px;
      border: 1px solid rgba(255, 255, 255, 0.18);
      z-index: 10000;

  }
  #modal .modal-window {
      background: rgb(237 224 159 / 65%);
      box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
      backdrop-filter: blur( 13.5px );
      -webkit-backdrop-filter: blur( 13.5px );
      border-radius: 10px;
      border: 1px solid rgba( 255, 255, 255, 0.18 );
      width: 400px;
      height: 500px;
      position: relative;
      top: -100px;
      padding: 10px;
  }
  #modal .title {
      padding-left: 10px;
      display: inline;
      text-shadow: 1px 1px 2px gray;
      color: white;
      
  }
  #modal .title h2 {
      display: inline;
  }
  #modal .close-area {
      display: inline;
      float: right;
      padding-right: 10px;
      cursor: pointer;
      text-shadow: 1px 1px 2px gray;
      color: white;
  }
  
  #modal .content {
      margin-top: 30px;
      
      text-shadow: 1px 1px 2px gray;
      color: white;
  }
    </style>
    <style type="text/css">

        * {margin:0; padding:0;}
        
        li {float:left; list-style:none; margin:1px;}
        
        li a {display:block; width:130px; height:40px;   font-size:12px; 
        
         text-align:center; padding-top:10px; text-decoration:none;}
        
        li a span {display:block;}
              
     </style>
    
    
    
    <!-- 상단바, 사이드바 스타일 끝 -->

    <header>

        <ul class="header-list">
            <li id="titledes"><img src="" id="titlelogo"></li>
            <li>
                <div class="menu-ulul">
                    <ul class="menu-ul" style="text-align: center">
                        <li id="li2"><a href="client_category.do">Menu</a></li>
                        <li id="li3"><a href="creview.do">Review</a></li>
                        <li id="li4"><a href="basket.do">Basket</a></li>
                        <li id="li5"><a href="order">orderList</a></li>
                    </ul>
                </div>
            </li>
                </ul>
            </header>
     
            <!-- 상단바 끝 -->
          
      

   
       
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
         <td></td>
          <td>
         <p><input type = "checkbox" name="pick" value="S" onclick='checkOnlyOne(this)'/> 매장</p>
         <br><input type = "checkbox" name="pick" value="P" onclick='checkOnlyOne(this)' /> 포장
          </td>
          <td></td>
          <td></td>
           <td></td>
         <td> <a class="button" href="basket_delete">비우기</a></td>
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
 
    <c:forEach items="${blist}" var="BasketVo">
       <form method="post" action="kakaoPay.do">
        <script>
                function plusV(baseq){
                  var baseqDate = {"baseq":baseq}
                  $.ajax({
                    url:"countUp",
                    type:"post",
                    data: baseqDate,
                    success:function(){
                      //$("#test2").load(window.location.href+"#test2");
                      location.reload();
                    }
                  })
                }
                
                function minusV(baseq){
                  var baseqDate = {"baseq":baseq}
                  $.ajax({
                    url:"countDown",
                    type:"post",
                    data:baseqDate,
                    success:function(){
                      location.reload();
                    }
                  })
                }
          </script>


 <tr id="wlgns">
            <td class="check"><input type="checkbox" name="buy" value="260" checked="" onclick="javascript:basket.checkItem();"></td>
            <td>${BasketVo.mname }</td>
           <td>
            <P id = 'menuPrice'>${BasketVo.basicprice}</P>
            </td>

              <td>
                <form name="form" method="get">
                  <input type=button value=" - " onClick="minusV(`${BasketVo.baseq}`)">
                  <input id= "menuCount" type=text name="bcount" value="${BasketVo.bcount}" readonly="readonly" style="text-align:center;">
                  <input type="button" value=" + " onClick="plusV(`${BasketVo.baseq}`)">
                  </form>
              </td>
         
          <td> <input id="menuIn" type="text" name="sum" size="11" value=${BasketVo.mprice} readonly>원</td>
          <td> <a class="button" href="basket_deleteBybaseq?baseq=${BasketVo.baseq}">삭제</a></td>
        </tr>
        </c:forEach>
         
      </tbody>
    
    </table>
   

</div>

<div style="position: absolute; bottom:1px; right:30px;" id="test2">
<c:if test="${!empty total_mprice}">
 <table>
 <tr>
  <td>총 금액</td> <td id="total_amount">${total_mprice}</td>
  <td><button type="submit">결제하기 >></button></td>
 </tr>
 </form>
 </table>
</c:if>
</div>

</body>
</html>
</c:if>
