<head>
<style>
    .myDiv {
      border: 5px outset red;
      background-color: cornsilk;    
      text-align: center;
    }
</style>
</head>
<body>

<a href="https://kauth.kakao.com/oauth/authorize?client_id=abef0ed1e600be69e1e00be538e3cafb&redirect_uri=http://localhost:8000/rdu.do&response_type=code">
            <img src="https://www.gb.go.kr/Main/Images/ko/member/certi_kakao_login.png" style="height:50px;width:auto;">
        </a>
        <a href="test2.do">test</a>
        <button onclick="window.print()">Print</button>
        <form name="pjhInfo" action="pjh_up.do" method="post" >
        <div class="myDiv">
        <textarea cols="100" rows="20"></textarea>
        <input type="submit" value="submit">  
        </div>
        </form>


        <div class="banner">
          <!--header-->
          <div class="header">
            <div class="logo">
              <h1><a href="index.html">Food Corner</a></h1>
            </div>
            <div class="top-nav">
              <span class="menu"><img src="images/menu.png" alt=""/></span>
              <ul>
                <li><a class="active" href="index.do">Home</a></li>
                <li><a href="about.do">About</a></li>					
                <li><a href="menu.do">Menu</a></li>
                <li><a href="codes.do">Codes</a></li>
                <li><a href="blog.do">Blog</a></li>
                <li><a href="contact.do">Contact</a></li>
              </ul>
              <!-- script-for-menu -->
              <script>					
                $("span.menu").click(function(){
                  $(".top-nav ul").slideToggle("slow" , function(){
                  });
                });
                
              </script>
              <!-- script-for-menu -->
            </div>
              <div class="clearfix"> </div>
          </div>	
          <!--//header-->
          <div class="banner-slider">
            <div class="container">
              <div class="slider">
                <div class="callbacks_container">
                  <ul class="rslides" id="slider4">
                    
                  <div id="box">
                    <li>
                      <div class="banner-info">
                        <h3>Lorem ipsum dolor sit amet</h3>
                        <p>Donec tellus metus, ornare et mollis ut, maximus id nisi. Quisque scelerisque accumsan sem nec ullamcorper. Cras sed purus eget augue egestas commodo. Sed erat magna, pharetra aliquet mattis mollis, maximus eget lacus. </p>
                        <a href="menu.html">Menu</a>
                      </div>
                    </li>
                  </div>
                  <script type="text/javascript">
                    var initBody;
                    
                    function beforePrint() {
                     boxes = document.body.innerHTML;
                     document.body.innerHTML = box.innerHTML;
                     
                    }
                    function afterPrint() { 
                     document.body.innerHTML = boxes;
                    }
                    function printArea() {
                     window.print();
                    }
                    
                    window.onbeforeprint = beforePrint;
                    window.onafterprint = afterPrint;
                    
                    </script>
                <script src="js/responsiveslides.min.js"></script>
                <script>
                  // You can also use "$(window).load(function() {"
                  $(function () {
                    // 옆으로 넘기는 기능 Slideshow 4
                    $("#slider4").responsiveSlides({
                    auto: true,
                    pager:true,
                    nav:false,
                    speed: 500,
                    namespace: "callbacks",
                    before: function () {
                      $('.events').append("<li>before event fired.</li>");
                    },
                    after: function () {
                      $('.events').append("<li>after event fired.</li>");
                    }
                    });
                
                  });
                 </script>
                <!--banner Slider starts Here-->
              </div>
            </div>
          </div>
        </div>
</body>

