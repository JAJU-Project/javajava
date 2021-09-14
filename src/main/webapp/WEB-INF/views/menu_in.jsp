<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<head>
    <title>Page Title</title>
</head>
<body style="text-align: center">
<h1>SpringBoot menu_in.jsp</h1>
<p>메뉴추가</p>
<c:if test="${empty list }">
				<tr>
				<td align="center" colspan="5">카테고리를 생성하고 오세요!</td>
				</tr>
</c:if>
	
	<form method="Post" action="menu_in.do" >
		<table board="1" width="500" height="500" allign="center">
		<tr>
			<td width="30%" colspan="2" align="center"><h2>메뉴 추가</h2></td>
		</tr>
			<tr>
				<th width="30%">메뉴이름</th>
				<td><input name = "mname" align="center" onkeydown="enterCheck(this)"></td>
			</tr>
			<tr>
				<th width="30%">메뉴가격</th>
				<td><input name = "mprice" align="center" onkeydown="enterCheck(this)"></td>
			</tr>
            <tr>
				<th width="30%">메뉴소개</th>
				<td><input name = "mintro" align="center" onkeydown="enterCheck(this)"></td>
			</tr>
            <tr>
				<th width="30%">메뉴이미지</th>
				<td><input name = "mimage" align="center" onkeydown="enterCheck(this)"></td>
			</tr>
            <tr>
				<th width="30%">품절여부</th>
				<td><input name = "msoldout" align="center" onkeydown="enterCheck(this)"></td>
			</tr>
			<tr>
				<th width="30%"><label for="category">카테고리</label>
				<select id="cname" name="cname" size="1">
					<option value="">선택하세요</option>
						<c:forEach items="${list }" var="CategoryVo">
							<option value="${CategoryVo.cname }">${CategoryVo.cname }</option>
						</c:forEach>
				</select></th>
			</tr>
		</table>
		
		<input type="submit" value="확인">
		
		</form>	
</body>
</html>