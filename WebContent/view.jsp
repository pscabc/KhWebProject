<%@page import="org.yeodam.admin.model.vo.AdminPhoto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.yeodam.admin.model.vo.AdminPageData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    ArrayList<AdminPhoto> list = (ArrayList<AdminPhoto>)request.getAttribute("list");
    /* Member member = (Member)session.getAttribute("member"); */
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WelCome to YeoDam</title>
</head>
	<!-- 스크롤바 없애기!! -->

	<style>	
	header{
        position: fixed;
	}
	::-webkit-scrollbar{
  		width:0.1px;
	} 	
	</style>
	<!--시작!!!!!!!!!!!!-->
	<style>
    .content1,.content3,.content5,.content6,.content7{
        display: flex;
        flex-direction: column;
        align-items: center;
        padding: 50px 100px;
    }
    .content1 {
        position: relative;
        justify-content: center;
        height: 100vh;
        color: #ffffff;

    }

    .content1_h1 {
        font-weight: lighter;
        font-size: 80px;
        text-decoration: underline #CE6D39;

    }

    .content1_img {
        position: absolute;
        width: 100vw;
        height: 100vh;
        background-repeat: no-repeat;
        background-position: center;
        background-size: cover;
        z-index: -1;
    }

    @media (max-width:850px) {
        .content1_h1 {
            font-size: 60px;
        }
    }


    @media (max-width:530px) {
        .content1_h1 {
            font-size: 50px;
        }
    }
</style>
<!--content1  끝!!-->

<!-- scroll down!!!! 시작! -->
<style>
        .scrollText {
            display: block;
            margin-top: 75px;
            margin-left: -40px;
            position: relative;
            top: 180px;
            font-family: "Helvetica Neue", "Helvetica", Arial, sans-serif;
            font-size: 15px;
			font-weight : bold;
            color: white;
            text-transform: uppercase;
            white-space: nowrap;
            opacity: 0.1;
            animation: pulse 1s linear alternate infinite;
        }
        .scrolldown3d {
 			 position: relative;
			 width: 24px;
	 		 height: 24px;
	 		
		}

		.chevron {
			  position: absolute;
			  width: 28px;
			  height: 8px;
			  bottom : 100px;
			  opacity: 0;
			  transform: scale3d(0.5, 0.5, 0.5);
			  animation: move 3s ease-out infinite;
			} 
			.chevron:first-child {
			  animation: move 3s ease-out 1s infinite;
			}
			
			.chevron:nth-child(2) {
			  animation: move 3s ease-out 2s infinite;
			}
			
			.chevron:before,
			.chevron:after {
			  content: ' ';
			  position: absolute;
			  top: 0;
			  height: 100%;
			  width: 51%;
			  background: #fff;
			}
			
			.chevron:before {
			  left: 0;
			  transform: skew(0deg, 30deg);
			}
			
			.chevron:after {
			  right: 0;
			  width: 50%;
			  transform: skew(0deg, -30deg);
			}

			@keyframes move {
			  25% {
			    opacity: 1;
			
			  }
			  33% {
			    opacity: 1;
			    transform: translateY(30px);
			  }
			  67% {
			    opacity: 1;
			    transform: translateY(40px);
			  }
			  100% {
			    opacity: 0;
			    transform: translateY(55px) scale3d(0.5, 0.5, 0.5);
			  }
			}

	        @keyframes pulse {
    	        to {
        	        opacity: 1;
           		 }
            
        		}

