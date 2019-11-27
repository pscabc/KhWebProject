<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	//결과, id
    	boolean result = (Boolean)request.getAttribute("result");
  		String checkId = (String)request.getAttribute("checkId");  
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#checked-container{
		text-align : center;
		padding-top : 50px;
	}
	#checked{
		color: red;
		font-weight: bold;
	}
</style>
</head>
<body>
	<div id="checked-container">
		<%if(result){ %>
			[<span><%=checkId %></span>]는 사용이 가능합니다.
			<br><br>
			<button type="button" onclick="setMemberId('<%=checkId %>');">닫기</button>
		
		<%}else{ %>
			[<span id="checked"><%=checkId %></span>] 는 이미 사용중입니다.
			<br><br>
			<form action="checkId" method="post">
				<input type="text" name="checkId" placeholder="아이디를 입력하세요"><br>
				<button type="submit">중복검사</button>
			</form>
		<%} %>
	</div>
	<script>
		function setMemberId(memberId){
			//opener: 뒤에잇는창(이 창을 오픈한 창)
			var id = opener.document.getElementById("memberId");
			var pw = opener.document.getElementById("memberPw");
			id.value=memberId;//부모창ID input에 값 세팅
			pw.focus;	//비밀번호 입력창으로 focus
			self.close();//현재 열린 popup창 종료
		}
	</script>
</body>
</html>