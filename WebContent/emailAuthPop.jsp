<%@ page contentType="text/html; charset=utf-8"%>
<%
	String email = request.getParameter("email") == null ? "" : request.getParameter("email");
%>
<!DOCTYPE html>
<html>
<head>
<title>이메일 인증</title>
<meta charset="utf-8">
<meta name="viewport"content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes, target-densitydpi=medium-dpi" />
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script type="text/javascript">
var authNum = "";
function send(){
		jQuery.ajax({
		url : "/emailAuthAjax"
		, type : "POST"
		, data : { "email" : "<%=email%>"}
		, dataType : "json"
		, success : function(data) {
				var resultCode = data.resultCode;
				if (resultCode != "0000") {
					alert("메일서버 연결실패");
				} else {
					authNum = data.authNum;
				}
			}
			,error : function() {
				alert("ajax 통신에러");
			}
		});
	}
	function check() {
		var form = document.authenform;
		if (authNum == "") {
			alert("먼저 인증번호를 전송해라");
			return false;
		} else if (!form.authnum.value) {
			alert("인증번호를 입력하세요.");
			return false;
		} else {
			if (form.authnum.value != authNum) {
				alert("틀린 인증번호임. 인증번호 다시입력해라");
				return false;
			} else {
				alert("인증완료");
				opener.authComplete();//emailTest.jsp에 authComplete호출
				self.close();//팝업 종료
			}
		}
	}
</script>
</head>
<body>
	<form name="authenform" method="post">
		<div class="payfin_area">
			<div class="top">인증번호 확인</div>
			<div class="conwrap">
				<div class="con">
					<div class="tabletypea">
						<table>
							<colgroup>
								<col width="30%" />
								<col width="*" />
							</colgroup>
							<tr>
								<th><span>인증번호 전송</span></th>
								<td><input type="button" value="전송" onClick="send();" /></td>
							</tr>
							<tr>
								<th><span>인증번호 입력</span></th>

								<td><input type="text" name="authnum" id="authnum" value="">
									<input type="button" value="확인" onClick="check();" /></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>