</style>

      <!-- content3시작 -->
    <style> 
     .content3 {

            align-content: center;
            height: 100vh;
            background-color: #fafafa;

        }

        .content3 img {
            border-radius: 50%;
            position: relative;
            margin-right: 15px;
            margin-left: 15px;
            transition-duration: 0.4s;
        }

        .content3 img:hover {
            border-radius: 40%;
            transform: scale(1.5);
        }

        .content3_h1 {
            font-weight: lighter;
            position: relative;
            right: 400px;
            top: 200px;
            color: #000000;
            font-size: 70px;
            text-decoration: underline #f7f2f2
        }

        @media(max-width: 1100px) {
            .content3_h1 {
                font-size: 50px;
            }
        }

        @media(max-width: 1250px) {
            .content3 img{
                width: 130px;
                height: 130px;
                left: 0;
                top: 50px;
            }
            .content3_h1 {
                font-size: 50px;
                left: 0;
                right: 0;
                top: 0;
                bottom: 0;
            }
        }

        @media(max-width: 1100px) {
            .content3 img {
                width: 80px;
                height: 80px;
            }
            .content3_h1 {
                font-size: 40px;
            }
            
        }

        @media(max-width: 810px) {
            .content3 img {
                width: 50px;
                height: 50px;
            }

            .content3_h1 {
                font-size: 30px;
            }
            
        }


        .admin_photo_list1 {
            left: 300px;
            bottom: 130px;
            width: 150px;
            height: 150px;
        }

        .admin_photo_list2 {
            left: 300px;
            bottom: 150px;
            width: 180px;
            height: 180px;

        }
        .admin_photo_list3 {
            left: 300px;
            bottom: 150px;
            width: 150px;
            height: 150px;
        }

        .admin_photo_list4 {
            left: 300px;
            bottom: 120px;
            width: 150px;
            height: 150px;
        }

        .admin_photo_list5 {
            left: 300px;
            bottom: 100px;
            width: 130px;
            height: 130px;
        }

        .admin_photo_list6 {
            left: 300px;
            bottom: 100px;
            width: 180px;
            height: 180px;
        }

        .admin_photo_list7 {
            left: 300px;
            width: 150px;
            height: 150px;
            bottom: 150px;
        }

        .admin_photo_list8 {
            left: 300px;
            width: 150px;
            height: 150px;
            bottom: 120px;
        }

        .admin_photo_list9 {
            left: 300px;
            bottom: 80px;
            width: 150px;
            height: 150px;
        }

        .admin_photo_list10 {
            left: 300px;
            bottom: 100px;
            width: 100px;
            height: 100px;
        }

        .admin_photo_list11 {
            left: 300px;
            bottom: 100px;
            width: 140px;
            height: 140px;
        }

        .admin_photo_list12 {
            left: 300px;
            bottom: 150px;
            width: 170px;
            height: 170px;
        }
    </style>
    <!-- content4 시작 -->
    <style>
        .content4 {
         	display: flex;
         	flex-direction: column;
     		align-items: center;
       		padding: 50px 100px;
            align-content: center;
            height: 100vh;
            background-color: #f2f2f2;
        }

        #content4_h1 {
            font-weight: lighter;
            position: relative;
            right: 230px;
            top: 200px;
            color: #000000;
            font-size: 70px;
            text-decoration: underline #fcf8ed;
        }
        #content4_h4{
            position: relative;
            right: 220px;
            top: 220px;
            color: #454242;
        }
        
        #tripput {
            width: 400px;
            height: 500px;
            bottom: 140px;
            position: relative;
            left: 270px;
            border-radius : 10%;
            z-index: 3;
        }

        #tripput2 {
            width: 400px;
            height: 500px;
            bottom: 205px;
            position: relative;
            border-radius : 10%;
            left: 230px;
        }
	 @media(max-width: 1300px) {
	 	#content4_h1 {
            font-weight: lighter;
            color: #000000;
            position : relative;
            left : 100px;
            font-size: 40px;
            text-decoration: underline #fcf8ed;
            top : 10px;
            font-size : 30px;
        }
        #tripput {
        	position : relative;
        	left : 30px;
            width: 250px;
            height: 400px;
            border-radius : 10%;
            top : 30px;
        }
        #tripput2 {
      	    position : relative;
        	left : 30px;
            width: 250px;
            height: 400px;
            border-radius : 10%;
            top : 30px;
        }
        #content4_h4{
        	position : relative;
            color: #454242;
            left : 100px;
            top : 10px;
            font-size : 14px;
        }
	 }
    </style>
    <!-- content5 시작 -->
    <style>
        .content5 {
            align-content: center;
            height: 100vh;
            background-color: #fafafa;
        }
        #content5_h1 {
            font-weight: lighter;
            text-align: center;
            position: relative;
            top : 20px;
            color: #000000;
            font-size: 50px;
            text-decoration: underline #f7f2f2
        }
        #content5_h4{
            position: relative;
            top : 20px;
            text-align: center;
            color: #454242;
        }
        
        #fast {
            align-content: center;
            border: 1px solid black;
            width: 850px;
            height: 450px;
            position: relative;
            top : 30px;
            border-radius: 10%;
        }
		 @media(max-width: 650px) {
		 	#content5_h1 {
            font-weight: lighter;
            text-align: center;
            position: relative;
            top : 20px;
            color: #000000;
            font-size: 30px;
            text-decoration: underline #f7f2f2
        }
       }
      
    </style>
    <!-- 풋터시작 -->
    <style>
    footer {
        
          bottom: 0;
          width: 100%;
          /* Set the fixed height of the footer here */
          height: 340px;
          background-color: #001c1f
        }
    footer>.container {
          padding-right: 15px;
          padding-left: 15px;
        }
    footer {
            color: #fff;
        }

    footer h3 {
            margin-bottom: 30px;
        }

    footer .footer-above {
            padding-top: 50px;
            background-color: #001c1f
        }

    footer .footer-col {
            margin-bottom: 50px;
        }

    footer .footer-below {
            padding: 25px 0;
            background-color: #001c1f
        }
    #yeodam{
    	color : #F17F42;
        }
    .logo{
        height: 30px;
        margin-bottom: 10px;
    }
    
