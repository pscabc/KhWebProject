<%@page import="org.yeodam.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 	<%
    	Member m = (Member)session.getAttribute("member");
	 %> --%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--반응형-->
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding:400,700&display=swap&subset=korean" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<link rel="stylesheet" href="/css/bootstrap.css">
	<link rel="stylesheet" href="/css/header/style.css">
	<link rel="stylesheet" href="/css/header/responsive.css">
	<script type="text/javascript" src="/js/bootstrap.js"></script>
    <title>YeoDam</title>
</head>
<style> 	
    @media (max-width: 950px) {
        header {
            flex-direction: column;
			
        }
    }

     * {
        font-family: 'Nanum Gothic Coding', monospace;
        box-sizing: border-box;
    }

    header {
        width: 100%;
        display: flex;
        justify-content: space-between;
        align-items: center;
        color: #000000;
        padding: 0px 20px 0;
        font-size: 22px;
        z-index: 50;
        background-color: #ffffff;
    }

    header img {
        width: 170px;
        height: 90px;

    }

    #header_nav {
        display: flex;
    }

    .header_a{
		color: black;
        text-decoration: none;
        cursor: pointer;
        font-size:0.8em;

    }

    #header_ul {
        display: flex;

    }

    #header_ul,
    #header_ul2 {
        list-style: none;
        text-align: center;
    }

    .header_li {
        line-height: 70px;
        height: 70px;
        width: 120px;
        margin-left: 10px;
        margin-right: 10px;
    }

    .header_li:hover {

        border-bottom: 1.5px solid #CE6D39;
        transition-duration: 0.2s;
        border-bottom-left-radius: 5px;
        border-bottom-right-radius: 5px;

    }

    .header_li:nth-child(3):hover {

        border-bottom: none;

    }

    .header_li:hover li {
        display : block;
        transition-duration: 0.3s;
        background-color: #ffffff;
        border-bottom: 1.5px solid #CE6D39;
        border-bottom-left-radius: 5px;
        border-bottom-right-radius: 5px;
        color: black;
    }

    .header_li:hover a{
    	
        color: black;
        font-weight:600;
    }

    .header_li2 {
        display : none;
     
    }
    .header_li2:hover .header_a{
    	color : #CE6D39;
    }
    @media (max-width: 1050px) {
    	.header_li {
        line-height: 70px;
        height: 70px;
        width: 100px;
        margin-left: 10px;
        margin-right: 10px;
        font-size : 19px;
    }
    }
    @media (max-width: 700px){
    	.header_li {
        line-height: 70px;
        height: 70px;
        width: 80px;
        margin-left: 1px;
        margin-right: 1px;
        font-size : 13px;
    }
    
</style>
<body>
    <header>
        <span id="header_span"><a href="index.jsp" class="header_a">
                <img src="/img/logo.PNG"></a></span>
        <nav id="header_nav">
            <ul id="header_ul">
            	<li class="header_li"><a href="/tourist" class="header_a">여행담기</a></li>
                <li class="header_li"><a href="/plan" class="header_a">계획짜기</a></li>
                <li class="header_li">
                    <a href="#" class="header_a">게시판</a>
                    <ul id="header_ul2">
                        <li class="header_li2"><a href="/tourist" class="header_a">계획작성</a></li>
                        <li class="header_li2"><a href="/plan" class="header_a">리뷰작성</a></li>
                    </ul>
                </li>
                <%-- <%if(m==null) {%> --%>
                <li class="header_li"><a href="/views/member/join.jsp" class="header_a">회원가입</a></li>
                <li class="header_li"><a href="/views/member/login.jsp" class="header_a">로그인</a></li>
            	<%-- <%}else {%> --%>
            	<%-- <li class="header_li"><a style="color:#CE6D39;"href="/mypage?memberId=<%=m.getMemberId()%>" class="header_a">마이페이지</a></li>
            	<li class="header_li"><a style="color:#CE6D39;"href="/planReview?memberId=<%=m.getMemberId()%>" class="header_a">여행기록</a></li> --%>
                <li class="header_li"><a href="/logout" class="header_a">로그아웃</a></li>
            	<%-- <%} %> --%>  
            </ul>
        </nav>
    </header>
    <!-- 헤더 끝!!!!-->
</body>
</html>