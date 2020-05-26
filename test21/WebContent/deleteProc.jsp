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
int num = Integer.parseInt(request.getParameter("num"));	
dao.deleteProc(num);
%>
<script type="text/javascript">
location.href="list.jsp";
</script>
</body>
</html>