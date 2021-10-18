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
            background-color: yellow;
        }
    

    </style>
<h1>자리에서 주문해요~</h1>
<img class="img_ani" src ="img/커피6.png" style="width: 200px; height: 200px;"/>

<form name="loginInfo" method="post" action="login.do">
               
        
           <div class="login">     
            <div class="id"> 
            <input placeholder="ID" type="text" name="maid" maxlength="50"></td>  
            </div>
            <div class="password"> 
            <input placeholder="PASSWORD" type="password" name="mapwd" maxlength="50"></td>
            </div>
           </div>
            <input type="submit" value="로그인"/>
        </form>


</body>
</html>