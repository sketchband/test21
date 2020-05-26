<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="test21.BoardDAO"/>
<jsp:useBean id="bean" class="test21.BoardBean"/>
<jsp:setProperty property="*" name="bean"/>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String pw = request.getParameter("pw");
	int num = Integer.parseInt(request.getParameter("num"));
	
	%>
	
	<%if(pw.equals(dao.Check(num))){
		%>
		<script>
		location.href="deleteProc.jsp?num=<%=num%>";
		</script>
	<%}else{
		%>
		<script>
		alert("비밀번호가 틀렸습니다.");
		history.go(-1);
		</script>
	<%}%>
</body>
</html>