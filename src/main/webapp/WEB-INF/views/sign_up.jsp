<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<head>
    <title>Page Title</title>
</head>
<body style="text-align: center">
<h1>관리자 회원가입 페이지</h1>
<p>관리자 회원가입 페이지</p>

<form name="sign_up" action="sign_up.do" method="post">
    <center>
        <table border=1>
             <tr>
                  <td colspan="2" align=center bgcolor="pink">
                  <b><font size=6>회원가입</font></b>
                  </td>
                  </tr>
                  <tr><td>아이디 : </td><td><input type="text" name="maid"></td></tr>
                  <tr><td>이름 : </td><td><input type="text" name="maname"></td></tr>
                  <tr><td>비밀번호 : </td><td><input type="password" name="mapwd"></td></tr>
                  <tr><td>전화번호 : </td><td><input type="text" name="maphone"></td></tr>
                  <tr>
                  <td colspan="2" align=center>
                  <input type="submit" value="회원가입">
              </td>
            </tr>
        </table>
    </center>
</form>


</body>
</html>