<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding:400,700&display=swap&subset=korean" rel="stylesheet">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=97y2rjgkea&submodules=geocoder"></script>

<style>
	*{
		font-family: 'Nanum Gothic Coding', monospace;
	}
	#header{
		height:400px;
	}
	#wrap{
		margin: auto 0;
        padding-left:300px;
        padding-right:300px;
	}
    #title{
        box-sizing:border-box;
        text-align:center;
    }
    /* div{
        box-sizing:border-box;
        border:1px solid #eee;        
    } */
    #img-div{
        box-sizing:border-box;
        width:50%;     
        float:left;
        box-sizing:border-box;
        height:100%;
    }
    #con-div{
        box-sizing:border-box;
        width:50%;
        float:left;
    }
    #wrap-top{
        height:250px;
    }
    #con-div{
        height:100%;
    }
    #con-div1{
   		box-sizing : border-box;
    	padding:10px;
    	border:1px solid #9baec8;
    	border-bottom:0px;
        height:20%;
        color:#6E7783;
    }
    #con-div2{
    	color:#6E7783;
    	box-sizing : border-box;
    	padding:10px;
    	border:1px solid #9baec8;
        height:80%;
    }
    #geyo-div{
        height:50px;
        border-bottom:1px solid #9baec8;
        color:#6E7783;
    }
    #geyo-con-div{
	    color:#6E7783;
    	box-sizing : border-box;
    	padding-top:20px;
    	padding-bottom:20px;
    	line-height:30px;
        height:auto;
    }
    #geo-con-div{
    	color:#6E7783;
    	margin-top:20px;
    	border-bottom:1px solid #9baec8;	
        height:50px;
    }
    #geo-wrap{
    	margin-top:30px;
        height:300px;
    }
    #detail-title-div{
    	color:#6E7783;
    	border-bottom:1px solid #9baec8;
        height:50px;
    }
    #detail-div{
    	color:#6E7783;
    	box-sizing : border-box;
    	padding-top:20px;
        height:auto;
    }
    #near-tourist-div{
    	color:#6E7783;
    	border-bottom:1px solid #9baec8;
    	margin-top:20px;
        height:50px;
    }
    #near-tourist-list{
    	box-sizing : border-box;
    	margin-top:20px;
    	margin-left:22.5px;
        height:350px;
        width:95%;
       
    }
    .near-tourist{
    	box-sizing : border-box;
    	float:left;
    	height:100%;
    	width:30%;
    	cursor:pointer;
    }
    #near-image-div{
    	box-sizing:border-box;
    	height:70%;
    }
    #near-con-div{
    	text-align:center;
    	box-sizing : border-box;
    	height:30%;
    	padding-top:15px;
    }
    #near-con-div-1{
    	font-weight:bold; 
    	color:#424242;
    }
    #near-con-div-2{
    	font-size:0.8em; 
    	color:#6E7783;"
    }
    
   	.slick-prev{
   		color:#274555;
   		border:0;
   		outline:0;
   		background:white;
   	}
   	.slick-next{
   		color:#274555;
   		border:0;
   		outline:0;
   		background:white;
   	}
   	#clipBtn{
   		float:right;
   		cursor:pointer;
   	}
    footer{
    	height:100px;
    }
    
