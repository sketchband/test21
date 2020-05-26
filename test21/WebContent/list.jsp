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
<table>
<tr>
<td><input type="button" value="글 작성" onclick="location.href='post.jsp'"></td>
</tr><br/>
<tr>
<td>번 호</td>
<td>제 목</td>
<td>작성자</td>
<td>작성일</td>
<td>조회수</td>
</tr>
<%
	vlist = dao.BoardList(keyWord, keyField, start, end);
	listSize = vlist.size();
	if(vlist.isEmpty()){
		out.println("등록 된 게시글이 없습니다.");
	}else{
		for(int i=0;i<pageRecords;i++){
			if(i==listSize) break;
		}
	}
%>
</table>
</div>
</body>
</html>