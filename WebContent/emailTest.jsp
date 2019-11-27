<%@ page contentType="text/html; charset=utf-8"%>

<!DOCTYPE html>

<html>

<head>

<title>이메일인증</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes, target-densitydpi=medium-dpi" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script type="text/javascript">
	function goAuthEmail() {
		var win = window.open("emailAuthPop.jsp?email="
				+ $("#email").val(), "PopupWin", "width=500,height=600");
	}
	function authComplete() {
		$("#authChk").html("인증완료");
	}
</script>
</head>
<body>
	<form name="userinput" method="post">
		<div class="payfin_area">
			<div class="top">이메일 인증 테스트</div>
			<div class="conwrap">
				<div class="con">
					<div class="tabletypea">
						<table>
							<colgroup>
								<col width="30%" />
								<col width="*" />
							</colgroup>
							<tr>
								<th><span>이메일</span></th>
								<td><input type="text" name="email" id="email"
									value="이메일주소를 입력하세요"> <input type="button"
									value="인증" onClick="goAuthEmail();" /> <span id="authChk"></span>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>

<%!%>
