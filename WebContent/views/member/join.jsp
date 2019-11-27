<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script language="javascript" src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>

<title>회원가입 페이지</title>
</head>
<body>
<style>
	#container{
		padding-top:100px;
		margin: 0 auto; 
		width: 800px; 
		color: black; 
		text-align: center;
	}
</style>
	<%@  include file="/WEB-INF/views/common/header.jsp"%>
	<div id="container">
		<form name="checkIdFrm">
			<input type="hidden" name="checkId">
		</form>
		<form action="/join" method="post" id="memberJoin">
			<h1>회원가입</h1>
			<table class="table">
				<tr>
					<th><label for="memberId">아이디</label></th>
					<td colspan="4"><input type="text" name="memberId" id="memberId"
						class="form-control">
					<td style="width: 150px"><span id="chkMsg"></span></td>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th><label for="memberPw">비밀번호</label></th>
					<td colspan="5"><input type="password" name="memberPw" id="memberPw"
						class="form-control"></td>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th colspan="1"><label for="pwchk">비밀번호<br>확인</label></th>
					<td colspan="5"><input type="password" id="pwchk" class="form-control"></td>
					<td colspan="2"></td>
					<!-- 비밀번호 확인은 데이터 넘겨줄 필요없어서 네임 속성 안씀  -->
				</tr>
				<tr>
					<th><label for="memberName">이름</label></th>
					<td colspan="5"><input type="text" name="memberName" id="memberName" class="form-control"></td>
					<td colspan="2"></td>
					
				</tr>
				<tr>
					<th><label for="memberAge">나이</label></th>
					<td colspan="5"><input type="text" name="memberAge" id="memberAge"
						class="form-control"></td>
					<td colspan="2"></td>
				
				</tr>
				<tr>
					<th><label for="phone">연락처<br>(-포함)</label></th>
					<td colspan="5"><input type="text" name="phone" id="phone"
						class="form-control"></td>
					<td colspan="2"></td>
				
				</tr>
				<tr>
					<th><label for="email">이메일</label></th>
					<td><input type="text" name="email1" id="email1" class="form-control"> 
					<input type="hidden" name="email" id="email" class="form-control">
					</td>
					<td>@
					<td><input type="text" name="email2" id="email2" type="text"
						 class="form-control"></td>
					<td colspan="2"><select name="selectemail" onchange="selectEmail(this);"
						class="form-control">
							<option value="1">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="nate.com">nate.com</option>
							<option value="gmail.com">gmail.com</option>
					</select></td>
					<td><input type="button" value="인증" onclick="goAuthEmail();" class="btn btn-primary col-xs-6" /><span
						id="authChk"></span></td>
				</tr>
				<tr>
					<th><label for="gender">성별</label></th>
					<td colspan="5">
						<div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-danger"> <input type="radio"
								name="gender" id="gender" value="남"> 남자
							</label> <label class="btn btn-danger"> <input type="radio"
								name="gender" id="gender" value="여"> 여자
							</label>
						</div>
					</td>
				</tr>
				<tr>
					<th><label for="intro">소개글</label></th>
					<td colspan="5"><input type="text" name="intro" id="intro"
						class="form-control"></td>
					<td colspan="2"></td>
				</tr>
			</table>
			<hr>
			<div id="btn-box">
				<button type="submit" class="btn btn-primary col-xs-6">회원가입</button>
				<button type="reset" class="btn btn-primary col-xs-6">초기화</button>
			</div>
		</form>
	</div>
	<script>
		$("#memberId").keyup(function() { //keyup 치면서 바로나옴,change 다썻을때 나옴	   
			var memberId = $("#memberId").val();
			$.ajax({
				url : "/ajaxCheckId",
				type : "get",
				data : {
					memberId : memberId
				},
				success : function(data) {
					var msg = $("#chkMsg");
					if (data == '1') {
						msg.html('사용가능');
						msg.css('color', 'green');
					} else {
						msg.html('사용중');
						msg.css('color', 'red');
					}
				},
				error : function() {
					console.log("아이디 중복체크 실패");
				}

			});
		});
		function selectEmail(ele) {
			var $ele = $(ele);
			var $email2 = $('input[name=email2]');
			// '1'인 경우 직접입력 
			if ($ele.val() == "1") {
				$email2.attr('readonly', false);
				$email2.val('');
			} else {
				$email2.attr('readonly', true);
				$email2.val($ele.val());
			}
		}

		function checkId() {
			var memberId = document.getElementById("memberId").value;
			if (memberId == "") {
				alert("아이디를 입력해주세요.");
				return;
			}
			var url = "/checkId";//요청서블릿url
			var title = "checkId";
			var status = "left=500px, top=100px, width=300px, height=200px, menubar=no,status=no,scrollbar=yes";
			var popup = window.open("", title, status);//빈창 오픈
			checkIdFrm.checkId.value = memberId; //input hidden 에 값 설정
			checkIdFrm.target = title; //popup창과 form태그를 연결
			//action, method 설정 후 form태그 submit
			checkIdFrm.action = url;
			checkIdFrm.method = "post";
			checkIdFrm.submit();
		}
		function goAuthEmail(){
			if (nvl($("#email1").val(), "") == ""
					|| nvl($("#email2").val(), "") == "") {
				alert("이메일을 입력해주세요.");
				return false;
			} else {
				$("#email").val($("#email1").val() + "@" + $("#email2").val());
			}
			var win = window.open("/emailAuthPop.jsp?email="
					+ $("#email").val(), "PopupWin", "width=400,height=150");
		}
		function nvl(str, defaultVal) {
			var defaultValue = "";

			if (typeof defaultVal != 'undefined') {
				defaultValue = defaultVal;
			}
			if (typeof str == "undefined" || str == null || str == ''
					|| str == "undefined") {
				return defaultValue;
			} else {
				return str;
			}
		}
		
		function authComplete() {
			$("#authChk").html("<br>인증완료");
		}
	</script>
	
	

</body>
</html>