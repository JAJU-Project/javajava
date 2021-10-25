<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<head>
    <title>자주해요</title>
</head>
<body style="text-align: center">
    <style>
        body{
            /*background-color:#f3e3cb*/
        }
        .img_ani{
          width: 100px; 
          height: 100px;
          position: relative;
          align-items: center;
          top: -65px;
          right: 100px;
          

        }
        .kakao{
         display: flex; 
         flex-direction: column;
         align-items: center;
        position: relative;
        top: 100px;
        }
    a{
      margin-top: 100px;
    }
    *{font-family: 'a옛날목욕탕L', Times, serif}

    #higuys {
        position: relative;
        top: 100px;
    }
    </style>
<div style="position: relative; left: 80px; top: 20px;"><h1>자리에서 주문해요</h1></div>
<img class="img_ani" src ="img/jaju.png"/>

<div id="higuys"><h4>환영합니다<p>자주해요 간편 주문 시스템입니다 !</h4></div>
<div class="kakao" >
<a href="https://kauth.kakao.com/oauth/authorize?client_id=abef0ed1e600be69e1e00be538e3cafb&redirect_uri=http://121.139.51.181:8000/rdu.do&response_type=code">
  <img  src="https://www.gb.go.kr/Main/Images/ko/member/certi_kakao_login.png" style="height:50px;width:auto;">
  </a>
</div>