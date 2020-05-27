<%@page import="test21.BoardDAO"%>
<%@page import="test21.BoardBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% 
	//String keyWord = "",keyField="";
	
	int pageRecords = 5;
	String pageNum = request.getParameter("pageNum");
	if(pageNum==null){
		pageNum = "1";
	}
	
	int nowPage = Integer.parseInt(pageNum);
	int startRow = (nowPage-1)*pageRecords+1;
	int endRow = pageRecords;
	int totalRecords = 0;
	
	BoardDAO dao = new BoardDAO();
	totalRecords = dao.getAllCount();
	Vector<BoardBean> vlist = null;
	int listSize = 0;
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
	vlist = dao.BoardList(startRow, endRow);
	listSize = vlist.size();
	if(vlist.isEmpty()){
		out.println("등록 된 게시글이 없습니다.");
	}else{
		for(int i=0;i<vlist.size();i++){
			//if(i==listSize) break;
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
<div align="center">

<p>
<%
	if(totalRecords>0){
		int pageCount = totalRecords/pageRecords + ((totalRecords%pageRecords == 0) ? 0 : 1);
		int startPage = ((nowPage-1)/10)*10+1;
		int block = 10;
		int endPage = startPage+block-1;
		
		if(endPage>pageCount) {
			endPage = pageCount;
			}
		
		if(startPage>10){
			%>
			<a href="list.jsp?pageNum=<%=startPage-10%>">[이전]</a>
			<%
			
		}
		
		for(int i =startPage;i<=endPage;i++){
		if(i==nowPage){
			%>[<%=i%>]<%}else{ %>
			
			<a href="list.jsp?pageNum=<%=i%>">[<%=i%>]</a>
<%			
			}
		}
		if(endPage<pageCount){
			%>
			<a href="list.jsp?pageNum=<%=startPage+10%>">[다음]</a>
			<%
		}
	}
%>
<br/><br/>
<%=totalRecords%>
</p>
</div>
</body>
</html>