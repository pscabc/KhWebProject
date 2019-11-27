<%@page import="org.yeodam.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Member m = (Member)session.getAttribute("member");
	 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--반응형-->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding:400,700&display=swap&subset=korean" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
	<link rel="stylesheet" href="/css/bootstrap.css">
	<link rel="stylesheet" href="/css/header/style.css">
	<link rel="stylesheet" href="/css/header/responsive.css">
	<script type="text/javascript" src="/js/bootstrap.js"></script>
</head>
<style>
    @media (max-width: 1160px) {
        header {
            flex-direction: column;
        }
    }

    * {
    	font-family: 'Nanum Gothic Coding', monospace;
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    header {

        position: fixed;
        width: 100%;
        display: flex;
        justify-content: space-between;
        align-items: center;
        color: #ffffff;
        padding: 0px 50px 0;
        font-size: 22px;
        z-index: 50;
        background-color: black;
    }

    header img {
        width: 170px;
        height: 100px;
		
    }

    #header_nav {
        display: flex;
    }
    .header_a {
		
        text-decoration: none;
        color: #ffffff;
        cursor: pointer;

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
        width: 130px;
        margin-left: 10px;
        margin-right: 10px;
    }

    .header_li:hover {
		
        font-weight: bold;
        border-bottom: 1.5px solid #CE6D39;
        border-bottom-left-radius: 5px;
        border-bottom-right-radius: 5px;

    }
    .header_li:nth-child(1)>a{
        color: #F17F42;
    }
    .header_li:nth-child(5)>a{
        color: #F17F42;
    }
    .header_li>a{
        color: #ffffff;
    }
    
    .header_li:nth-child(4):hover {
		
        border-bottom: none;

    }

    .header_li:hover li {
        display:block;
        background-color: #000000;
        border-bottom: 1.5px solid #CE6D39;
        border-bottom-left-radius: 5px;
        border-bottom-right-radius: 5px;
    }

    .header_li:hover li>a {
        color: #ffffff;
        
    }

    .header_li2 {
        display:none;
    }
    .header_li2:hover .header_a{
    	color : #F17F42;
    }
    
    @media (max-width: 900px) {
       .header_li {
        line-height: 70px;
        height: 70px;
        width: 100px;
        font-size: 20px;
        margin-left: 10px;
        margin-right: 10px;
    }
    }
	 @media (max-width: 700px) {
       .header_li {
        line-height: 70px;
        height: 70px;
        width: 80px;
        font-size: 14px;
        margin-left: 3px;
        margin-right: 3px;
    }
    }
</style>

<body>
    <header>
        <span id="header_span"><a href="/index.jsp" class="header_a">
                <img src="../../../img/adminLogo.JPG"></a></span>
        <nav id="header_nav">
            <ul id="header_ul">
                <li class="header_li"><a href="/adminPhotoList" class="header_a">사진변경</a></li>
                <li class="header_li"><a href="/#" class="header_a">추천여행지</a></li>
                <li class="header_li"><a href="#" class="header_a">여행담기</a></li>
                <li class="header_li">
                    <a href="#" class="header_a">게시판</a>
                    <ul id="header_ul2">
                        <li class="header_li2"><a href="#" class="header_a">계획작성</a></li>
                        <li class="header_li2"><a href="#" class="header_a">리뷰작성</a></li>
                    </ul>
                </li>
                <li class="header_li"><a href="/adminMemberPage" class="header_a">회원관리</a></li>
                <li class="header_li"><a href="/logout"" class="header_a">로그아웃</a></li>
            </ul>
        </nav>
    </header>

</body>
</html>
