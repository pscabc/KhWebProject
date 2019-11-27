<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%  
    ArrayList<Member> members = (ArrayList<Member>)request.getAttribute("memberList");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<style>
		.table-wrapper{
			padding-top : 200px;
		}
		#pageNavi{
			text-align : center;
			width : 80%;
			margin : 0 auto;
		}
		#pageNavi>*{
			margin : 10px;
		}
		.selectPage{
			font-size: 18px;
			color:orange;
		}
</style>
<body>
	<%@ include file="/WEB-INF/views/common/adminHeader.jsp"%>
	<section>
		<div class="table-wrapper" style="text-align: center; width:80%; margin:0 auto;">
			<table class ="table table-striped table-bordered" style="border:3px solid black;">
				<tr>
					<th colspan="10" style="font-size : 20px; font-weight : bold; background-color:black; color: #F17F42;" >
					회원 관리 목록
					</th>
				</tr>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>핸드폰</th>
					<th style="width : 60px;">나이</th>
					<th style="width : 200px;">이메일</th>
					<th style="width : 100px;">가입일</th>
					<th style="width : 90px;">성별</th>
					<th>소개글</th>
					<th style="width : 90px;">탈퇴</th>
				</tr>
				<%for(Member m2 : members){ %>
				<form action="/adminMemberPage" method="post">
				<tr>
					<td><%=m2.getMemberId()%></td>
					<td><%=m2.getMemberName()%></td>
					<td><%=m2.getPhone()%></td>
					<td><%=m2.getMemberAge()%></td>
					<td><%=m2.getEmail()%></td>
					<td><%=m2.getEnrollDate()%></td>
					<td><%=m.getGender()%></td>
					<td><%=m2.getIntro()%></td>
					<%if(m2.getMemberName().equals("관리자") || m2.getMemberId().equals("admin") ){ %>
					<td><button style="display:none;"type="button" class="btn btn-danger btn" onclick="location.href='/adminMemberDelete?memberId=<%=m2.getMemberId()%>'">탈퇴</button></td>
					<%}else{ %>
					<td><button type="button" class="btn btn-danger btn" onclick="location.href='/adminMemberDelete?memberId=<%=m2.getMemberId()%>'">탈퇴</button></td>
					<%} %>
				</tr>
				</form>
				<%}%>	
			</table>
			</div>
			<div style="margin:0 auto;width:500px; text-align:center;">
			<form action="/adminMemberSearchKeyword" method="">
				<select name="type" class="form-control" style="display: inline-block; width:100px;
				height:30px; font-size:0.8em;">
					<option value ="memberId">아이디</option>
					<option value ="memberName">이름</option>
				</select>
				<input type="text" class="form-control" style="display:inline-block; width:200px;
				height:30px; font-size:0.8em;" name="keyword">
				<button type="submit" class="btn btn-outline-secondary btn-sm">조회</button>
				<a href="/adminMemberPage" class="btn btn-info btn-sm">목록</a>
			</form>
			</div>
	</section>
	
</body>
</html>