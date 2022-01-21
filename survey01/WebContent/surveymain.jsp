<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
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
	<p>오늘 뭐먹을지 정하세요</p>
</div>
</body>
</html>