</style>
</head>
<body>
	<!-- 소개 정보 값 보내기 -->
	<form name="info">
		<input type="hidden" name="id">
		<input type="hidden" name="typeId">
		<input type="hidden" name="image">
		<input type="hidden" name="title">
		<input type="hidden" name="index">
	</form>
	
	<div id="header">
		<img src="/img/여행사진2.jpg" width="100%" height="100%" style="opacity:0.7;">
	</div>
    <div id="wrap">
		<div>
			<h1 id="title">${touristMap.title }</h1>
		</div>
		<div id="wrap-top">
			<div id="img-div"><img src="${touristMap.image}" width="100%" height="100%" ></div>
			<div id="con-div">
                <div id="con-div1">
                	<img src="/img/파랑체크.png" width="20" height="20">
                    <span>기본정보</span>
                    
                    	<img src="/img/파란클립.png" id = "clipBtn" width="25" height="25">
    
                </div>
                <div id="con-div2">
                		<table>
                			<tr><td>이름 :</td><td style="width:20px;"></td><td>${touristMap.title }</td></tr>
                			<tr><td></td><td></td><td></td></tr>
                			<tr><td>주소 :</td><td></td><td>${touristMap.addr1 }</td></tr>
                			<tr><td></td><td></td><td></td></tr>
                			<tr><td>우편번호 :</td><td></td><td>${touristMap.zipcode }</td></tr>
                		</table>
                </div>
            </div>
		</div>
		<br>
		<div>
            <div id="geyo-div">
            	<img src="/img/파랑체크.png" width="20" height="20">
                <span>개요</span>
            </div>
            <div id="geyo-con-div">     
				<span>${touristMap.overview}</span>
            </div> 
		</div>
        <div>
            <div id="geo-con-div">
            	<img src="/img/파랑체크.png" width="20" height="20">
                <span>위치정보</span>
            </div>
            <div id="geo-wrap">
            	<div id="map" style="width:100%; height:100%;box-sizing : border-box;">
           		</div>
            </div>
        </div>
        <br>
        <div>
            <div id="detail-title-div">
            	<img src="/img/파랑체크.png" width="20" height="20">
                <span>상세정보</span>
            </div>
            <div id="detail-div">
            
            <c:if test="${typeId == 39}">
                <span>문의 및 안내 : ${touristMap.infocenterfood }</span><br>
                <span>예약 안내 : ${touristMap.reservationfood } </span><br>
                <span>예약 안내홈페이지 : ${touristMap.homepage }</span><br><br>
                <span>주차가능 여부 : ${touristMap.parkingfood }</span><br>
                <span>흡연 여부 : ${touristMap.smoking }</span><br>
                <span>영업 시간 :<br>${touristMap.opentimefood } </span><br>
                <span>연휴 : ${touristMap.restdatefood }</span><br>
                <span>메인메뉴 : ${touristMap.firstmenu }</span><br>
                <span>메뉴 : ${touristMap.treatmenu }</span><br>
            </c:if>
            <c:if test="${typeId == 12}">
                <span>문의 및 안내 : ${touristMap.infocenter }</span><br>
                <span>예약 안내 : ${touristMap.infocenter } </span><br>
                <span>예약 안내홈페이지 : ${touristMap.homepage }</span><br><br>
                <span>여행 가이드 : ${touristMap.expguide }</span><br>
                <span>주차가능 여부 : ${touristMap.parking }</span><br>
                <span>유모차 대여 : ${touristMap.chkbabycarriage }</span><br>
                <span>애완동물 동반 : ${touristMap.chkpet }</span><br>
                <span>영업 시간 :<br>${touristMap.opentimefood } </span><br>
                <span>연휴 : ${touristMap.restdate }</span><br>
                <span>시즌 기간 : ${touristMap.useseason }</span><br>
                <span>이용 시간 : ${touristMap.usetime }</span><br>
            </c:if>
            <c:if test="${typeId == 38}">
                <span>문의 및 안내 : ${touristMap.infocentershopping }</span><br>
                <span>예약 안내 : ${touristMap.infocentershopping } </span><br>
                <span>예약 안내홈페이지 : ${touristMap.homepage }</span><br><br>
                <span>쇼핑 가이드 : ${touristMap.shopguide }</span><br>
                <span>주차가능 여부 : ${touristMap.parkingshopping }</span><br>
                <span>유아용 카트 : ${touristMap.chkbabycarriageshopping }</span><br>
                <span>할인 품목 : ${touristMap.saleitem }</span><br>
                <span>할인 :<br>${touristMap.saleitemcost } </span><br>
                <span>운영 시간 : ${touristMap.opentime }</span><br>
            </c:if>
            <c:if test="${typeId == 32}">
            	<span>문의 및 안내 : ${touristMap.reservationlodging }</span><br>
                <span>예약 안내 : ${touristMap.reservationlodging } </span><br>
                <span>예약 안내홈페이지 : ${touristMap.homepage }</span><br><br>
                
				<span>객실 수 : ${touristMap.roomcount }</span><br>
                <span>개실 유형 : ${touristMap.roomtype }</span><br>
                <span>체크인 :${touristMap.checkintime } </span><br>
                <span>체크아웃 : ${touristMap.checkouttime }</span><br><br>
                
                <span>건강 시설 : ${touristMap.fitness ? 0 : "없음" }</span><br>
                <span>사우나: ${touristMap.sauna ? 0 : "없음"  }</span><br>
                <span>목욕탕 : ${touristMap.publicbath ? 0 : "없음" }</span><br>
                <span>PC방 : ${touristMap.publicpc ? 0 : "없음"  }</span><br>
                <span>노래방 : ${touristMap.karaoke ? 0 : "없음"  }</span><br>
                <span>개인 취사 : ${touristMap.chkcooking }</span><br>
                <span>주차가능 여부 : ${touristMap.parkinglodging }</span><br>

            </c:if>
            </div>
            
        </div>
        <div>
            <div id="near-tourist-div">
            	<img src="/img/파랑체크.png" width="20" height="20">
                <span>주변관광지</span>
            </div>
            <div id="near-tourist-list">
            <c:if test="${nearMap == null}">
	            <c:forEach items="${nearMapList}" var="content">	
	            	<c:if test="${content.title != touristMap.title}">
	            	<div class="near-tourist">
	            		<div id="title" style="display:none;">${content.title}</div>
	            		<div id="image" style="display:none;">${content.firstimage}</div>
	            		<div id="id" style="display:none;">${content.contentid}</div>
	            		<div id="typeId" style="display:none;">${content.contenttypeid}</div>
	            		<div id="near-image-div">
	            			<img src="${content.firstimage}" width="282px" height="160px">
	            		</div>
	            		<div id="near-con-div">
	            			<span>${content.title}</span><br>
	            			<span>${content.addr1}</span>
	            		</div>
	            	</div>
	            	</c:if>
	            </c:forEach>
            </c:if>
            <c:if test="${nearMap != null}">
            	<c:if test="${nearMap.title != touristMap.title}">
            	<div class="near-tourist">
            		<div id="title" style="display:none;">${nearMap.title}</div>
            		<div id="image" style="display:none;">${nearMap.firstimage}</div>
            		<div id="id" style="display:none;">${nearMap.contentid}</div>
            		<div id="typeId" style="display:none;">${nearMap.contenttypeid}</div>
            		<div id="near-image-div">
            			<img src="${nearMap.firstimage}" width="282px" height="160px">
            		</div>
            		<div id="near-con-div">
            			<span id="near-con-div-1" >${nearMap.title}</span><br><br><br>
            			<span id="near-con-div-2" >${nearMap.addr1}</span>
            		</div>
            	</div>
            	</c:if>
            </c:if>
            </div>
        </div>
	</div>
        <footer></footer>
