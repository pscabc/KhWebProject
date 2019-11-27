<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo:400,700&display=swap&subset=korean" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	*{
		font-family: 'Nanum Myeongjo', serif; 
	}
	div{
		/* border:1px solid blue; */
		box-sizing:border-box;
	}
	/* header{
		border:1px solid blue;
		height:300px;
		margin:0 auto;
	} */
	#wrap{
		width:1000px;
		margin:0 auto;
	}
	#top{
		height:250px;
		background-image:url("/img/관광배경.png");
		background-size : 100% 100%;
	}
	#category{
		height:100px;
		line-height:150px;
	}
	#category-in{
		display:inline-block;
		margin-left:280px;
	}
	.navCategory{
		float:left;
		border:1px solid #A4A4A4;
		border-radius:20px;
		width:75px;
		height:30px;
		line-height:30px;
		text-align:center;
		cursor:pointer;
		margin-right:40px;
	}
	.navCategory:hover{
		background:#A4A4A4;
		color:white;
	}
 	#title-img{
		position:absolute;
		top:200px;
		left:300px;
		z-index:5;
	}

	#board{
		height:700px;
	}
	#board>div:nth-child(3n){
		width:315px;
		height:420px;
		float:left;
		margin-right:0px;
		margin-top:20px;
	}
	.tourist-div{
		width:315px;
		height:420px;
		float:left;
		margin-right:25.2px;
		margin-top:20px;
		border: 2px solid #eee;
		cursor:pointer;
	}
	#img-div{
		margin-top:10px;
	}
	#con-div{
		margin-top:10px;
		color:#A4A4A4;
		font-size:0.8em;
	}
	#top-con-div{
		color:#6E6E6E;
		font-size:1.2em;
		text-align:center;
		margin-top:30px;
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<form name="info">
		<input type="hidden" name="id">
		<input type="hidden" name="typeId">
		<input type="hidden" name="image">
		<input type="hidden" name="title">
		<input type="hidden" id="form-index" name="index">
		<input type="hidden" name="category">
	</form>
		
	<div id="top">
		<div id="title-img">
			<span style="color:white; font-weight:bold; font-size:2em;"></span>
		</div>
	</div>
	<div id="wrap">
		<div id="top-con-div">
			<span style="font-size:1.3em; font-weight:bold; color:#424242">모든 여행지를 한눈에···</span><br><br>
			<span style="color:#848484; font-size:0.9em">여행지에 대한 정보를 확인하고 마음에 드는 여행지를 담아보세요!</span><br>
			<span style="color:#848484; font-size:0.9em">내가 가본 우리나라 관광지는 어디까지 일까? 수많은 우리나라의 관광명소들을 취향에 맞게 담아보세요.</span>
		</div>
		<div id="category">
			<div id="category-in">
				<div class="navCategory" id="tourBtn">#관광명소
				</div>
				<div class="navCategory" id="resBtn">#식당
				</div>
				<div class="navCategory" id="shopBtn">#쇼핑
				</div>
				<div class="navCategory" id="stayBtn">#숙박
				</div>
			</div>
		</div>
		<div id="board">
			<c:forEach items="${mapList}" var="content">
			<div class="tourist-div">
				<div id="id" style="display:none;">${content.touristId }</div>
				<div id="typeId" style="display:none;">${content.touristConId }</div >
				<div id="image" style="display:none;">${content.touristImg }</div>
				<div id="title" style="display:none;">${content.touristTitle }</div>
				<img src="${content.touristImg}" width="100%" height="50%">
				<div style="text-align:center;">
					<span style="font-size:1.1em; display:inline-block; margin-top:8px;font-weight:bold">${content.touristTitle}</span><br>
					<span style="font-size:0.8em; display:inline-block; margin-top:8px; color:#A4A4A4">${content.touristAddr}</span><br>
					<span style="font-size:0.8em; display:inline-block; margin-top:8px; color:#81BEF7; font-weight:bold">#바다#데이트코스#휴가</span>
				</div>
				<div id="img-div">
					<img style="margin-left:60px;"src="/img/좋아요.png" width="20" height="20">
					<img style="margin-left:60px;"src="/img/담기.png" width="20" height="20">
					<img style="margin-left:60px;"src="/img/리뷰.png" width="20" height="20">
				</div>
				<div id="con-div">
					<span style="display:inline-block; margin-left:50px;">좋아요</span>
					<span style="display:inline-block; margin-left:58px;">담기</span>
					<span style="display:inline-block; margin-left:55px;">리뷰</span><br>
					<span style="display:inline-block; margin-left:60px;">50</span>
					<span style="display:inline-block; margin-left:73px;">321</span>
					<span style="display:inline-block; margin-left:65px;">21</span>
				</div>
			</div>
			</c:forEach>
		</div>	
	</div>
	<footer>
	
	</footer>
	<script>
		$("#tourBtn").on("click",function(){
			console.log("관광버튼 클릭");
			var typeId = "12";
			$.ajax({
				url:"/loadTourist",
				type:"get",
				data:{typeId:typeId},
				success: function(data){
					console.log("ajax 송수신 성공");
					$("#board").empty();
					
					console.log("data.size() : "+data.length);
					for(var i = 0; i < data.length; i++){
						$("<div class='tourist-div'>"+
							"<div id='id' style='display:none;'>"+data[i].touristId+"</div>"+
							"<div id='typeId' style='display:none;'>"+data[i].touristConId+"</div>"+
							"<div id='image' style='display:none;''>"+data[i].touristImg+"</div>"+
							"<div id='title' style='display:none;''>"+data[i].touristTitle+"</div>"+
							"<img src="+data[i].touristImg+" width='100%' height='50%'>"+
							"<div style='text-align:center'>"+
								"<span style='font-size:1.1em; display:inline-block; margin-top:8px;font-weight:bold'>"+data[i].touristTitle+"</span><br>"+
								"<span style='font-size:0.8em; display:inline-block; margin-top:8px; color:#A4A4A4'>"+data[i].touristAddr+"</span><br>"+
								"<span style='font-size:0.8em; display:inline-block; margin-top:8px; color:#81BEF7; font-weight:bold'>#바다#데이트코스#휴가</span>"+
							"</div>"+
							"<div id='img-div'>"+
								"<img style='margin-left:60px;'src='/img/좋아요.png' width='20' height='20'>"+
								"<img style='margin-left:60px;'src='/img/담기.png' width='20' height='20'>"+
								"<img style='margin-left:60px;'src='/img/리뷰.png' width='20' height='20'>"+
							"</div>"+
							"<div id='con-div'>"+
								"<span style='display:inline-block; margin-left:50px;'>좋아요</span>"+
								"<span style='display:inline-block; margin-left:58px;'>담기</span>"+
								"<span style='display:inline-block; margin-left:55px;'>리뷰</span><br>"+
								"<span style='display:inline-block; margin-left:60px;'>50</span>"+
								"<span style='display:inline-block; margin-left:73px;'>321</span>"+
								"<span style='display:inline-block; margin-left:65px;'>21</span>"+
							"</div>"+
						"</div>").appendTo("#board");
					}
				},
				error : function(){
					console.log("ajax 송수신 실패");
				}
			});
		});
		$("#resBtn").on("click",function(){
			var typeId = "39";
			$.ajax({
				url:"/loadTourist",
				type:"get",
				data:{typeId:typeId},
				success: function(data){
					console.log("ajax 송수신 성공");
					$("#board").empty();
					
					console.log("data.size() : "+data.length);
					for(var i = 0; i < data.length; i++){
						$("<div class='tourist-div'>"+
							"<div id='id' style='display:none;'>"+data[i].touristId+"</div>"+
							"<div id='typeId' style='display:none;'>"+data[i].touristConId+"</div>"+
							"<div id='image' style='display:none;''>"+data[i].touristImg+"</div>"+
							"<div id='title' style='display:none;''>"+data[i].touristTitle+"</div>"+
							"<img src="+data[i].touristImg+" width='100%' height='50%'>"+
							"<div style='text-align:center'>"+
								"<span style='font-size:1.1em; display:inline-block; margin-top:8px;font-weight:bold'>"+data[i].touristTitle+"</span><br>"+
								"<span style='font-size:0.8em; display:inline-block; margin-top:8px; color:#A4A4A4'>"+data[i].touristAddr+"</span><br>"+
								"<span style='font-size:0.8em; display:inline-block; margin-top:8px; color:#81BEF7; font-weight:bold'>#바다#데이트코스#휴가</span>"+
							"</div>"+
							"<div id='img-div'>"+
								"<img style='margin-left:60px;'src='/img/좋아요.png' width='20' height='20'>"+
								"<img style='margin-left:60px;'src='/img/담기.png' width='20' height='20'>"+
								"<img style='margin-left:60px;'src='/img/리뷰.png' width='20' height='20'>"+
							"</div>"+
							"<div id='con-div'>"+
								"<span style='display:inline-block; margin-left:50px;'>좋아요</span>"+
								"<span style='display:inline-block; margin-left:58px;'>담기</span>"+
								"<span style='display:inline-block; margin-left:55px;'>리뷰</span><br>"+
								"<span style='display:inline-block; margin-left:60px;'>50</span>"+
								"<span style='display:inline-block; margin-left:73px;'>321</span>"+
								"<span style='display:inline-block; margin-left:65px;'>21</span>"+
							"</div>"+
						"</div>").appendTo("#board");
					}
				},
				error : function(){
					console.log("ajax 송수신 실패");
				}
			});
			
		});
		$("#shopBtn").on("click",function(){
			console.log("식당 카테고리 선택");
			var typeId = "38";
			$.ajax({
				url:"/loadTourist",
				type:"get",
				data:{typeId:typeId},
				success: function(data){
					console.log("ajax 송수신 성공");
					$("#board").empty();
					
					console.log("data.size() : "+data.length);
					for(var i = 0; i < data.length; i++){
						$("<div class='tourist-div'>"+
							"<div id='id' style='display:none;'>"+data[i].touristId+"</div>"+
							"<div id='typeId' style='display:none;'>"+data[i].touristConId+"</div>"+
							"<div id='image' style='display:none;''>"+data[i].touristImg+"</div>"+
							"<div id='title' style='display:none;''>"+data[i].touristTitle+"</div>"+
							"<img src="+data[i].touristImg+" width='100%' height='50%'>"+
							"<div style='text-align:center'>"+
								"<span style='font-size:1.1em; display:inline-block; margin-top:8px;font-weight:bold'>"+data[i].touristTitle+"</span><br>"+
								"<span style='font-size:0.8em; display:inline-block; margin-top:8px; color:#A4A4A4'>"+data[i].touristAddr+"</span><br>"+
								"<span style='font-size:0.8em; display:inline-block; margin-top:8px; color:#81BEF7; font-weight:bold'>#바다#데이트코스#휴가</span>"+
							"</div>"+
							"<div id='img-div'>"+
								"<img style='margin-left:60px;'src='/img/좋아요.png' width='20' height='20'>"+
								"<img style='margin-left:60px;'src='/img/담기.png' width='20' height='20'>"+
								"<img style='margin-left:60px;'src='/img/리뷰.png' width='20' height='20'>"+
							"</div>"+
							"<div id='con-div'>"+
								"<span style='display:inline-block; margin-left:50px;'>좋아요</span>"+
								"<span style='display:inline-block; margin-left:58px;'>담기</span>"+
								"<span style='display:inline-block; margin-left:55px;'>리뷰</span><br>"+
								"<span style='display:inline-block; margin-left:60px;'>50</span>"+
								"<span style='display:inline-block; margin-left:73px;'>321</span>"+
								"<span style='display:inline-block; margin-left:65px;'>21</span>"+
							"</div>"+
						"</div>").appendTo("#board");
					}
				},
				error : function(){
					console.log("ajax 송수신 실패");
				}
			});
			
		});
		$("#stayBtn").on("click",function(){
			var typeId = "32";
			$.ajax({
				url:"/loadTourist",
				type:"get",
				data:{typeId:typeId},
				success: function(data){
					console.log("ajax 송수신 성공");
					$("#board").empty();
					
					console.log("data.size() : "+data.length);
					for(var i = 0; i < data.length; i++){
						$("<div class='tourist-div'>"+
							"<div id='id' style='display:none;'>"+data[i].touristId+"</div>"+
							"<div id='typeId' style='display:none;'>"+data[i].touristConId+"</div>"+
							"<div id='image' style='display:none;'>"+data[i].touristImg+"</div>"+
							"<div id='title' style='display:none;'>"+data[i].touristTitle+"</div>"+
							"<img src="+data[i].touristImg+" width='100%' height='50%'>"+
							"<div style='text-align:center'>"+
								"<span style='font-size:1.1em; display:inline-block; margin-top:8px;font-weight:bold'>"+data[i].touristTitle+"</span><br>"+
								"<span style='font-size:0.8em; display:inline-block; margin-top:8px; color:#A4A4A4'>"+data[i].touristAddr+"</span><br>"+
								"<span style='font-size:0.8em; display:inline-block; margin-top:8px; color:#81BEF7; font-weight:bold'>#바다#데이트코스#휴가</span>"+
							"</div>"+
							"<div id='img-div'>"+
								"<img style='margin-left:60px;'src='/img/좋아요.png' width='20' height='20'>"+
								"<img style='margin-left:60px;'src='/img/담기.png' width='20' height='20'>"+
								"<img style='margin-left:60px;'src='/img/리뷰.png' width='20' height='20'>"+
							"</div>"+
							"<div id='con-div'>"+
								"<span style='display:inline-block; margin-left:50px;'>좋아요</span>"+
								"<span style='display:inline-block; margin-left:58px;'>담기</span>"+
								"<span style='display:inline-block; margin-left:55px;'>리뷰</span><br>"+
								"<span style='display:inline-block; margin-left:60px;'>50</span>"+
								"<span style='display:inline-block; margin-left:73px;'>321</span>"+
								"<span style='display:inline-block; margin-left:65px;'>21</span>"+
							"</div>"+
						"</div>").appendTo("#board");
					}
				},
				error : function(){
					console.log("ajax 송수신 실패");
				}
			});
			
		});
		
		$(document).on("click",".tourist-div",function(){
			var id = $(this).find("#id").text();
			console.log("id : "+id);
			var typeId = $(this).find("#typeId").text();
			console.log("typeId : "+typeId);
			var image = $(this).find("#image").text();
			var title2 = $(this).find("#title").text();
			console.log("title2 : " + title2);
			var url="";
			console.log("url : "+url);
			
			 if(typeId == 39){
				url = "/introRes"; 
				var title ="introRes";
			}else if(typeId == 12){
				url = "/introTourist"; 
				var title ="introTourist";
			}else if(typeId == 38){
				url = "/introShop"; 
				var title ="introShop";
			}else if(typeId == 32){
				url = "/introStay";
				var title ="introStay";
			} 
			
			info.id.value = id;
			info.typeId.value = typeId;
			info.image.value = image;
			info.title.value = title2;
			info.index.value = "1";
			//info.bool.value = "1";
			info.action = url;
			info.method = "post";
			info.submit();
		});
	</script>
</body>
</html>