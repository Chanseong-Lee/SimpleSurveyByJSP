<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="survey.*" %>
<%@ page import="java.util.*" %>
<%
request.setCharacterEncoding("UTF-8");
SurveyDAO dao = SurveyDAO.getInstance();
String choice=request.getParameter("choice");
String insert=request.getParameter("insert");
boolean hasDub = dao.hasDub(insert);//중복값이 있으면 트루 없으면 폴스

if(choice!=null && insert.length()>0){//라디오와 텍스트가 동시에 들어왔을경우%>
	<script>
		alert("동시에 두값을 입력할수는 없습니다.");
		history.go(-1);
	</script>
<%
}else{
//radio는 선택값 없으면 null
	if(choice!=null){
		int result = dao.doVote(choice);
		response.sendRedirect("surveylist.jsp");
	}
//text타입은 안넣으면 ""빈칸
	if(!hasDub){
		if(insert.length()>0){
			dao.insertFood(insert);
			response.sendRedirect("surveylist.jsp");
		}
	}else{%>
	<script>
		alert("해당 메뉴가 존재합니다");
		history.go(-1);
	</script>
<%
	}
}
%>