</style>

<body>
	<%-- <%if(member!=null&&member.getMemberName().equals("관리자")){%> --%>
		<%-- <%@include file="/WEB-INF/views/common/adminHeader.jsp" %> --%>
	<%-- <%}else{%> --%>
		<%@include file="/WEB-INF/views/common/header.jsp" %>
	<%-- <%}%> --%>
		
	<section class="content1">
        <div class="content1_img" style="background-image: url(../../../img/content1.jpg);"></div>
        <h1 class="content1_h1">담아봐!</h1>
        <h1 class="content1_h1">너의 여행을</h1>
        <h2 class="content1_h2">Put your trip!</h2>
        <div class="Scrolldown3d">
            <div class="chevron"></div>
            <div class="chevron"></div>
            <div class="chevron"></div>
            <span class="scrollText">Scroll down</span>
        </div>
    </section>
  	<section class="content3">
        <h1 class="content3_h1">어디를<br>담으실래요?</h1>
        <%if(list.size() < 12){%>
       		<div>
	            <img src="/upload/adminPhoto/" alt="추천1" class="admin_photo_list1" class="admin_photo_list1">
	            <img src="/upload/adminPhoto/" alt="추천2" class="admin_photo_list2" class="admin_photo_list2">
	            <img src="/upload/adminPhoto/" alt="추천3" class="admin_photo_list3" class="admin_photo_list3">
	        </div>
	        <div>
	            <img src="/upload/adminPhoto/" alt="추천4" class="admin_photo_list4" class="admin_photo_list4">
	            <img src="/upload/adminPhoto/" alt="추천5" class="admin_photo_list5" class="admin_photo_list5">
	            <img src="/upload/adminPhoto/" alt="추천6" class="admin_photo_list6" class="admin_photo_list6">
	            <img src="/upload/adminPhoto/" alt="추천7" class="admin_photo_list7" class="admin_photo_list7">
	        </div>
	        <div>
	            <img src="/upload/adminPhoto/" alt="추천8" class="admin_photo_list8" class="admin_photo_list8">
	            <img src="/upload/adminPhoto/" alt="추천9" class="admin_photo_list9" class="admin_photo_list9">
	            <img src="/upload/adminPhoto/" alt="추천10" class="admin_photo_list10" class="admin_photo_list10">
	            <img src="/upload/adminPhoto/" alt="추천11" class="admin_photo_list11" class="admin_photo_list11">
	            <img src="/upload/adminPhoto/" alt="추천12" class="admin_photo_list12" class="admin_photo_list12">
	        </div>
        <%}else{ %>
       		 <div>
	            <img src="/upload/adminPhoto/<%=list.get(0).getAdminFilename() %>" alt="추천1" class="admin_photo_list1">
	            <img src="/upload/adminPhoto/<%=list.get(1).getAdminFilename() %>" alt="추천2" class="admin_photo_list2">
	            <img src="/upload/adminPhoto/<%=list.get(2).getAdminFilename() %>" alt="추천3" class="admin_photo_list3">
	        </div>
	        <div>
	            <img src="/upload/adminPhoto/<%=list.get(3).getAdminFilename() %>" alt="추천4" class="admin_photo_list4">
	            <img src="/upload/adminPhoto/<%=list.get(4).getAdminFilename() %>" alt="추천5" class="admin_photo_list5">
	            <img src="/upload/adminPhoto/<%=list.get(5).getAdminFilename() %>" alt="추천6" class="admin_photo_list6">
	            <img src="/upload/adminPhoto/<%=list.get(6).getAdminFilename() %>" alt="추천7" class="admin_photo_list7">
	        </div>
	        <div>
	            <img src="/upload/adminPhoto/<%=list.get(7).getAdminFilename() %>" alt="추천8" class="admin_photo_list8">
	            <img src="/upload/adminPhoto/<%=list.get(8).getAdminFilename() %>" alt="추천9" class="admin_photo_list9">
	            <img src="/upload/adminPhoto/<%=list.get(9).getAdminFilename() %>" alt="추천10" class="admin_photo_list10">
	            <img src="/upload/adminPhoto/<%=list.get(10).getAdminFilename() %>" alt="추천11" class="admin_photo_list11">
	            <img src="/upload/adminPhoto/<%=list.get(11).getAdminFilename() %>" alt="추천12" class="admin_photo_list12">
	        </div>   
        <%} %>
    </section>
    <section class="content4">
        <div>
            <h1 id="content4_h1">여행을<br>쇼핑 처럼</h1>
            <h4 id=content4_h4>준비까지 즐거워지는 일정짜기</h4>
            <img src="img/tripput.JPG" id="tripput">
            <img src="img/tripput2.JPG" id="tripput2">
        </div>
    </section>
    <section class="content5">
        <div>
            <h1 id="content5_h1">어디를 향하든<br>최적의 길로</h1>
            <h4 id=content5_h4>최단거리를 계산해주는 일정짜기</h4>
            <img src="img/fast.JPG" id="fast">
        </div>
    </section>
    <section class="content6">
    	<div>
    	
    	</div>
    </section>
    <section class="content7">
    	<div>
    	
    	</div>
    </section>
 	
  <footer class="text-center">
    <div class="footer-above">
        <div class="container">
            <div class="row">
                <div class="footer-col col-md-4">
                    <h3>위치</h3>
                    <p>서울특별시 영등포구 선유동2로 57<br>이레빌딩 19F , 20F</p>
                </div>
                <div class="footer-col col-md-4">
                    <h3>Social Media</h3>
                    <ul class="list-inline">
                        <li><a href="#">
                        <img class="logo" src="https://cdn2.iconfinder.com/data/icons/black-white-social-media/32/online_social_media_facebook-128.png"></a>
                        </li>
                        <li><a href="#">
                        <img class="logo" src="https://cdn2.iconfinder.com/data/icons/black-white-social-media/32/twitter_online_social_media-128.png"></a>
                        </li>
                        <li><a href="#">
                            <img class="logo" src="https://cdn2.iconfinder.com/data/icons/black-white-social-media/32/instagram_online_social_media_photo-128.png"></a>
                        </li>    
                        <li>
                        <a href="#">
                            <img class="logo" src="https://cdn2.iconfinder.com/data/icons/black-white-social-media/32/online_social_media_google_plus-128.png"></a>
                        </li>
                    </ul>
                </div>
                <div class="footer-col col-md-4">
                    <h3>㈜여행을담다</h3>
                    <p><a href="../views/privacy/guide.html">이용약관</a></p>
                    <p><a href="../views/privacy/privacy.html">개인정보방침</a></p>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-below">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    Copyright &copy; 2019. <span id="yeodam">YeoDam</span>
                </div>
            </div>
        </div>
    </div>
</footer>

</body>
</html>