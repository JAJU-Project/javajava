<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
  
  <!DOCTYPE html>
  <html xmlns="http://www.w3.org/1999/xhtml">
  <link href="/assets/css/client.css" rel="stylesheet" /> 
  <head>
      <meta charset="utf-8" />
      <!-- 상단바, 사이드바 스타일 시작 -->
<style>
    * {padding:0;margin:0;}
    body {background:#fff;}
    header {width:100%;background:#fbd39738;position:relative;z-index:10;}
    .header-list {width:980px;margin:0 auto;font-size:0;padding:20px 40px 20px 220px;}
    .header-list > li {font-size:12px;display:inline-block;vertical-align:middle;}
    .header-list > li:nth-child(1) {font-size:20px;width:200px;}
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
                <li id="li5"><a href="order.do">Orderlist</a></li>
              </ul>
            </div>
          </li>
      </ul>
    </header>

            <!-- 상단바 끝 -->
    <title>자주해요</title>  
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

<!-- 상단 이미지 -->
        <c:forEach var="list" items="${maplist}">
          <div class="mySlides" id="mySlides">
            <img src="${list.RIMG}" style="width:350px; height:350px; border-radius: 5%;">
          </div>
        </c:forEach>
  
        <div>
          <a class="prev" onclick="plusSlides(-1)">❮</a>
          <a class="next" onclick="plusSlides(1)">❯</a>
        </div>

<!-- 제목 부분 -->
        <c:forEach items="${maplist}" var="map" end="0" >
          <div class="caption-container" id="caption">
            <div onclick="menus('${map.RSEQ}')">${map.RTITLE}|${map.RSEQ}</div>
          </div>
        </c:forEach>

        <div id="modal" class="modal-overlay">
          <div class="modal-window">
            <div class="title">
              <h2 style="color: aliceblue;">리뷰 들여다보기</h2>
            </div>
            <div class="content">

            </div>
          </div>
        </div>
    

        <style>
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
              width: 650px;
              height: 550px;
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
              margin-top: 50px;
              color: black;
          }
        </style>


  
        <div class="row" style="width:100%; height: 10%;">
          <c:forEach var = "list" items="${maplist}" varStatus="number">
            <div class="column">
              <img class="demo cursor" src="${list.RIMG}" id="cutest" onclick="currentSlide('${number.count}|${list.RSEQ}')" alt="${list.RTITLE}|${list.RSEQ}">
            </div>
          </c:forEach>
        </div>
  </div>

  <script>
  var slideIndex = 1;
  showSlides(slideIndex);
  
  function plusSlides(n) {

    showSlides(slideIndex += n);
    var cutest = document.getElementById('cutest');
    var t = cutest.getAttribute('onclick');
    console.log("t: "+t);
   
  }
  
  function currentSlide(n) {
    var array = n.split("|");
    console.log("currentSlidecurrentSlide: "+array[0]);
    showSlides(slideIndex = array[0]);
    seqChange(array[1]);
  }

  function seqChange(sParms) {
    console.log("seqChange:"+sParms);
    var m = "menus(`"+sParms+"`)";
    console.log(m);
    var onclick = document.getElementById('caption').setAttribute('onclick',m);
  }
  
  function showSlides(n) {
    console.log("showSlides : "+n);
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("demo");
    var captionText = document.getElementById("caption");
    console.log("captionText:"+captionText.textContent);
    for (let i = 0; i < slides.length; i++) {
      //console.log("slides:"+slides[i].innerHTML);
    }
    for (let i = 0; i < dots.length; i++) {
      console.log("dots:"+dots[i].alt);
    }
    
    
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

    var dotsArray1 = dots[slideIndex-1].alt;
    var dotsArray = dotsArray1.split("|");
    console.log(dotsArray[1]);
    captionText.innerHTML = dotsArray[0];
    console.log("ddd"+captionText.innerHTML);
    var captionText2 = document.getElementById("caption");
    console.log("captionText2:"+captionText2.textContent);

    seqChange(dotsArray[1]);
  }
  
  </script>

  <script>
      const modal = document.getElementById("modal")
      const btnModal = document.getElementById("modal_menu")
      

      
        function menus(sParms){
          console.log("sParms seq: "+sParms);
          //var  obj = sParms.value;
          var  rseqData = {"rseq":sParms};
          modal.style.display="flex";
         
           $.ajax({
            url:"review_seq",
            type:"post",
            data:rseqData,
            success: function(data){
              console.log(JSON.stringify(data));
              var html = "";
              for(let list of Object.keys(data)){
                var capital = data[list];
                var user = capital.KID;
                id = user.split("@");

                html += '<br> <div class="content_sub" style="padding: 10px, 50px;">';
                html += '<h3>'+id[0]+' 님</h3><br>';
                html += ''+capital.RCONTENT+'';
                html += '</div></br>';
                html += '<div class="boss_content" style="padding-top: 50px;">';
                html += '<h3 style="color:#d9902f;">사장님 한말씀 >></h3><br>';
                if(capital.COCONTENT==null){
                  html += '관리자 답글 없음'
                }else{
                  html += ''+capital.COCONTENT+'';
                }
                html += '</div>';
              }

              $(".content").html("");
              $(".content").html(html);


            }
          })
      }
    
        window.onclick =(event)=>{
          if(event.target == modal){
            modal.style.display='none';
                          }
                      }
    </script>
  
  </body>
    
  </html>