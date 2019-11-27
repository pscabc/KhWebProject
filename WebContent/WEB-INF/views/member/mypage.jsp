<%@ page import ="org.yeodam.member.model.vo.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Member member = (Member)request.getAttribute("member");
    	String status = (String)request.getParameter("status");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>
	<%if(status != null && "1".equals(status)){%>
		alert("회원 수정 완료하였습니다.");
	<%}%>
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<section>
		<br><br><br><br><br><br><br><br>
		<form action="/update" method="post" style="width:800px; margin:0 auto; color:black;">
			<h1>회원정보</h1>
			<table class="table">
				<tr>
					<th>아이디</th>
					<td><input type="text" name="memberId" class="form-control" value="<%=member.getMemberId()%>" readonly>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="text" name="memberPw" class="form-control" value="<%=member.getMemberPw()%>">
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="memberName" class="form-control" value="<%=member.getMemberName()%>">
					</td>
				</tr>
				<tr>
					<th>나이</th>
					<td><input type="text" name="memberAge" class="form-control" value="<%=member.getMemberAge()%>">
					</td>
				</tr>
				<tr>
					<th>연락처(-포함)</th>
					<td><input type="text" name="phone" class="form-control" value="<%=member.getPhone()%>">
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" name="email" class="form-control" value="<%=member.getEmail()%>">
					</td>
				</tr>
				<tr>
					<th>가입일</th>
					<td><input type="text" name="enrollDate" class="form-control" value="<%=member.getEnrollDate()%>" readonly>
					</td>
				</tr>
				<tr>
					<th>성별</th>
					<td><input type="text" name="gender" class="form-control" value="<%=member.getGender()%>">
					</td>
				</tr>
				<tr>
					<th>소개글</th>
					<td><input type="text" name="intro" class="form-control" value="<%=member.getIntro()%>">
					</td>
				</tr>
				<tr>
					<th colspan="2" style="text-align:center;">
						<button class="btn btn-outline-danger btn-lg" type="submit">수정하기</button>
						<%if(m.getMemberId().equals("admin")) {%>
							<button class="btn btn-outline-danger btn-lg" type="button" onclick="location.href='/adminpage'">회원관리</button>
						<%}else{ %>
							<button class="btn btn-outline-danger btn-lg" type="button" onclick="location.href='/delete?memberId=<%=member.getMemberId()%>'">회원탈퇴</button>
						<%} %>
					</th>
				</tr>
			</table>
		</form>
	</section>
</body>
</html>