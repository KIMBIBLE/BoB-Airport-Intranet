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
				<li><a href="intro.jsp">공항소개</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
				<li class="active"><a href="menu.jsp">이번달의 메뉴</a></li>
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
				<h1 >금주의 식단표</h1>
					<div class="hRapper" style="margin-top:30px;">
   		 <div class="tableRapper_type1 tableRapper_type1_4">
       		 <table border= 1px text-align=center summary="일자별 식당의 중식과 석식 식단표 안내">
				<caption class="skip">
          		  식단표 안내</caption>
	            	<colgroup>
	            	    <col width="20%"><col><col>
	            </colgroup>
		
	    	        <thead>
	        	        <tr >
	            	        <th scope="col">일자</th>
	                	    <th scope="col">중식</th>
	                    	<th scope="col">석식</th>
	               	 </tr>
	       	     </thead>
	       	     <tbody>
	       	         <tr>
	       	             <th scope="row">08월07일(월)</th>
	       	             <td>
					                        쌀 밥/흑미밥/차조밥
								<br>
								손만두국
								<br>
								(돈육:국내산/두부:수입산대두)
								<br>
								돈육장조림
								<br>
								순대 &amp; 소금장
								<br>
								마늘쫑지
								<br>
								포기김치                             (배추,고춧가루:국내산)
								<br>
								양상추샐러드 &amp; 드레싱
                  		</td>
                    	<td>
                  				장터국
								<br>
								쌀 밥
								<br>
								닭찜
								<br>
								쫄면
								<br>
								다시마쌈 &amp; 초고추장
								<br>
								석박지
								<br>
								그린샐러드 &amp; 드레싱			
			            </td>
	                </tr>
       		        <tr>
       		        
                    <th scope="row">08월08일(화)</th>
                    <td>
                  				 쌀 밥/기장밥/흑미밥
								<br>
								근대국
								<br>
								순살닭갈비
								<br>
								어묵볶음
								<br>
								실곤약냉채
								<br>
								고추지
								<br>
								깍두기
								<br>
								양상추샐러드 &amp; 드레싱
                    </td>
                    <td>
						                  쌀 밥
								<br>
								김칫국
								<br>
								아귀콩나물찜(아귀:수입산)
								<br>
								브로콜리맛살볶음
								<br>
								두부숙회 &amp; 양념장
								<br>
								오복지
								<br>
								포기김치                             (배추,고춧가루:국내산)
								<br>
								그린샐러드 &amp; 드레싱
                    </td>
                </tr>             
                <tr>
                    <th scope="row">08월09일(수)</th>
                    <td>
						                  쌀 밥/흑미밥/수수밥
								<br>
								다시마무국
								<br>
								제육볶음
								<br>
								두부조림
								<br>
								숙주나물
								<br>
								깐마늘지
								<br>
								포기김치                             (배추,고춧가루:국내산)
								<br>
								마카로니샐러드
                    </td>
                    <td>
					                           쌀 밥
								<br>
								유부장국
								<br>
								꽁치한마리 &amp; 양념장
								<br>
								김치전(김치:중국산)
								<br>
								무말랭이
								<br>
								깍두기
								<br>
								그린샐러드 &amp; 드레싱
                    </td>
                </tr>
                <tr>
                    <th scope="row">08월10일(목)</th>
                    <td>
						                  쌀 밥/보리밥/흑미밥
								<br>
								시금치국
								<br>
								돈육볶음
								<br>
								카레소스
								<br>
								오이지무침
								<br>
								열무김치
								<br>
								양상추샐러드 &amp; 드레싱
                    </td>
                    <td>
					                           강된장비빔밥(쌀:국내산)
								<br>
								가쓰오장국
								<br>
								해물완자전
								<br>
								(돈육:국내산/오징어:국내산)
								<br>
								도시락김
								<br>
								단무지
								<br>
								포기김치                             (배추,고춧가루:국내산)
								<br>
								그린샐러드 &amp; 드레싱
                    </td>
                </tr>
                <tr>
                    <th scope="row">08월11일(금)</th>
                    <td>
					                          반계탕
								<br>
								찹쌀밥/쌀 밥
								<br>
								너비아니(돈육,닭:국내산)
								<br>
								도토리묵무침
								<br>
								오복지
								<br>
								석박지
								<br>
								푸실리샐러드
                    </td>
                    <td>
                       			 우묵냉국
								<br>
								쌀 밥
								<br>
								제육볶음
								<br>
								고구마맛탕
								<br>
								고구마순들깨무침
								<br>
								마늘쫑지
								<br>
								포기김치                             (배추,고춧가루:국내산)
								<br>
								그린샐러드 &amp; 드레싱
                    </td>
                </tr>
                <tr>
                    <th scope="row">08월12일(토)</th>
                    <td>
					                           쌀 밥
								<br>
								맑은순두부국
								<br>
								닭살채소볶음
								<br>
								떡튀김
								<br>
								콩나물무침
								<br>
								무장아찌
								<br>
								포기김치                             (배추,고춧가루:국내산)
								<br>
								양상추샐러드 &amp; 드레싱
                    </td>
                    <td>
					                           쌀 밥
								<br>
								열무국
								<br>
								돈까스 &amp; 브라운소스
								<br>
								(돈육:국내산)
								<br>
								콘버터볶음
								<br>
								콩자반
								<br>
								깍두기
								<br>
								그린샐러드 &amp; 드레싱
                    </td>
                </tr>
                <tr>
                    <th scope="row">08월13일(일)</th>
                    <td>
					                           쌀 밥
								<br>
								미역국
								<br>
								간장돈육불고기
								<br>
								분홍소시지전
								<br>
								무말랭이무침
								<br>
								열무김치
								<br>
								양상추샐러드 &amp; 드레싱
                    </td>
                    <td>
					                           쌀 밥
								<br>
								아욱국
								<br>
								치킨너겟(닭:국내산)
								<br>
								&amp; 허니머스타드소스
								<br>
								감자조림
								<br>
								오복지
								<br>
								깍두기
								<br>
								그린샐러드 &amp; 드레싱
                    </td>
                </tr>
				<tr>
                    <td colspan="3">
                    </td>
                </tr>
				<tr>
				<th scope="row">원산지</th>
				<td colspan="2" style="text-align: justify;">* 원산지 : 밥,죽,누룽지(쌀,현미,흑미,찹쌀:국내산), 소:수입산, 돈육:국내산, 닭:국내산, 동태:러시아산 
							<br>
							고등어:국내산, 낙지:수입산, 꽃게:수입산, 쥐어채:수입산, 콩비지,두부,순두부,연두부(대두:수입산) 
							<br>
							사골엑기스(소고기:호주산), 동태:러시아산, 꽃게:수입산 
							<br>
							* 그 외 원산지 표시대상 식재는 사용 시 개별표시 합니다. 
							<br>
							* 알레르기 포함식품 : 난류, 우유, 메밀, 땅콩, 대두, 밀, 고등어, 게, 새우, 돼지고기, 복숭아, 토마토, 
							<br>
							아황산류, 호두, 닭고기, 쇠고기, 오징어, 조개류(굴,전복,홍합포함) 
							<br>
							* 위 메뉴와 원산지는 식재 수급상황에 따라 변동 가능합니다. 
				</td>
			 </tr>
            </tbody>

        </table>	
		<table style="border: 1px solid #bbbbbb; width: 100%; margin-top: 30px;">
			<th style="width: 20%; height: 30px; border: 1px solid #bbbbbb; padding: 5px; text-align: center; color: #555555; font-size: 14px;">원산지</th>
			<td style="width: 80%; height: 30px; border: 1px solid #bbbbbb; padding: 5px; text-align: justify; color: #555555; font-size: 13px;">
				* 원산지 : 밥,죽,누룽지(쌀,현미,흑미,찹쌀:국내산), 소:수입산, 돈육:국내산, 닭:국내산, 동태:러시아산 
				<br>
				고등어:국내산, 낙지:수입산, 꽃게:수입산, 쥐어채:수입산, 콩비지,두부,순두부,연두부(대두:수입산) 
				<br>
				사골엑기스(소고기:호주산), 동태:러시아산, 꽃게:수입산 
				<br>
				* 그 외 원산지 표시대상 식재는 사용 시 개별표시 합니다. 
				<br>
				* 알레르기 포함식품 : 난류, 우유, 메밀, 땅콩, 대두, 밀, 고등어, 게, 새우, 돼지고기, 복숭아, 토마토, 
				<br>
				아황산류, 호두, 닭고기, 쇠고기, 오징어, 조개류(굴,전복,홍합포함) 
				<br>
				* 위 메뉴와 원산지는 식재 수급상황에 따라 변동 가능합니다. 
			</td>
		</table>
		</div>
</div>
				
				
			</div>
		</div>
	</div>
	
	
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>