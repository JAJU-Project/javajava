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
            background-color: wheat;
        }
        .img_ani{
          width: 200px; 
          height: 200px;

        }
        .kakao{
         display: flex; 
         flex-direction: column;
         align-items: center;
        }
    a{
      margin-top: 100px;
    }

    </style>
<h1>자리에서 주문해요~</h1>
<div class="kakao" >
<img class="img_ani" src ="img/jaju.png"/>
<a href="https://kauth.kakao.com/oauth/authorize?client_id=abef0ed1e600be69e1e00be538e3cafb&redirect_uri=http://69f0-115-91-81-106.ngrok.io/rdu.do&response_type=code">
  <img  src="https://www.gb.go.kr/Main/Images/ko/member/certi_kakao_login.png" style="height:50px;width:auto;">
  </a>
</div>