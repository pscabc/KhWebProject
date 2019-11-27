<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/member/login.css">
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<style>
	#wrap{
		margin-top:150px;
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div id="wrap">
		<form action="/login" method="post" id="login-box">
			<h1>로그인</h1>
			<ul>
				<li><label for="memberId">아이디</label></li>
				<li><input type="text" name="memberId" id="memberId"
					class="form-control"></li>
				<br>
				<li><label for="memberPw">비밀번호</label></li>
				<li><input type="password" name="memberPw" id="memberPw"
					class="form-control"></li>
				<br>
				<li id="btn-wrapper"><br>
					<button type="submit" class="btn btn-primary col-xs-1">로그인</button>
					<button type="reset" class="btn btn-primary col-xs-2">초기화</button>
					<a id="kakao-login-btn"></a> <script type='text/javascript'>
						// 사용할 앱의 JavaScript 키를 설정해 주세요.
						Kakao.init('2c58a95d48128e322b8ea3db210bbc8d');
						// 카카오 로그인 버튼을 생성합니다.
						Kakao.Auth
								.createLoginButton({
									container : '#kakao-login-btn',
									success : function(authObj) {
										alert(JSON.stringify(authObj));
									},
									fail : function(err) {
										alert(JSON.stringify(err));

										var kakaonickname = res.properties.nickname; //카카오톡 닉네임을 변수에 저장 (닉네임 값을 다른페이지로 넘겨 출력하기 위해서)

										window.location
												.replace("http://"
														+ window.location.hostname
														+ ((location.port == "" || location.port == undefined) ? ""
																: ":"
																		+ location.port)
														+ "/hansub_project/home?kakaonickname="
														+ kakaonickname);
										//로그인 결과 페이지로 닉네임 값을 넘겨서 출력시킨다.,
									}
								});
					</script> <br>
				<br> <a href="/views/member/searchIdPw.jsp">아이디/비밀번호 찾기</a></li>
			</ul>
		</form>
	</div>
</body>
</html>