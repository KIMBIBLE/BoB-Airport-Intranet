<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name='viewport' content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>BoB Airport</title>
</head>
<style>
body{
	background-image:url('images/8.jpg');
	background-image:no-repeat;
	background-size: contain;
}
</style>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">BoB Airport</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인 페이지</a></li>
				<li class="active"><a href="intro.jsp">공항소개</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
				<li><a href="menu.jsp">이번달의 메뉴</a></li>
			</ul>
			<%
				if(userID == null){		
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class = "dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="ture"
						aria-expanded="false">접속하기<span class = "caret"></span></a>
					<ul class = "dropdown-menu">
						<li><a href = "login.jsp">로그인</a></li>
						<li><a href = "join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
			<%
				}else{
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class = "dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="ture"
						aria-expanded="false">회원관리<span class = "caret"></span></a>
					<ul class = "dropdown-menu">
						<li><a href = "logoutAction.jsp">로그아웃</a></li>
					</ul>
				</li>
			</ul>
			<%
				}
			%>
		</div>
	</nav>
	
	<div class = "container">
		<div class = "jumbotron">
			<div class = "container">
				<h1>BoB Airport</h1>
					<h2> 공항 소개 </h2>
					<img src = "images/vision.png" style = "width:100%;">
					<div>
						<h4>
							<li>BOB AIRPORT는 2007년 중국과 일본을 연결하는 허브공항을 목표로 개항하여 현재 중국 과 일본은 물론 나아가 동남아시아까지 연결하는 동아시아 허브공항으로 성장하였습니다.</li>
							</br></br>
							<li>2009년 고객만족도 1위를 시작으로 2011년 ‘한국항공상 서비스분야’ 1위 수상, 2013년 누적 여객 150만명 명을 돌파하며 고속 성장을 이뤄냈습니다.</li>
							</br></br>
							<li>이러한 빠른 성장 속에서 도 고객의 안전과 편의를 최고로 생각하며 10주년과 함께 '10년 무사고 운영'을 달성하 였습니다.</li> 
							</br></br>
							<li>앞으로도 BOB AIRPORT는 과거의 성과에 안주하지 않고 동아시아 중심 허브 공 항으로써 향후 글로벌 허브 공항으로써 발돋움 하고 있습니다.</li>	
						</h4>
						</br></br>
					</div>
					
					<h2> 연혁 </h2>
					<div>
						<h3> 2007 ~ 2012 </h3>
						<img src = "images/history1.png" style="width:100%;">
						<h3> 2013 ~ 2017 </h3>
						<img src = "images/history2.png" style="width:100%;">
					</div>
			</div>
		</div>
	</div>
	
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>