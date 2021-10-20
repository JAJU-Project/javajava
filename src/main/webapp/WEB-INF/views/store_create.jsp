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

<form name="store_create" action="store_create.do" method="post" enctype="multipart/form-data">
    <center>
        <table border=1>
             <tr>
                  <td colspan="2" align=center bgcolor="pink">
                  <b><font size=6>매장생성 페이지</font></b>
                  </td>
                  </tr>
                  <tr><td>매장이름 : </td><td><input type="text" name="sname"></td></tr>
                  <tr><td>매장소개 : </td><td><input type="text" name="sintro"></td></tr>
                  <tr><td>매장번호 : </td><td><input type="text" name="sphone"></td></tr>
                  <tr><td>매장이미지 :</td><td><input type='file' name='file'></td></tr>
                  <tr>
                  <td colspan="2" align=center>
                  <input type="submit" value="매장생성">
              </td>
            </tr>
        </table>
    </center>
</form>


</body>
</html>