<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>


<!DOCTYPE html>
<html>
  <meta charset="utf-8">
  <head>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

    <title>Page Title</title>
    <link href="/assets/css/client.css" rel="stylesheet">
  </head>

  <style>
    table {
      
      width: 100%;
      border-top: 1px solid #bdb8b8;
      border-collapse: collapse;
    }
    th, td {
      border-bottom: 1px solid #bdb8b8;
      padding: 10px;
    }

    .basketin {
          z-index: 20;
          border-radius: 100px;
          width: 50px;
          height: 50px;
          display: flex;
          align-items: center;
          justify-content: center;
          position: fixed;
          bottom:10px !important;
          right: 150px !important;
          background-color: #FC2822 !important;
          box-shadow: 3px 3px 5px rgba(0,0,0,0.2);
          /* border:1px solid #ededed */
          cursor: pointer;
      }
  </style>

  <body style="text-align: center" id="body">
    <div style="padding:30px;"> 
      <h1><img src="img/jaju1.png" class=jaju alt="jaju" style= " position: relative; top:10px; width:80px; height:80px;"> X 
        <img src="https://www.hollys.co.kr/websrc/images/layout/logo_210302.gif" alt="HOLLYS COFFEE">
      </h1>
    </div>



    <table class="type11" id="bar">
      <thead>
        <div>
          <tr>
            <th class="th1" id="ord"><a href="order.do">주문내역</a></th>
            <th class="th2"><a href='creview.do'>리뷰</a></th>
          </tr>
        </div>
      </thead>
    </table>

    <p>
      <div class="box">
        <div id="tab">
          <ul id="category">
            <c:forEach items="${clist }" var="categoryVo">
              <li><a href="client_category.do?caseq=${categoryVo.caseq}">${categoryVo.cname}</a></li>
            </c:forEach>
          </ul>
        </div>
        <div class="menu" style="overflow-y: scroll; width:100%; height:690px;">
          <table>
            <tbody>
              <c:if test="${!empty mlist}">
                <c:forEach items="${mlist}" var="menuVo">
                  <tr>
                    <td>
                      <img src="${menuVo.MIMG}" width=50px height=50px>
                    </td>
                    <th>
                      <div onclick="menus(`${menuVo.MSEQ}`)" id="modal_menu">${menuVo.MNAME }</div>
                    </th>
                    <td>${menuVo.MPRICE}</td>
                    <c:forEach items="${clist}" var="categoryVo" >
                      <c:if test="${categoryVo.caseq == menuVo.CASEQ}">
                        <form action="basket_in" method="post">
                          <th>
                            <select id="bcount" name="bcount" >
                              <c:forEach var="i" begin="1" end="10">
                                <option value="${i}">${i}</option>
                              </c:forEach>
                            </select>
                          </th>
                          <input type="hidden" name="cname" id="cname" value="${categoryVo.cname}">
                          <input type="hidden" name="mname" id="mname" value="${menuVo.MNAME}">
                          <input type="hidden" name="mprice" id="mprice" value="${menuVo.MPRICE}">
                          <td>
                            <button class="button" type="submit">담기</button>
                          </td>
                        </form>
                      </c:if>
                    </c:forEach>
                  </tr>
                </c:forEach>
            </tbody>
              </c:if>
          </table>
        </div>
        <a href="basket.do" class="fixedBasket">
          <img class="btn_img" src="img/cartt.png" style="background:#f3e3cb; float:right; border-radius:50%;">
        </a>
      </div>
    </p>

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

          color: black;
          
      }
      #modal .title h2 {
          display: inline;
      }
    
      
      #modal .content {
          margin-top: 30px;
          color: black;
      }
        .fixedBasket {
          position: relative;
          background: #8a4baf;
          bottom: 8em;
          right: 4em;
          z-index: 10;
          border-radius:50%;
      }

    </style>



    <div id="modal" class="modal-overlay">
      <div class="modal-window">
        <div class="title">
          <h2>메뉴 상세정보</h2>
        </div>
        <div class="content"> 

        </div>
      </div>
    </div>

    <script>
      const modal = document.getElementById("modal")
      const btnModal = document.getElementById("modal_menu")
      function menus(sParms){
        mseqData={"mseq":sParms}
        modal.style.display='flex'
        $.ajax({
          url:"client_menu_click",
          type:"post",
          data:mseqData,
          success:function(data){
            for(let list of Object.keys(data)){
              var capital = data[list];
              var html = "";
              html+='<p><img src="'+capital.MIMG+'" alt="'+capital.MNAME+'"class="fl_l"width="250"height="200"></p>';
              html+='<h3>'+capital.MNAME+'</h3>';
              html+='<br>'+capital.MINTRO+'</br>';
            }
            $(".content").html(html);
          }
        })
      }

      window.onclick =(event)=>{
        if(event.target == modal){
          modal.style.display='none';
        }
      }
      $(function(){
        
        $('#category').slick({
          slide: 'li',   
          infinite : false,    
          slidesToShow : 6,      
          slidesToScroll : 1,      
          speed : 100,    
          arrows : true,       
          dots : false,    
          autoplay : true,      
          autoplaySpeed : 10000,       
          pauseOnHover : true,      
          vertical : false,   
          prevArrow : "<button type='button' class='slick-prev'>Previous</button>",
          nextArrow : "<button type='button' class='slick-next'>Next</button>",      
          dotsClass : "slick-dots", 
          draggable : true    
        });
        })
      /*
      $(function(){
        $('#category').slick({
          slide: 'li',	
          infinite : true, 	
          slidesToShow : 4,
          slidesToScroll : 1,		
          speed : 100,	 
          arrows : true, 		
          dots : false, 	
          autoplay : true,		
          autoplaySpeed : 10000, 		
          pauseOnHover : true,		
          vertical : false,	
          prevArrow : "<button type='button' class='slick-prev'>Previous</button>",
          nextArrow : "<button type='button' class='slick-next'>Next</button>",		
          dotsClass : "slick-dots", 
          draggable : true 	
        });
  		})*/

    </script>


  </body>
</html>