</body>
<script>
	//맵 띄우기
	var mapOptions = {
			zoom:7,
			position: new naver.maps.LatLng(${touristMap.mapy}, ${touristMap.mapx})
		};
	var map = new naver.maps.Map('map',mapOptions);
	
	var markerOptions = {
			position: new naver.maps.LatLng(${touristMap.mapy}, ${touristMap.mapx}),
			map: map,
			icon:{
				url: '/img/파란색.png',
				size: new naver.maps.Size(30,34),
				scaledSize: new naver.maps.Size(30, 34),
			        origin: new naver.maps.Point(0, 0),
			        anchor: new naver.maps.Point(12,34)
			}	
		};
	var marker = new naver.maps.Marker(markerOptions);
	
	console.log("mapx : "+${touristMap.mapx}+" mapy : "+${touristMap.mapy});
	
	$("#near-tourist-list").slick({
		slidesToShow:3,
		slidesToScroll:1,
		autoplay:true,
		autoplaySpeed:2000,
	});
	
	$(function(){
		$(".slick-prev").html("");
		$(".slick-next").html("");
		
		/* $(".slick-prev").hover(function(){
			$(".slick-prev").html('◀');
		};
		$(".slick-next").hover(function(){
			$(".slick-next").html('▶');
		}; */
	});
		
	$(".near-tourist").on("click",function(){
		console.log("주변 관광 지역 클릭함.");
		var index = ${index};
		console.log("introRes.jsp - index : " + index);
		//이거 눌렀을 때 새로운창으로 소개페이지를 띄워줌.
		//보내는 값은 contypeid,conid
		var typeId = $(this).find("#typeId").text();
		var id = $(this).find("#id").text();
		var image = $(this).find("#image").text();
		var title2 = $(this).find("#title").text();
		console.log("this : "+$(this));
		console.log("this->className : "+$(this).attr('class'));
		console.log("this->tagName : " +$(this).tagName);
		console.log("conId : "+typeId);
		console.log("id : "+id);
		console.log("title : "+title2 );
		//창띄우기
		//location.href="/introRes?conId=conId&id=id";

		//typeId=" + typeId +"&id=" +id
		if(typeId == 32){
			var url = "/introStay";
		}else if(typeId == 12){
			var url = "/introTourist";
		}else if(typeId == 38){
			var url = "/introShop";
		}else if(typeId == 39){
			var url = "/introRes";
		}
		
		var title ="introRe"+index; //윈도우 창 이름
		console.log(title);
		
		var status = "left=0px, top=0px, width=2000px, height=2000px, menubar-no, status=no, scrollbar=yes";
		
		var popup = window.open("",title,status); //빈창 오픈
		
		info.id.value = id;
		info.typeId.value = typeId;
		info.image.value = image;
		info.title.value = title2;
		var index = String(index+1);
		console.log("introRes.jsp - index : " +index);
		console.log("introRes.jsp - index type : " +(typeof index));
		info.index.value = index;
		info.target = title;
		info.action = url;
		info.method = "post";
		
		info.submit();
	});
	$("#clipBtn").on("click",function(){
			console.log("!");
			//버튼 누르면 db에 title,image,addr,좌표 들어감. -> 새로운 테이블 구성 (기본키 memberId)
			//var tourOneMap = new Map();
			var title = "${touristMap.title}";
			var mapx = "${touristMap.mapx}";
			var mapy = "${touristMap.mapy}";
			var addr = "${touristMap.addr1}";
			var image = "${touristMap.image}";
			var id = "${id}";
			var typeId = "${typeId}";
/* 			tourOneMap["title"]= title;
			tourOneMap["mapx"]= mapx;
			tourOneMap["mapy"]= mapy;
			tourOneMap["addr"]= addr;
			tourOneMap["image"] = image; */
			//tourOneMap["image"]=${touristMap.image};
			//console.log("introRes - tourOneMap-title : "+tourOneMap["title"]);
			//var tourOneJson = JSON.stringify(tourOneMap);
			//console.log("introRes - tourOneJson-title : "+tourOneJson);
			
			$.ajax({
				url:"/insertClip",
				type:"get",
				data:{title:title,mapx:mapx,mapy:mapy,addr:addr,image:image,id:id,typeId:typeId},
				contentType:"application/json; charset=utf-8",
				success: function(data){
					console.log("clipBtn ajax 송수신 성공");
					//count가 0이면 중복 x -> db에 들어감
					//count가 1이상이면 중복 -> db에 안들어감
					if(data == 0){
						alert("저장 성공!");
					}else{
						alert("여행지를 이미 저장하셨습니다.");
					}
				},
				error:function(){
					console.log("clipBtn ajax 송수신 실패");
				}
			});
		});
	
	
</script>

</html>