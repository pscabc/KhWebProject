<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
         border-radius: 45%;
        }
    </style>

    <section>
        <div class="admin_table" style="text-align: center; width: 65%; margin: 0 auto;">
            <form action="/adminInsertPhoto" method="post" enctype="multipart/form-data">
                <!-- 파일 올릴때 꼭 enctype! method 같이!! -->
                <table class="table table-striped table-bordered  table-hover" style="border: 3px solid black;">
                    <tr class="table-dark">
                        <th colspan="4" style="font-size: 20px; font-weight: bold; color : #F17F42; background-color:black;" class="thead-inverse">관리자 추천 여행지 등록</th>
                    </tr>
                    <tr>
                    <th>이미지보기<br>(미리보기)</th><th>내용(지명)</th>
                    <th>첨부파일</th><th>등록</th>
                    </tr>
                    <tr style="height: 200px;">
                        <td>
                            <div id="img-viewer">
                                <img id="img-view" height=200px; width="200px;">    
                            </div>
                        </td>
                        <td><textarea name="adminPhotoContent" rows="8" cols="10" class="form-control"></textarea></td>
                        <td><label class="btn btn-dark btn-file">파일추가<input type="file" name="filename" onchange="loadImg(this)" style="display: none;">
                   			 </label>
                   		</td>
                    <td><button type="summit" class="btn btn-dark" >등록하기</button></td>
                    </tr>
                </table>
            </form>
        </div>
    </section>

    <script>
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
