<%@page import="test21.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="test21.BoardDAO"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
   int num = Integer.parseInt(request.getParameter("num"));
   BoardBean bean = dao.BoardRead(num);
%>
<div align="center">
<table>
<tr>
<td>제목</td>
<td><%=bean.getSubject() %></td>
</tr>
<tr>
<td>작성자</td>
<td><%=bean.getName() %></td>
</tr>
<tr>
<td>작성일</td>
<td><%=bean.getRegdate() %></td>&nbsp;
<td>조회수</td>
<td><%=bean.getCount() %></td>
</tr>
<tr>
<td>내용</td>
<td><%=bean.getContent() %></td>
</tr>
<tr>
<td>
<input type="button" value="답글" onclick="location.href='reply.jsp?num=<%=bean.getNum()%>&ref=<%=bean.getRef()%>&pos=<%=bean.getPos()%>&depth=<%=bean.getDepth()%>'">
<input type="button" value="수정" onclick="location.href='Pw_check.jsp?num=<%=bean.getNum()%>'">
<input type="button" value="삭제" onclick="location.href='Delete_pw.jsp?num=<%=bean.getNum()%>'">
<input type="button" value="리스트" onclick="location.href='list.jsp'">
</table>
</div>
</body>
</html>