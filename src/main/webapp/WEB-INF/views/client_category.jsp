<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>


<!DOCTYPE html>
<html>
<meta charset="utf-8">
<head>
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
</style>
<body style="text-align: center">
  <div style="padding:30px;"> 
  <h1><img src="img/jaju1.png" class=jaju alt="jaju" style= " position: relative; top:10px; width:80px; height:80px;"> X 
    <img src="https://www.hollys.co.kr/websrc/images/layout/logo_210302.gif" alt="HOLLYS COFFEE">
 
  </h1>

</div>



  <table class="type11" id="bar">
    <thead>
      <div>
    <tr>
      <th class="th1" id="ord"><a href="basket.do">주문내역</a></th>
      <th class="th2"><a href='creview.do'>리뷰</a></th>
    </tr>
  </div>
    </thead>
  </table>

    <div class="box">
        <div id="tab">
          <ul style="display: flex; flex-direction: row;">
           <c:forEach items="${clist }" var="categoryVo">
            <li style="text-align: center;" onclick="selectcategort('${categoryVo.cname}')">${categoryVo.cname}</li>
            

            </c:forEach>
          </ul>
        </div>
        <div class="menu" style=" width:100%; height:690px;">


        <table>
          <thead>

          </thead>
          <tbody>
           <c:if test="${!empty mlist}">
            <c:forEach items="${mlist}" var="menuVo">
            <tr>
              <td>
                이미지
               </td>

              <th>
                <div onclick="menus()" id="modal_menu">${menuVo.mname }</div>
                
              </th>

              <td>${menuVo.mprice}</td>
                <c:forEach items="${clist}" var="categoryVo" >
                <c:if test="${categoryVo.cname == menuVo.cname}">
                  <form action="basket_in.do" method="post">
                        <th>
                            <select id="bcount" name="bcount" >
                                    <c:forEach var="i" begin="1" end="8">
                                        <option value="${i}">${i}</option>
                                    </c:forEach>
                            </select>
                        </th>
                        <input type="hidden" name="cname" id="cname" value="${categoryVo.cname}">
                        <input type="hidden" name="mname" id="mname" value="${menuVo.mname}">
                        <input type="hidden" name="mprice" id="mprice" value="${menuVo.mprice}">
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
          <div>
        <a href="basket.do">
        <button class="btn" id="btn" type="submit" style="position:fixed; right:600px; top:800px; width:10px; height:10px; ">
        <img class="btn_img" src="img/cartt.png">
        </button>
        </a>
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



<div id="modal" class="modal-overlay">
  <div class="modal-window">
      <div class="title">
          <h2>메뉴 상세정보</h2>
      </div>
      <div class="close-area">X</div>
      <div class="content">
         
         
        </div>
      </div>
  </div>
</div>
<script>
  const modal = document.getElementById("modal")
  const btnModal = document.getElementById("modal_menu")
    function menus(){
      modal.style.display='flex'
      $.ajax({
        success:function(data){
          var html = "";
         html+='<p><img src="https://admin.hollys.co.kr/upload/menu/etc/menuEtc_202104300914127400.png" alt="디카페인 아메리카노"class="fl_l"width="250"height="200"></p>';
         html+='<h3>디카페인 아메리카노</h3>';
         html+='<br>부드러운 풍미와 균형잡힌 바디감의 디카페인 아메리카노</br>';
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