<creview>

  <%@ page contentType="text/html;charset=utf-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
  
  <!DOCTYPE html>
  <html xmlns="http://www.w3.org/1999/xhtml"> 
  <head>
      <meta charset="utf-8" />
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
      <title>자주해요</title> 
      <link href="/assets/css/client.css" rel="stylesheet" />
  </head>
  
  <html>
    <body style="text-align: center; font-size:large; ">
  <div class="orderbarnamee" id="orderbarname" style="position: relative; top: 20px; bottom: 20px;">
    <body style="text-align: center">
        
        <h1>리뷰 페이지</h1>

        <a href="client_category.do" style="position: absolute; left:50px; top:10px; color:#f1cf9d; "> << 처음으로</a>
 <a href="reviewrite.do" style="color:#f1cf9d; position: absolute; right:50px; top:10px;  ">리뷰작성</a>
    </div>
  <div class="container" id="reviewbox">
    <div class="mySlides">
      <div class="numbertext">1 / 6</div>
      <img src="./img/커피1.png" style="width:100%">
    </div>
  
    <div class="mySlides">
      <div class="numbertext">2 / 6</div>
      <img src="./img/커피2.png" style="width:100%">
    </div>
  
    <div class="mySlides">
      <div class="numbertext">3 / 6</div>
      <img src="./img/커피3.png" style="width:100%">
    </div>
      
    <div class="mySlides">
      <div class="numbertext">4 / 6</div>
      <img src="./img/커피4.png" style="width:100%">
    </div>
  
    <div class="mySlides">
      <div class="numbertext">5 / 6</div>
      <img src="./img/커피5.png" style="width:100%">
    </div>
      
    <div class="mySlides">
      <div class="numbertext">6 / 6</div>
      <img src="./img/커피6.png" style="width:100%">
    </div>
      <div>
    <a class="prev" onclick="plusSlides(-1)">❮</a>
    <a class="next" onclick="plusSlides(1)">❯</a>
  </div>
    <div class="caption-container">
      <p id="caption"></p>
    </div>
  
    <div class="row">
      <div class="column">
        <img class="demo cursor" src="./img/커피1.png" style="width:100%" onclick="currentSlide(1)" alt="존맛이에여">
      </div>
      <div class="column">
        <img class="demo cursor" src="./img/커피2.png" style="width:100%" onclick="currentSlide(2)" alt="별점5점">
      </div>
      <div class="column">
        <img class="demo cursor" src="./img/커피3.png" style="width:100%" onclick="currentSlide(3)" alt="츄베릅">
      </div>
      <div class="column">
        <img class="demo cursor" src="./img/커피4.png" style="width:100%" onclick="currentSlide(4)" alt="미스터츄">
      </div>
      <div class="column">
        <img class="demo cursor" src="./img/커피5.png" style="width:100%" onclick="currentSlide(5)" alt="리뷰이벤트참여했어여">
      </div>    
      <div class="column">
        <img class="demo cursor" src="./img/커피6.png" style="width:100%" onclick="currentSlide(6)" alt="존맛">
      </div>
    </div>
  </div>
  <script>
  var slideIndex = 1;
  showSlides(slideIndex);
  
  function plusSlides(n) {
    showSlides(slideIndex += n);
  }
  
  function currentSlide(n) {
    showSlides(slideIndex = n);
  }
  
  function showSlides(n) {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("demo");
    var captionText = document.getElementById("caption");
    if (n > slides.length) {slideIndex = 1}
    if (n < 1) {slideIndex = slides.length}
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";
    dots[slideIndex-1].className += " active";
    captionText.innerHTML = dots[slideIndex-1].alt;
  }
  
  </script>
  
  </body>
    
  </html>