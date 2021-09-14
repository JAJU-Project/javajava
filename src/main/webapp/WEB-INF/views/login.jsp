<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<head>
    <title>Page Title</title>
</head>
<body style="text-align: center">
<h1>SpringBoot Index.jsp</h1>
<p>jsp의 위치는 wabapp/WEB-INF/views 에요</p>

<form name="loginInfo" method="post" action="login.do">
               
            <table>
                <tr>
                    <td bgcolor="skyblue">아이디</td>
                    <td><input type="text" name="maid" maxlength="50"></td>
                </tr>
                <tr>
                    <td bgcolor="skyblue">비밀번호123</td>
                    <td><input type="password" name="mapwd" maxlength="50"></td>
                </tr>
            </table>
            <br>
            <input type="submit" value="로그인"/>
        </form>


</body>
</html>
