<%@page import="test21.BoardBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="dao" class="test21.BoardDAO"/>
<% 
	String keyWord = "",keyField="";
	int start = 0;
	int end = 10;
	Vector<BoardBean> vlist = null;
	int listSize = 0;
	int pageRecords = 10;
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<center><h2>게시판</h2></center>
<div align="center">
<table width="80%">
<tr>
<td></td><td></td><td></td><td></td>
<td align="right"><input type="button" value="글 작성" onclick="location.href='Post.jsp'"></td>
</tr><br/>
<tr bgcolor="green">
<td width="20%">번 호</td>
<td width="20%">제 목</td>
<td width="20%">작성자</td>
<td width="20%">작성일</td>
<td width="20%">조회수</td>
</tr>
<%
	vlist = dao.BoardList(keyWord, keyField, start, end);
	listSize = vlist.size();
	if(vlist.isEmpty()){
		out.println("등록 된 게시글이 없습니다.");
	}else{
		for(int i=0;i<pageRecords;i++){
			if(i==listSize) break;
			BoardBean bean = vlist.get(i);
			%>
			<tr>
			<td><%=bean.getNum() %></td>
			<td><a href="read.jsp?num=<%=bean.getNum()%>"><%=bean.getSubject() %></a></td>
			<td><%=bean.getName() %></td>
			<td><%=bean.getRegdate() %></td>
			<td><%=bean.getCount() %></td>
			</tr>
		<%} %>
	<%} %>
	<tr>
	<td colspan="3"><select name = "ketField" height="100">
	<option value="제목">제목
	<option value="작성자">작성자
	<option value="내용">내용	
	</select>
	<input name = "keyWord">
	<input type="button" value="검색" onclick="#">
	</td>
	</tr>
	
</table>
</div>
</body>
</html>