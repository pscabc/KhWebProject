<%@page import="org.yeodam.admin.model.vo.AdminPhoto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	AdminPhoto ap = (AdminPhoto)request.getAttribute("ap");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/adminHeader.jsp" %>
	
	    <style>
        .admin_table {
            padding-top: 200px;
        }
        .btn:hover{
            color: #CE6D39;
        }
        #img-view{
         width : 200px;
         height : 200px;
         border-style : none;
        }
    </style>

    <section>
        <div class="admin_table" style="text-align: center; width: 65%; margin: 0 auto;">
            <form action="/adminPhotoUpdateEnd" method="post" enctype="multipart/form-data">
          		<input type = "hidden" name="adminPhotoNo" value="<%=ap.getAdminPhotoNo() %>">
                <!-- 파일 올릴때 꼭 enctype! method 같이!! -->
                <table class="table table-bordered table-bordered" style="border: 3px solid black;">
                    <tr class="table-dark">
                        <th colspan="4" style="font-size: 20px; font-weight: bold; color : #F17F42; background-color:black;" class="thead-inverse">관리자 추천 여행지 수정</th>
                    </tr>
                    <tr>
                    <th><br>내용(지명)</th>
                    <td><textarea name="adminPhotoContent" rows="2" cols="10" class="form-control"><%=ap.getAdminPhotoContent() %></textarea></td>
                    <td rowspan="3"><button type="summit" class="btn btn-info" style="position:relative; top:250px;" >수정</button></td>
                    <td rowspan="3"><a href="/adminPhotoList" class="btn btn-dark" style="position:relative; top:250px;">목록</a></td>
                    </tr>
                    <tr style="height: 200px;">
                    <th><br><br><br>변경 전 이미지</th>
                    <td><input  type="hidden" id="status" name="status" value="stay">
                    <%if(ap.getAdminFilename() !=null){ %>
                    	<img class="delFile" style="width:200px; height:200px;" src="/upload/adminPhoto/<%=ap.getAdminFilename()%>" width=16px;>
                    	<span class="delFile"><%=ap.getAdminFilename() %></span>
						<button type="button" id="fileDelBtn" class="btn btn-danger delFile">삭제</button>
						<input type="file" name="filename" id="file" onchange="loadImg(this)" style="display:none; position:relative; top:80px;"> 
						<input type="hidden" name="oldFilename" value="<%=ap.getAdminFilename() %>">
						<input type="hidden" name="oldFilepath" value="<%=ap.getAdminFilepath() %>">                  	
                    <%}else{%>
                    	<input type="file" name="filename">
                    <%} %></td>
                                     
                    </tr>
                    <tr>
                    	<th><br><br><br>변경 후 이미지<br>(미리보기)</th>
                    	<td><img id="img-view"></td>
                    </tr>
                 </table>
            </form>
        </div>
        
    </section>
    <script>
  		$(document).ready(function(){
			$("#fileDelBtn").click(function(){
				if(confirm("첨부파일을 삭제하시겠습니까 ?")){
					$(".delFile").hide();
					$("#file").show();
					$("#status").val("delete");
				}
			});
		});
  		
        function loadImg(f) {
            console.log(f.files); //인풋태그에 선택된 파일을 배열로 가져옴!
            if (f.files.length != 0 && f.files[0] != 0) {
                var reader = new FileReader(); //pc와 브라우저 연결?
                reader.readAsDataURL(f.files[0]); //매개변수로 지정한 파일의 경로		
                reader.onload = function(e) {
                    $("#img-view").attr('src', e.target.result);
                }
            } else {
                $("#img-view").attr('src', '')
            }
        }

    </script>



</body>
</html>