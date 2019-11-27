<%@page import="org.yeodam.admin.model.vo.AdminPhoto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.yeodam.admin.model.vo.AdminPageData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    AdminPageData apd= (AdminPageData)request.getAttribute("apd");
    ArrayList<AdminPhoto> list = apd.getList();
    String pageNavi = apd.getPageNavi();
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/WEB-INF/views/common/adminHeader.jsp" %>
	<style>
    .photo_table{
        padding-top: 200px;
    }
    .photo_table #writeBtn{
        float: right;
    }
    .photo_table .btn{
    	font-weight: bold;
    }
    .photo_table a:hover{
        color:  #F17F42;
    }
    #pageNavi{
    	text-align:center;
    	width : 80%;
    	margin : 0 auto;
    }
    #pageNavi>*{
    	
    }
    .selectPage{
    	font-size : 20px;
    	color: #F17F42;
    }
    #adminImg{
    	width : 150px;
    	height : 150px;
    	border-radius: 50%;
    }
    #adminImg:hover {
    	transform: scale(1.4);
    }
 
</style>
<body>
      <section>
        <div class="photo_table" style="text-align: center; width: 65%; margin: 0 auto;">
            
            <table class="table table-striped table-bordered  table-hover" style="border: 3px solid black;">
                   <a type="summit" id="writeBtn" class="btn btn-dark" style="background-color:black;" href="/adminPhotoWrite">여행지 등록</a>
                    <tr class="table-dark">
                        <th colspan="5" style="font-size: 20px; font-weight: bold; color: #F17F42; background-color:black;" class="thead-dark" >관리자 추천<br>여행지 목록</th>
                    </tr>
                    <tr>
                        <th style="width: 50px;">번호</th>
                        <th style="width: 70px;">이미지</th>
                        <th style="width: 150px;">내용(지명)</th>
                        <th style="width: 30px;">수정</th>
                    	<th style="width: 20px;">삭제</th>
                    </tr>
                    <%for(AdminPhoto ap : list){ %>
                    <tr>    
                        <td style="font-weight:bold; font-size:16px; padding-top: 70px"><%=ap.getRnum()%></td>
                        <td><img src="/upload/adminPhoto/<%=ap.getAdminFilename()%>" id="adminImg"></td>
                        <td style="font-weight:bold; font-size:16px; padding-top: 70px"><%=ap.getAdminPhotoContent()%></td>
                        <td><a class="btn btn-info" style="position:relative; top:50px;" href="/adminPhotoUpdate?adminPhotoNo=<%=ap.getAdminPhotoNo()%>">수정</a></td>
                       	<td><a class="btn btn-danger" style="position:relative; top:50px;" href="javascript:void(0)" onclick="adminPhotoDelete('<%=ap.getAdminPhotoNo()%>','<%=ap.getAdminFilepath()%>');">삭제</a></td>
                    </tr>
                    <%}%>
                </table>
          		<div id="pageNavi"><%=pageNavi %></div>
			</div>
    </section>
</body>
<script>
function adminPhotoDelete(adminPhotoNo, adminFilepath){
	var url = "/adminPhotoDelete";
	var encFilepath = encodeURIComponent(adminFilepath);
	location.href=url+'?adminPhotoNo='+adminPhotoNo+'&adminFilepath='+adminFilepath;
}
</script>
</html>