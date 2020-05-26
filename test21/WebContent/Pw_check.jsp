<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bean" class="test21.BoardBean"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% int num = Integer.parseInt(request.getParameter("num"));%>
<center><h2>작성자 확인</h2></center>
<div align="center">
<form method="post" action="Pw_CheckProc.jsp">
<table>
<tr>
<td>비밀번호 확인</td>
</tr>
<tr>
<td><input name="pw" type="password">
	<input type="hidden" name="num" value="<%=num%>">  
</td>
</tr>
<tr><td>
<input type="submit" value="확인"><input type="button" value="취소" onclick="history.go(-1)">
</td>
</tr>
</table>
</form>
</div>
</body>
</html>