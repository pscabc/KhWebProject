<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
		*{
			margin: 0;
			padding: 0;
		}
		.tab li{
			list-style: none;
			float: left;
			cursor : pointer;
			width: 300px;
			border: 1px solid #ddd;
			text-align: center;
			box-sizing: border-box;
			height: 80px;
			line-height: 80px;
		}
		.tab{
			background : #fff;
			overflow: hidden;
		}
		.on{
			background-color : #eee;
			color : red;
		}
		.tab_con{
			clear:both;
			margin-top: 5px;
			border : 1px solid #ddd;
		}
		.tab_con div{
			height : 500px;
			line-height: 100px;
			background-color : #fff;
			text-align : center;
			display:none;
		}
		.wrapper{
			width:700px;
			margin:0 auto;
		}
		.ulClass{
			width:60%;
		}
		
		
	</style>
	<script>
		$(function(){
			$(".tab>li").click(function(){
				var index = $(".tab>li").index(this);
				$(".tab>li").removeClass("on");
				$(this).addClass("on");
				var contents = $(".tab_con").children();
				contents.css("display","none");
				contents.eq(index).css("display","block");
			});
			$(".tab>li").first().click();
		})
	</script>
	<link rel="stylesheet" href="/css/member/login.css">
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<section>
	<div class="wrapper">
		<ul class="tab">
			<li>아이디찾기</li>
			<li>비밀번호찾기</li>

		</ul>
		<div class="tab_con">
			<div>
				<form action="/searchId" method="post" id="login-box">
					<h1>아이디찾기</h1>
					<ul class="ulClass">
						<li><label>이름</label></li>
						<li><input type="text" name="memberName" class="form-control"></li>
						<li><label>이메일</label></li>
						<li><input type="text" name="email" class="form-control"></li>
						<li id="btn-wrapper">
						<button type="submit" class="btn btn-outline-danger btn-lg">찾기</button>			
					</li>
					</ul>
				</form>
			</div>
			<div>
				<form action="/searchPw" method="post" id="login-box">
					<h1>비밀번호찾기</h1>
					<ul class="ulClass">
						<li><label>아이디</label></li>
						<li><input type="text" name="memberId" class="form-control"></li>
						<li><label>이름</label></li>
						<li><input type="text" name="memberName" class="form-control"></li>
						<li><label>이메일</label></li>
						<li><input type="text" name="email" class="form-control"></li>
						<li id="btn-wrapper">
						<button type="submit" class="btn btn-outline-danger btn-lg">찾기</button>			
					</li>
					</ul>
				</form>
			</div>
		</div>
	</div>
</section>

</body>
</html>