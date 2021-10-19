<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>




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

<body style="text-align: center">

  <script src="assets/js/jquery-1.10.2.js"></script>
  <script src="assets/js/bootstrap.min.js"></script>
  <script src="assets/materialize/js/materialize.min.js"></script>
  <script src="assets/js/jquery.metisMenu.js"></script> 
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.12.0.min.js" ></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
  <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

 

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
            <li style="text-align: center;" onclick="categoryclick('${categoryVo.cname}')">${categoryVo.cname}</li>
          </c:forEach>
        </ul>
      </div>

    <div class="menu" style=" width:100%; height:690px;">
      <div>
        <a href="basket.do">
          <button class="btn" id="btn" type="submit" style="position:fixed; right:600px; top:800px; width:10px; height:10px; ">
            <img class="btn_img" src="img/cartt.png">
          </button>
        </a>
      </div>
    </div>
     



<div id="modal" class="modal-overlay">
  <div class="modal-window">
    <div class="title">
      <h2>메뉴 상세정보</h2>
    </div>
    <div class="close-area">X</div>
    <div class="content"></div>
  </div>
</div>



<script>
  const modal = document.getElementById("modal")
  const btnModal = document.getElementById("modal_menu")
    function menus(data){
      console.log("data: "+data);
      var cnameDate = {"mseq":data};
      modal.style.display='flex'
      $.ajax({
        url:"client_menu_click",
        type:"get",
        data:cnameDate,
        success:function(data){
          console.log("data2:"+ data);
          for(let list of Object.keys(data)){
            var capital = data[list];
            var html = "";
            html+='<p><img src="'+capital.mimage+'" \
            class="fl_l"width="250"height="200"></p>';
           html+='<h3>'+capital.mname+'</h3>';
            html+='<br>'+capital.mintro+'</br>';
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

</script>

<script>
function categoryclick(cname){
    
      var cnameDate = {"cname":cname};
      
      $.ajax({
        url:"client_category_click",
        type:"get",
        data:cnameDate,
        success:function(data){
          var html = "";
          html +='<table>';
          html +='<thead>';
          html +='<tr>';
          html +='<th>이미지</th>';
          html +='<th>메뉴명</th>';
          html +='<th>가격</th>';
          html +='<th>수량</th>';
          html +='<th>장바구니 추가</th>';
          html +='</tr>';
          html +='</thead>';
                   
          for(let list of Object.keys(data)){

            var capital = data[list];
            console.log(data);
            console.log("capital.cname:",capital.cname);
            html +='<tbody>';
            html +='<tr>';
            html +='<td>이미지</td>';
            html +='<td><div onclick="menus(`'+capital.mseq+'`)" id="modal_menu">'+capital.mname+'</div></td>';
            html +='<td>'+capital.mprice+'</td>';                  
            html +='<form action="basket_in" method="post" id=plz name=plz>';
            html +='<td>';

            html +='<select id="'+capital.mseq+'" name="'+capital.mseq+'" >';
              for (var i = 1; i < 9; i++) {
                html +='<option value="'+i+'">'+i+'</option>';           
              }
            html +='</select>'
            
            html +='</td>';
            html +='<input type="hidden" name="cname" id="cname" value="'+capital.cname+'">';
            html +='<input type="hidden" name="mname" id="mname" value="'+capital.mname+'">';
            html +='<input type="hidden" name="mprice" id="mprice" value="'+capital.mprice+'">';
            html +='<td>';
            html +='<button class="button" type="submit" onclick=\
            "basketinsert(`'+capital.mname+'`,$(`#'+capital.mseq+'`).val(),`'+capital.cname+'`,`'+capital.mprice+'`)">담기</button>';
          
            html +='</td>';
            html +='</form>';            
            html +='</tr>';
            html +='</tbody>';
             
             //html +='<div class="menu" style=" width:100%; height:690px;">';
             html +='<div>';
             html +='<a href="basket.do">';
             html +='<button class="btn" id="btn" type="submit" style="position:fixed; right:600px; top:800px; width:10px; height:10px; ">';
             html +='<img class="btn_img" src="img/cartt.png">';
             html +='</button>';
             html +='</a>';
             html +='</div>';
             //html +='</div>';
          }
          
          
         
          
          html +='</table>';
         $(".menu").html(html);
        }
      })

    }
</script>

  <script>
  function basketinsert(mname,bcount,cname,mprice){
    var basketDate = {"mname":mname,
                      "bcount":bcount,"cname":cname,"mprice":mprice};
    $.ajax({
      url:"basket_in",
      type:"post",
      data:basketDate,
    })
    
  }
  </script>

</body>
</html>