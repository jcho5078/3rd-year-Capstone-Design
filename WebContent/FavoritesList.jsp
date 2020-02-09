<%@page import="jsp.favorites.action.FavoritesDAO"%>
<%@page import="jsp.favorites.action.FavoritesVO"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

					<!-- 정말정말정말정말 비효율적으로 구현했기 때문에 나중에 재사용하려면 구성 다시 짜야함 -->

<style>
	a{
		border:0;
		color:#fff;
	}
	.sec{
		width:85%;
		margin:0 auto;
	}
	.list {
		display:inline-block;
		background-color:gray;
		color:#fff;
		padding:50px;
		margin:25px;
		text-align:center;
		cursor:pointer;
		opacity: 0.9;
		border-radius:5px;
	}
	.list:hover, .HT:hover, .CS:hover, .JA:hover{
		opacity: 1;
	}
	.HT {
		background-color: #3366cc!important;
		display:inline-block;
		color:#fff;
		padding:50px;
		margin:25px;
		text-align:center;
		cursor:pointer;
		opacity: 0.8;
		border-radius:5px;
	}
	.CS {
		background-color:#f44336!important;
		display:inline-block;
		color:#fff;
		padding:50px;
		margin:25px;
		text-align:center;
		cursor:pointer;
		opacity: 0.8;
		border-radius:5px;
	}
	.JA {
		background-color:#ff9900!important;
		display:inline-block;
		color:#fff;
		padding:50px;
		margin:25px;
		text-align:center;
		cursor:pointer;
		opacity: 0.8;
		border-radius:5px;
	}
</style>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");

	String session_id = session.getAttribute("sessionID").toString();

	FavoritesVO fvo = new FavoritesVO();
	fvo.setId(session_id);

	// 세션에 저장된 아이디를 가져와서
	// 그 아이디 해당하는 회원정보를 가져온다.
	FavoritesDAO fdao = FavoritesDAO.getInstance();


	FavoritesVO Fav = fdao.getListFavorites(session_id);
%>


	<!-- Section -->
	<section>
		<header class="major">
			<h2>즐겨찾기</h2>
		</header>
		<div class="sec">
		<%
			int Html_0 = Fav.getHtml_0();
			int Html_1 = Fav.getHtml_1();
			int Html_2 = Fav.getHtml_2();
			int Css_0 = Fav.getCss_0();
			int Css_1 = Fav.getCss_1();
			int Javascript_0= Fav.getJavascript_0();
			
			int arr[] = {Html_0, Html_1, Html_2, Css_0, Css_1, Javascript_0};
			String arr2[] ={"HTML 소개", "HTML 편집기", "HTML 기본", "CSS 소개", "CSS 구문", "JAVASCRIPT 소개"};
			String link[] = {"HTML","HTML","HTML","CSS","CSS","JAVASCRIPT"};
			String link2[] = {"Html_0", "Html_1", "Html_2", "Css_0", "Css_1", "Javascript_0"};
			
			int count = 0;
			
			for(int i=0; i<arr.length; i++){
				
				if(arr[i] != 0) {
					
					if(0<=i && i<=2){
		%>
						<a href="MainForm.do?contentPage=ContentView/<%=link[i] %>/<%=link2[i] %>.jsp"><div class="HT"><%=arr2[i] %></div></a>
		
		<%
					} 
					else if(3<=i && i<=4){
		%>
						<a href="MainForm.do?contentPage=ContentView/<%=link[i] %>/<%=link2[i] %>.jsp"><div class="CS"><%=arr2[i] %></div></a>
		<% 
					}
					else {
		%>
						<a href="MainForm.do?contentPage=ContentView/<%=link[i] %>/<%=link2[i] %>.jsp"><div class="JA"><%=arr2[i] %></div></a>
		<%
					}
				} 
				else if(arr[i] == 0){
					count++;
				}
			}
			if(count == arr.length){
		%>
				<p style="text-align:center;"><b><font size="4" color="gray">즐겨찾기가 없습니다.</font></b></p>
		<%
			}
		%>
		</div>
	</section>


	<!-- Scripts -->
	<script src="../../assets/js/jquery.min.js"></script>
	<script src="../../assets/js/browser.min.js"></script>
	<script src="../../assets/js/breakpoints.min.js"></script>
	<script src="../../assets/js/util.js"></script>
	<script src="../../assets/js/home.js"></script>

</body>
</html>