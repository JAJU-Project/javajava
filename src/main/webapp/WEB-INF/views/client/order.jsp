<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<head>

    <title>자주해요</title>
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
      color: black;
      
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
      color: black;
  }
  
  #modal .content {
      margin-top: 30px;
      
      text-shadow: 1px 1px 2px gray;
      color: black;
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
    
</head>
<body>
<div id="orderbarname">
<h1 id="SSubject">주문내역</h1>
 <a href="client_category.do" style="position: absolute; left:50px; top:10px; color:#f1cf9d;"> << 메뉴 더 담기</a>
</div>
  


    

<div class="to_top" style="display: block;">
    <span></span>
<!--주문상태 팝업창-->
 
<div id="modal" class="modal-overlay">
    <div class="modal-window">
        <div class="title">
            <h2>메뉴 상세정보</h2>
        </div>
        <div class="content">
            <img class="card-img-top rounded img-fluid" id="orderstate" src="img/ing.png">
            <div id="ordst">
                    <p>주문내역</p>
                    <p>매장명</p>
                    <p>메뉴명</p>
            </div>
           
           
          </div>
        </div>
    </div>
  </div>
<!-- 주문상태 팝업창 끝 -->

    <div>
        <table id="orderp" style="position: relative; top: 30px; bottom: 20px;">
                    <div class="table table-striped table-bordered table-hover"
                        id="dataTables-example">
                        <thead>
                            <tr>
                                <th class="center" >매장/포장</th>
                                <th class="center" >매장명</th>
                                <th class="center" >주문일시</th>
                                <th class="center" >주문번호</th>
                                <!--<th class="center" >이미지</th>-->
                                <th class="center" >메뉴명</th>
                                <th class="center" >가격</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${olist}" var="OrderListVo">
                                <tr class="odd gradeX">
                                <c:choose>
                                    <c:when test="${OrderListVo.ospot=='S'}">
                                        <td class="center">매장</td>
                                    </c:when>
                                    <c:when test="${OrderListVo.ospot=='P'}">
                                        <td class="center">포장</td>
                                    </c:when>
                                </c:choose>
                                    <!-- 포장/매장 -->
                                    <td class="center">${OrderListVo.sname}</td>
                                    <td class="center">${OrderListVo.oldate}</td>
                                    <td class="center">${OrderListVo.oseq}</td>
                                    <!--<td class="center"><img src=https://paikdabang.com/wp-content/uploads/2018/05/ICED-원조커피-450x588.png id="new_img"></td>메뉴이미지 -->
                                    <td class="center" onclick="menus(`${OrderListVo.oseq}`)">${OrderListVo.mname1} 등</td><!-- 메뉴명 -->
                                    <td class="center">${OrderListVo.totalprice}</td><!-- 가격 -->
                                </tr>
                            </c:forEach>
                        </tbody>
                    </div>
                </div>
            </tbody>
        </table>
            </div>
        </div>
        <script>


const modal = document.getElementById("modal")

        function menus(oseq){
            modal.style.display='flex';
            console.log("oseq: "+oseq);
        }
      window.onclick =(event)=>{
      if(event.target == modal){
        modal.style.display='none';
                      }
                  }

        </script>
    </body>
       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
    <link href="/assets/css/client.css" rel="stylesheet">

</html>