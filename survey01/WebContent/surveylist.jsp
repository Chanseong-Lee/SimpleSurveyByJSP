<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="survey.*" %>
<%@ page import="java.util.*" %>
<%
SurveyDAO dao = SurveyDAO.getInstance();
List<SurveyDTO> list = dao.showList(); 
int result = dao.countList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문결과</title>
<style type="text/css">
.header{
	text-align:center;
	background-color:#F2CB61;
	padding-top:40px;
	margin-left:auto;
	margin-right:auto;
	width:300px;
	height:150px;
	font-size: 18px;
}
.content{
	text-align:center;
	background-color:#FFE08C;
	padding-top: 20px;
	margin-left:auto;
	margin-right:auto;
	width:300px;
	height:400px;
	font-size: 25px;
}
.header h2{text-align: center;}
a:link{
	color:#934F00;
	text-decoration:none;
}
a:hover{
	text-decoration:underline;
	color:#934F00;
}
a:visited{
	color:#934F00;
	text-decoration:none;
}
.listtable{
	width:250px;
	margin:auto;
}
.listtable #title{
}
.listtable .subtitle{
	padding:10px;
}
</style>
</head>
<body>
<div class="header">
	<h2>오늘 뭐먹지?</h2>
	<a href="surveymain.jsp">메인으로</a>&nbsp;&nbsp;
	<a href="survey.jsp">설문하기</a>&nbsp;&nbsp;
	<a href="surveylist.jsp">결과보기</a>
</div>
<div class="content">
	<table class="listtable">
		<tr>
			<th colspan="2" id="title">설문결과 (<%=result %>)</th>
		</tr>
		<tr>
			<th class="subtitle">음식이름</th>
			<th class="subtitle">투표수</th>
		</tr>
		<%
		if(list.size()>0){
			for(SurveyDTO dto : list){%>
		<tr>
			<td><%=dto.getFoodName() %></td>
			<td><%=dto.getCountVote() %></td>
		</tr>
		<%	}
		}else{%>
		<tr>	
			<td colspan="2">데이터가 없습니다</td>
		</tr>
		<%} %>
	</table>
</div>
</body>
</html>