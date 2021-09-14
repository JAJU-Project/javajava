<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<head>
    <title>Page Title</title>
</head>
<body style="text-align: center">
<h1>카테고리 추가</h1>
<p>카테고리추가</p>

<form name="sign_up" action="category_in.do" method="post">
    <center>
        <table border=1>
             <tr>
                  <td colspan="2" align=center bgcolor="pink">
                  <b><font size=6>카테고리 추가</font></b>
                  </td>
                  </tr>
                  <tr><td>카테고리명 : </td><td><input type="text" name="cname"></td></tr>
                  <tr>
                  <td colspan="2" align=center>
                  <input type="submit" value="카테고리추가">
              </td>
            </tr>
        </table>
    </center>
</form>


</body>
</html>