<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=97y2rjgkea&submodules=geocoder">
</script>
<link rel="stylesheet" href="/css/bootstrap.css">


<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {

	font-family: "나눔고딕", "NanumGothic", "Nanum Gothic", "맑은 고딕",
		"Malgun Gothic", "애플 SD 산돌고딕 Neo", "Apple SD Gothic Neo",
		AppleSDGothicNeo, Ngothic, Dotum, "돋움", Helvetica, sans-serif;
}
::-webkit-scrollbar{
  		width:0.1px;
	} 	

#wrap {
	height: 550px;
	width: 100%;
	box-sizing: border-box;
}

#header {
	background: #191e23;
	height: 80px;
	box-sizing: border-box;
}

#logo-div {
	margin-left: 14.5px;
	float: left;
	background: #2d3a42;
	height: 100%;
	width: 122px;
	padding: 13px;
	padding-top: 17px;
	cursor: pointer;
}

#logo {
	display: inline-block;
	color: #70c989;
	font-size: 27px;
}

#selectArea {
	float: left;
	height: 100%;
	line-height: 83px;
	padding-left: 25px;
}

.select-span {
	color: #70c989;
	font-size: 15px;
	display: inline-block;
	cursor: pointer;
	width:70px;
	text-align:center;
}
.select-span:hover{
	background:#2d3a42;
	
}

#dayList_wrap {
	width: 8%;
	box-sizing: border-box;
	float: left;
	height: 550px;
	background: #1f282d;
}

#day-list {
	ling-height: 20px;
	text-align: center;
}

#search_tourist_btn_wrap {
	background: #eee;
	height: 50px;
	line-height: 50px;
}

#search_tourist_btn_wrap>img {
	margin-left: 30px;
	opacity: 0.5;
	cursor: pointer;
}

#dayList-fir {
	line-height: 20px;
	text-align: center;
	color: #838292;
	font-size: 0.8em;
	height: 50px;
	border-bottom: 4px solid #2d3a42;
	cursor: pointer;
}

#calender-period {
	color: #4F86C6;
}

#dayList-sec {
	line-height: 50px;
	text-align: center;
	color: #838292;
	font-size: 0.8em;
	height: 50px;
	border-bottom: 4px solid #2d3a42;
}

.day {
	line-height: 20px;
	color: white;
	font-size: 0.7em;
	height: 50px;
	border-bottom: 4px solid #2d3a42;
	cursor: pointer;
}

#yoil {
	color: #4F86C6;
}

#basket-wrap {
	width: 22%;
	box-sizing: border-box;
	float: left;
	height: 550px;
}

#basket-init {
	width: 100%;
	box-sizing: border-box;
	height: 100%;
}

#basket-init-top {
	text-align: center;
	height: 9%;
	background: #2d3a42;
	box-sizing: border-box;
	color: white;
	font-size: 0.9em;
	padding: 5px;
}

.basket-after {
	width: 100%;
	box-sizing: border-box;
	height: 100%;
}

#basket-after-top {
	text-align: center;
	height: 9%;
	background: #2d3a42;
	/* background:#F68657; */
	box-sizing: border-box;
	font-size: 0.9em;
	color: white;
	padding: 5px;
}

.basket-after-body {
	height: 82%;
	box-sizing: border-box;
	overflow: scroll;
}

#shortest {
	float: left;
	border: 0;
	outline: 0;
	background: #2d3a42;
	color: #70c989;
	height: 100%;
	width: 49.7%;
}

#left-shortest {
	height: 50px;
	border: 1px solid #70c989;
	float: left;
}

#return {
	float: left;
	border: 0;
	outline: 0;
	background: #2d3a42;
	color: #70c989;
	height: 100%;
	width: 49.7%;
}

.basket-after-bottom {
	height: 9%;
}

.basket-after-con {
	height: 58px;
	padding: 3px;
	border: 1px solid #a3a1a1;
	box-sizing: border-box;
}

.basket-con {
	/* float:left; */
	
}

.basket-img {
	float: left;
}

.basket-title {
	font-size: 0.7em;
	font-family: Georgia, serif;
	color: #566270;
	font-weight: bold;
}

.basket-addr {
	font-size: 0.7em;
	font-family: Georgia, serif;
	color: #566270;
}

#frame {
	width: 1%;
	height: 550px;
	box-sizing: border-box;
	float: left;
	background: #191e23;
}

#tour_photoList_wrap {
	width: 26%;
	height: 550px;
	box-sizing: border-box;
	float: left;
}

#search_img {
	float: right;
}

#tour_photoList_top {
	padding: 10px;
	height: 9%;
	background-color: #2d3a42;
	font-family: Georgia, serif;
	color: white;
	box-sizing: border-box;
}

#tour_photoList_tourist_wrap_scroll {
	box-sizing: border-box;
	overflow: scroll;
	height: 420px;
	overflow-x: hidden;
}

#tour_photoList_tourist_wrap {
	width: 370px;
	overflow: auto;
}

.tour_photoList_tourist {
	height: 58px;
	padding: 3px;
	border: 1px solid #a3a1a1;
	position: relative;
}

#tour_photoList_tourist_img {
	float: left;
}

#tour_photoList_tourist_content {
	float: left;
}

#tour_photo_title {
	font-size: 0.6em;
	font-family: Georgia, serif;
	color: #566270;
	font-weight: bold;
}

#tour_photo_addr {
	font-size: 0.6em;
	font-family: Georgia, serif;
	color: #566270;
}

.tour_photoList_tourist_basket {
	cursor: pointer;
	float: right;
	margin-top: 15px;
}

.tour_photoList_tourist_intro {
	cursor: pointer;
	float: right;
	margin-right: 8px;
	margin-top: 15px;
}

.tour_photoList_tourist_cancel {
	position: absolute;
	cursor: pointer;
	float: right;
	left: 300px;
	top: 18px;
}

#geo_wrap {
	width: 42%;
	box-sizing: border-box;
	float: left;
	height: 550px;
}

#map-cancel {
	color: white;
	cursor: pointer;
	font-size: 1.2em;
	display: inline-block;
	position: absolute;
	bottom: 0;
	right: 3px;
}

#map-cancel:hover {
	color: red;
}

.map-title {
	font-size: 0.8em;
	color: white;
}

.map-img {
	width: 40px;
	height: 40px;
}

.map-box {
	cursor: pointer;
	background: blue;
	position: relative;
	width: 145px;
	height: 40px;
}

.basket-map-box {
	line-height: 25px;
	text-align: center;
	font-size: 0.8em;
	background: #F17F42;
	position: absolute;
	width: 80px;
	height: 25px;
}

footer {
	line-height: 130px;
	padding-left: 50px;
	color: #838e92;
	background: #191e23;
	height: 123px;
	width: 100%;
	box-sizing: border-box;
	clear: both;
}

#selectArea li {
	margin-top: 30px;
	float: left;
	list-style: none;
	margin-left: 20px;
	hegith: 50px;
}

#selectArea li div {
	background: white;
	color: #274555;
	width: 50px;
	height: 35px;
	text-align: center;
	border: 1px solid #F17F42;
	line-height: 35px;
	color: #F17F42;
}

#selectArea li div:hover {
	background: #F17F42;
	line-height: 35px;
	color: white;
	width: 50px;
	height: 35px;
	text-align: center;
	cursor: pointer;
}

#saveBtn {
	float: right;
	margin-right: 30px;
	margin-top: 20px;
	width: 50px;
	height: 40px;
	color: #70c989;
	cursor: pointer;
}

#saveBtn:hover {
	color: black;
}

#tour_photo_con_id, #tour_photo_con_type_id, #tour_photo_con_mapx,
	#tour_photo_con_mapy {
	display: none;
}
</style>
</head>
<body>
	<!-- 소개 정보 값 보내기 -->
	<form name="info">
		<input type="hidden" name="id"> <input type="hidden"
			name="typeId"> <input type="hidden" name="image"> <input
			type="hidden" name="title"> <input type="hidden"
			id="form-index" name="index"> <input type="hidden"
			name="bool">
	</form>
	<!-- DB SERVLET에 객체 보내기 -->
	<form name="route" method="get" action="/insertRoute">
		<input type="hidden" name="planList">
	</form>
	<div id="header">
		<div id="logo-div">
			<span id="logo">yeodam</span>
			<!-- <img style="float:left;height:75px; width:150px; "src="/img/여담로고.png"> -->
		</div>
		<div id="selectArea">
			<span class="select-span" id="seol">서울</span>
			<span class="select-span" id="incheon">인천</span>
			<span class="select-span" id="degoo">대구</span>
			<span class="select-span" id="gwangjoo">광주</span>
			<span class="select-span" id="degyoen">대전</span>
			<span class="select-span" id="busan">부산</span>
			<!-- <ul tabindex="1">
    		<li><div id="seol" >서울</div></li>
    		<li><div id="incheon" >인천</div></li>
    		<li><div id="degoo">대구</div></li>
    		<li><div id="gwangjoo" >광주</div></li>
    		<li><div id="degyoen">대전</div></li>
    		<li><div id="busan">부산</div></li>
    		<li><div id="intro">소개</div>
  		</ul> -->
		</div>
		<div id=saveBtn onclick="save()">다음</div>
	</div>
	<div id="wrap">
		<div id="frame"></div>
		<div id="dayList_wrap">
			<div id="dayList-fir">
				<span id="calender-span"> 일정 입력 </span><br> <span
					id="calender-period"></span>
			</div>
			<div id="dayList-sec">전체 여행 루트</div>
			<div id="day-list"></div>
		</div>

		<div id="frame"></div>
		<div id="tour_photoList_wrap">
			<div id="tour_photoList_top">◀ 일정입력</div>
			<div id="serch_tourist">
				<!-- <input id="search-input" type="text" style="width:260px;">
				<button id="search_img"><img src="/img/돋보기.png" width=10 height=10></button> -->
			</div>
			<div id="search_tourist_btn_wrap">
				<img src="/img/사진기.png" width="35" height="35" id="tourBtn"
					onmouseover="this.src='/img/검정카메라.png'"
					onmouseout="this.src='/img/사진기.png'"></img> <img src="/img/식당.png"
					width="35" height="35" id="resBtn"></img> <img src="/img/쇼핑.png"
					width="35" height="35" id="shopBtn"></img> <img src="/img/건물.png"
					width="35" height="35" id="stayBtn"></img> <img src="/img/검정클립.png"
					width="35" height="35" id="clipBtn"></img>
			</div>
			<div id="tour_photoList_tourist_wrap_scroll">
				<div id="tour_photoList_tourist_wrap">
					<c:forEach items="${mapList}" var="content">
						<div class="tour_photoList_tourist">
							<img id="tour_photoList_tourist_img" width="50" height="50"
								src="${content.touristImg}"}>
							<div id="tour_photoList_tourist_content">
								<span id="tour_photo_title">${content.touristTitle}</span><br>
								<span id="tour_photo_addr">${content.touristAddr}</span>
							</div>
							<div class="tour_photoList_tourist_basket">
								<img width='20' height='20' src='/img/장바구니.png'>
							</div>
							<div class="tour_photoList_tourist_intro">
								<img width='20' height='20' src='/img/검정핀.png'>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<div id="geo_wrap">
			<div id="map"
				style="background: #191e23; color: white; width: 100%; height: 100%; box-sizing: border-box;">

			</div>
		</div>
		<div id="basket-wrap">
			<div id="basket-init">
				<div id="basket-init-top"></div>
				<div></div>
			</div>
		</div>

	</div>
	<footer> Copyright @ 2019.9-2019.10 tem YEODAM </footer>
	<script>
		//여행 경로 좌표 배열
		var basketPointArr = new Array();
		
		var shortestBoolArr = new Array();
		var shortestCountArr = new Array();
		
		var dateList = new Array();
		// 지역별 지도 위치
		var seoul = new naver.maps.LatLng(37.5788222356, 126.9769930325);
		var busan = new naver.maps.LatLng(35.1797865, 129.0750194);
		// DB에 넣기 위한 날짜별 -> 여행지별 -> 정보 (리스트 -> 리스트 -> 맵)
		var planList = new Array();
		// 돌아가기 기능을 위해 최단거리 전 배열상태 저장(바로 전)
		var prePlanList = new Array();
		// 현재 지도 위치
		var nowPosition = seoul;
		//일정 입력 카운트
		var calenderBool = 0;
		var basketSeq = 0;
		//각 일정 별 basketTitle을 원소로 가짐.
		var basketAllArr = new Array();
		//마커 관리
		var markerMap = new Map();
		var basketMarkerAllArr = new Array();
		//일정 입력 여부
		var dayListBool = 0;
		//오버레이 객체 맵
		var overlayMap = new Map();
		//초기 맵 변수
		var initMap;
		//생성 맵 리스트
		var mapArr = new Array();
		//지역 번호 -> 기본이 서울
		var areaSeq = 1;
		var infowindowObj;
		//호출 카테고리(관광,식당..등등)
		var category;
		//polyline 배열 초기화
		var polyArr = new Array();
		var prePolyPath = new Array();
		
		
		
		
		//사용자 정의 오버레이 함수작성 시작.
 		var CustomOverlay = function(options,div){
 			//여기에 title 포함한 div 정의
 			this._element = div;
 			this.setPosition(options.position);
 			this.setMap(options.map || null);
 		};
 		//OverlayView 상속.
 		CustomOverlay.prototype = new naver.maps.OverlayView();
 		//생성자 주입.
 		CustomOverlay.prototype.constructor = CustomOverlay;
 		
 		CustomOverlay.prototype.onAdd = function(){
 			var overlayLayer = this.getPanes().overlayLayer;
 			
 			this._element.appendTo(overlayLayer);
 		};
 		//실게 거리를 좌표상의 거리로 바꿔서 element에 위치 넣어줌.
 		CustomOverlay.prototype.draw = function(){
 			if(!this.getMap()){
 				return;
 			}	
 			
 			var projection = this.getProjection(),
 				position = this.getPosition();
 			
 			var pixelPosition = projection.fromCoordToOffset(position);
 			
 			this._element.css('left',pixelPosition.x-35);
 			this._element.css('top',pixelPosition.y-60);
 		};
 		//오버레이 지우는 함수.
 		CustomOverlay.prototype.onRemove = function(){
 			this._element.remove();
 			this._element.off();
 		};
 		//position받아서 객체 position에 넣고 draw실행
 		CustomOverlay.prototype.setPosition = function(position){
 			this._position = position;
 			this.draw();
 		}
 		//객체 position 얻어옴.
 		CustomOverlay.prototype.getPosition = function(){
 			return this._position;
 		};
		//오버레이 함수 작성 끝.
		
		//달력 api 사용
		//달력 일정 입력버튼 눌렀을 때
		$('#dayList-fir').daterangepicker({
	    opens: 'right'
	  }, function(start, end, label) {
		   
			
		  
	    if(calenderBool == 1){
	    	$("#day-list").empty();
	    }else if(calenderBool == 0){
	    	calenderBool=1;
	    }
	    //날짜 기간 텍스트 표시
	    $("#calender-period").text(start.format("YY/MM/DD") + "-" + end.format("YY/MM/DD"));
	    //날짜 기간 만큼 day 칸 추가
	    var startDate = new Date(start);
	    var dayMinus = Math.round((end-start)/1000/60/60/24);
	    var dayList = $("#day-list");
	    //dayList 초기화
	    dateList = [];
	    //요일 배열
	    var week = new Array('일요일','월요일','화요일','수요일','목요일','금요일','토요일');
	     for(var i = 0; i <dayMinus; i++){
	    	 dateList.push(startDate);
	    	 var yoilNum = startDate.getDay();
	    	 var yoil = week[yoilNum];
	    	 var dayDiv = $('<div class="day"><span id="day-con">DAY'+(i+1)+'</span></div>');
	    	 var yoilSpan = $('<span id="yoil">'+'&nbsp'+yoil+'</span>');
	    	 //date 타입 포맷 변경
	    	 var dateSpan = $('<br><span id="date">'+Number(startDate.getMonth()+1) + "." + startDate.getDate()+'</span>');
	    	 yoilSpan.appendTo(dayDiv);
	    	 dateSpan.appendTo(dayDiv);
	    	 dayDiv.appendTo(dayList);
	    	 
	    	 //하루 더하기
	    	 startDate = startDate.setDate(startDate.getDate()+1);
	    	 //다시 표준시로 바꿔줘야됨 이유는 모름.
	 	     startDate = new Date(startDate);
	     }
	    
	     
	    //
	    $("#tour_photoList_top").text("여행지 목록");
	     
		//planList 초기화
		planList = [];
		prePlanList = [];
		//basket-init을 숨기고
		$("#basket-init").css("display","none");
		//basket-after day 수 만큼 만들기 전에
		//전에 basket-after 태그를 전체 없애줘야함.
		$(".basket-after-con").remove();
		$(".basket-after").remove();
		//basket-after를 day수 만큼 만든다.
		for(var i = 0 ; i < dayMinus;i++){
			//basket-after-top을 넣어줘야댐.
			var basketAfter = $('<div class="basket-after"></div>');
			//basket-after-top에 값 쭈루룩 넣어줘야댐.
			var yoil = $('.day').eq(i).find("#yoil").text();
			var date = $('.day').eq(i).find("#date").text();
			var day = $('.day').eq(i).find("#day-con").text();
			
			var basketAfterTop = $("<div id='basket-after-top'></div>");
			var basketAfterBody = $("<div id ='basket-day-" +i+ "' class='basket-after-body'></div>");
			var basketAfterBottom = $("<div class='basket-after-bottom'><button id='return'>되돌리기</button><div id='left-shortest'></div><button id='shortest'>최단거리</button></div>");
			
			basketAfterTop.text(day +" "+date+"("+yoil+")");
			basketAfterTop.appendTo(basketAfter);
			basketAfterBody.appendTo(basketAfter);
			basketAfterBottom.appendTo(basketAfter);
			basketAfter.appendTo($('#basket-wrap'));
			
			console.log("yoil : "+yoil+" date : "+date+" day : "+day);
			
			//planList에 day 수 만큼 리스트 생성해서 넣기(메모리 할당)
			planList.push(new Array());
			prePlanList.push(new Array());
			
		}
		
		//일단 다 숨김
		$('.basket-after').css("display","none");
		//첫번째 basket-after가 맨 위에 오도록한다.
		$('.basket-after').eq(0).css("display","block");
		
		//일정 입력 여부 true
		dayListBool = 1;
		
		
		//일정 입력 후 맵 & 태그 생성 및 태그속에 넣기.
		//있는 맵을 모두 삭제한 뒤 , 맵을 담는 div도 숨겨야댐
		mapArr.forEach(element=> element.destroy());
		mapArr.forEach(element=> element = null);
		mapArr=[];
		//after-map 클래스 div 전체 삭제
		$(".after-map").remove();
		
		//basketAllArr 전체 초기화 한번 해줘야함. -> 일정을 새로 받을거니까
		basketAllArr.forEach(element => element.splice(0,element.length));
		basketAllArr.splice(0,basketAllArr.length);
		basketAllArr=[];
		//basketMarkerAllArr 전체 초기화 해줘야함.
		basketMarkerAllArr.forEach(element => element.forEach(element => element = null));
		basketMarkerAllArr.forEach(element => element = null );
		basketMarkerAllArr = [];
		
		
		
		//polyline 배열 초기화
		//polyArr.forEach(element => element.setmap(null));
		polyArr = [];

		//일정 기간 만큼 맵을 생성 및 숨김.(첫 날 지도 보이게 초기설정)
		//먼저 맵을 담을 div를 생성해야댐
		for(var j = 0; j < dayMinus; j++){
			console.log("count : "+j);
			//맵 담을 태그를 만들어서 geo-wrap에 추가.
			var id = 'after-map-'+j;
			console.log(id);
			$("<div class='after-map' id="+id+" style='width:645px; height:550px; box-sizing : border-box;'></div>").appendTo("#geo_wrap");
			console.log("count :"+j);
			$("#"+id).css("display","none");
			
			//생성된 맵 div들에 해당하는 맵을 생성해서 넣어줌.
			var mapOptions = {
					zoom:7
				};
			var map = new naver.maps.Map('after-map-'+j,mapOptions);
			mapArr.push(map);
			
			//polyline 배열 생성
			var polyline = new naver.maps.Polyline({
				map:map,
				path:[],
				strokeColor: '#0040FF',
			    strokeWeight: 2,
			});
			polyArr.push(polyline);
			
			//day 수 만큼 좌표 배열 속에 배열 넣어줌.
			var basketPointSeq = new Array();
			basketPointArr.push(basketPointSeq);
			console.log("daterange-basketPointArr : " + basketPointArr);
			
			var basketTitleArr = new Array();
			basketAllArr.push(basketTitleArr);
			
			var basketMarkerMap = new Map();
			basketMarkerAllArr.push(basketMarkerMap);

			shortestBoolArr[j] = 0;
			shortestCountArr[j] = 0;
		}
		//첫째날 맵 태그 보이게.(초기설정)
		//초기 맵 div 숨김
		$("#map").css("display","none");
		$("#after-map-0").css("display","block");
		
	  });
		
		//day 누를 때 day에 해당하는 여행목록 띄워줌.
		$(document).on("click",".day",function(e){
			var seq = $(this).index();
			//day누를 때마다 day뒤에 수의 -1을 해서 매칭되는 basket-after를 소환한다.
			$('.basket-after').eq(basketSeq).css("display","none");
			$('.basket-after').eq(seq).css("display","block");
			
			//현재 display인 basket.
			basketSeq = seq;
			
			//해당 일자의 맵이 보이게
			$(".after-map").css("display","none");
			$("#after-map-"+basketSeq).css("display","block");
			console.log("day"+Number(basketSeq+1)+" 클릭 - basketSeq : "+basketSeq);
			
			//맵 위치 지역별 고정
			//mapArr[basketSeq].setCenter(nowPosition);
			e.preventDefault();
		    //mapArr[basketSeq].panTo(seoul);
			
			
		});		
		
		
		/* //네이버 맵 api
 		 var mapOptions = {
			zoom:7
		};
		var map = new naver.maps.Map('map',mapOptions);

		var polyline = new naver.maps.Polyline({
		    map: map,
		    path: [new naver.maps.LatLng(37.4682610838,127.0330577212)],
		    strokeColor: '#5347AA',
		    strokeWeight: 2
		});
		
		var path = polyline.getPath();
		path.push(new naver.maps.LatLng(37.5726927951,126.9994133852)); */
		
		

		
		//맴삭제 -> map.destroy();
		/* 
		//맵 자료형 활용
		var map = new Map();
		var title = "경복궁";
		map.set("b","석굴암 마커");
		map.set(title,"경복궁 마커");
		*/

		//여행지 내용 버튼 누르면 this를 통해 사진링크, 주소, 지역명을 보내줌. 
		$(document).on("click",".tour_photoList_tourist_intro",function(){
			//눌렀을 때 표시(여행지명, 주소, 사진 링크를 가져옴)
			//사진
			var image = $(this).parent().find("#tour_photoList_tourist_img").attr('src');
			var title = $(this).parent().find("#tour_photo_title").text();
			var addr = $(this).parent().find("#tour_photo_addr").text();
			var id = $(this).parent().find("#tour_photo_con_id").text();
			var typeId = $(this).parent().find("#tour_photo_con_type_id").text();
			var mapx = $(this).parent().find("#tour_photo_con_mapx").text();
			var mapy = $(this).parent().find("#tour_photo_con_mapy").text();
			
			console.log("this -> "+$(this));
			console.log("intro 눌렀을 때 title = "+title);
			console.log("intro 눌렀을 때 addr = "+addr);
			console.log("intro 눌렀을 때 id = "+id);
			console.log("intro 눌렀을 때 typeId = "+typeId);
			console.log("intro 눌렀을 때 mapx = "+mapx);
			console.log("intro 눌렀을 때 mapy = "+mapy);
			//주소를 가지고 마커 찍어주고 info 설정해서 띄움.
			//주소->좌표 변환
			/* naver.maps.Service.geocode({   <--- 필요 없을듯
				query: addr
				}, function(status, response){
				if(status !== naver.maps.Service.Status.OK){
					return alert("Something wrong!");
				}
				//주소의 정보가 response에 json객체가 담김
				var result = response.v2,
					items = result.items;
				
				//위도좌표
				Lng = response.v2.addresses[0].y;
				//경도좌표
				Lat = response.v2.addresses[0].x; */
				
				// 마커위 infowindow의 모양을 정의
			var contentString = [
					'<div class="map-box" onclick="intro(this)">',
						'<img class="map-img" src='+image+'>',
						'<span class="map-title">'+title+'</span>',
						'<span id="id" style="display:none;">'+id+'</span>',
						'<span id="type-id" style="display:none;">'+typeId+'</span>',
						'<span id="image" style="display:none;">'+image+'</span>',
						'<span id="title" style="display:none;">'+title+'</span>',
						'<span id="map-cancel" onclick="infoCancel()">x</span>',
					'</div>'
				].join('');
			
			
			// 마커 위에 infowindow를 정의
			var infowindow = new naver.maps.InfoWindow({
				content: contentString,
				maxWidth: 145,
				backgroundColor:"#0080ff",
				borderColor:"#0080ff",
				anchorColor: "#0080ff",
				disableAnchor:true,
				borderWidth: 0,
				pixelOffset: new naver.maps.Point(0, -5)
			});
			
			//infowindow 관리
			infowindowObj=infowindow;
			
			var afterMap = mapArr[basketSeq];
			console.log("basketSeq : "+basketSeq);
			//마커 옵션정의.-> 이미지 아이콘 사용
			var markerOptions = {
					position: new naver.maps.LatLng(mapy, mapx),
					map: afterMap,
					icon:{
						url: '/img/파란색.png',
						size: new naver.maps.Size(30,34),
						scaledSize: new naver.maps.Size(30, 34),
					        origin: new naver.maps.Point(0, 0),
					        anchor: new naver.maps.Point(12,34)
					}	
				};
			
			/* naver.maps.Event.addListener(marker, 
				"click",function(e){
				if(infowindow.getMap()){
					infowindow.close();
				}else{
					infowindow.open(map,marker);
				}
			}); */
			
			//파란색 마커는 다 지움
			//forEach 쓸 때 매개변수 순서 중요 (값,키)
			console.log(markerMap.size);
			markerMap.forEach((value,key) => {
				value.setMap(null);
				value = null;
				markerMap.delete(key);
			});
				
			//표시와 동시에 info 뿌림.
			
			var marker = new naver.maps.Marker(markerOptions);
			infowindow.open(afterMap,marker);
			
			//마커 맵에 생성한 마커 저장.
			/* markerMap[title] = marker; */
			markerMap.set(title,marker);

			//});
		});

		//장바구니에 여행지 추가
		$(document).on("click",".tour_photoList_tourist_basket",function(){
			if(dayListBool != 0){
			var title = $(this).parent().find("#tour_photo_title").text();
			//먼저 해당 여행지가 장바구니에 있는지 확인 - basketTitleArr에서 확인
			if(basketAllArr[basketSeq] == null || basketAllArr[basketSeq].indexOf(title) == -1){
				var basketBody = $("#basket-day-"+basketSeq);
				var basketAfterCon = $("<div class='basket-after-con'></div>");
				
				var image = $(this).parent().find("#tour_photoList_tourist_img").attr("src");
				var addr = $(this).parent().find("#tour_photo_addr").text();
				var mapx = $(this).parent().find("#tour_photo_con_mapx").text();
				var mapy = $(this).parent().find("#tour_photo_con_mapy").text();
				
				//장바구나에 넣을 때  맵 생성해서 planList에 넣어줌.
				var tourConMap = new Map();
				tourConMap["title"] = title;
				tourConMap["addr"] = addr;
				tourConMap["image"] = image;
				tourConMap["mapx"] = mapx;
				tourConMap["mapy"] = mapy;
				tourConMap["date"] = dateList[basketSeq];
				console.log("basket click - basketSeq : " +basketSeq);
				console.log("tourConMap - title : " + tourConMap["title"]);
				console.log("tourConMap - date : " + tourConMap["date"]);
				planList[basketSeq].push(tourConMap);
				console.log(planList);
				
				//이미지 태그를 생성해서 넣어줌.
				$("<img src="+image+" class='basket-img' width='50' height='50'>").appendTo(basketAfterCon);
				$("<div class='basket-con'> <span class='basket-title'>"+title+"</span><br><span class='basket-addr'>"+addr+"</span><img src='/img/취소2.png' width='20' height='20' style='cursor:pointer;opacity:0.5; float:right;' class='basket-cancel' style='float:right'><img src='/img/업버튼.png' width='20' height='20' style='margin-right:5px; cursor:pointer;opacity:0.5; float:right;' class='basket-up' style='float:right'><img src='/img/다운버튼.png' width='20' height='20' style='margin-right:5px;cursor:pointer;opacity:0.5; float:right;' class='basket-down' style='float:right'></div>").appendTo(basketAfterCon);
				
				basketAfterCon.appendTo(basketBody);
				//배열에 추가
				basketAllArr[basketSeq].push(title);
				
				//추가 되었을 때, 지도에 마커 표시
				/* naver.maps.Service.geocode({
					query: addr
					}, function(status, response){
					if(status !== naver.maps.Service.Status.OK){
						return alert("Something wrong!");
					}
					//주소의 정보가 response에 json객체가 담김
					var result = response.v2,
						items = result.items;
					
					//위도좌표
					Lng = response.v2.addresses[0].y;
					//경도좌표
					Lat = response.v2.addresses[0].x; */
					
					// 마커위 infowindow의 모양을 정의
					/*
					var contentString = [
							'<div class="map-box">',
								'<span class="map-title">'+title+'</span>',
							'</div>'
						].join('');
					
					// 마커 위에 infowindow를 정의
					var infowindow = new naver.maps.InfoWindow({
						content: contentString,
						
						maxWidth: 145,
						backgroundColor:"#0080ff",
						borderColor:"#0080ff",
						anchorColor: "#0080ff",
						disableAnchor:true,
						borderWidth: 0,
						pixelOffset: new naver.maps.Point(0, -5)
					});
					*/
					
					var div2 = $("<div class='basket-map-box'><span class='map-title'>"+title+"</span></div>");
			 		var point2 = new naver.maps.LatLng(mapy,mapx);
			 		var overlay = new CustomOverlay({
			 			position:point2,
			 			map:mapArr[basketSeq]
			 			},div2);
			 		
			 		//오버레이 맵에 저장.
			 		//overlayMap.set(title,overlay);
			 		overlayMap[title] = overlay;
					
					
					var markerOptions = {
						position: new naver.maps.LatLng(mapy, mapx),
						map:mapArr[basketSeq],
						icon:{
							url: '/img/빨간색.png',
							size: new naver.maps.Size(30,34),
							scaledSize: new naver.maps.Size(30, 34),
 					        origin: new naver.maps.Point(0, 0),
 					        anchor: new naver.maps.Point(12,34)

						}	
					};
					
					var marker = new naver.maps.Marker(markerOptions);
					
					//polyline push
					console.log("basketSeq : "+ basketSeq);
					console.log("polyArr[basketSeq] : "+polyArr[basketSeq]);
					var path = polyArr[basketSeq].getPath();
					path.push(new naver.maps.LatLng(mapy,mapx));
					console.log("getPath() : "+polyArr[basketSeq].getPath().getAt(0));
					console.log("getPath() : "+polyArr[basketSeq].getPath().getAt(1));
					
					
					//마커 맵에 생성한 마커 저장.
					//basketMarkerMap[title] = marker;
					basketMarkerAllArr[basketSeq][title] = marker;
					//basketMarkerMap.set(title,marker);
					
					/* naver.maps.Event.addListener(marker, 
						"click",function(e){
						if(infowindow.getMap()){
							infowindow.close();
						}else{
							infowindow.open(map,marker);
						}
					}); 
					infowindow.open(map,marker);*/
					
					
				//});
				
				var basketPoint = new Array();
				basketPoint.push(mapy);
				basketPoint.push(mapx);
				basketPointArr[basketSeq].push(basketPoint);
				console.log("basket담기 - basketPointArr : "+basketPointArr);
			
			}else{
				alert("장바구니에 이미 담겨있습니다.")
			}
			}
		});
		
		//장바구니에서 여행지 삭제
 		$(document).on("click",".basket-cancel",function(){
 			
 			var index = $(this).parent().parent().index();
 			//해당 this 태그 삭제
 			$(this).parent().parent().remove();
 			//장바구니 배열에서 삭제
 			var title = $(this).parent().find(".basket-title").text();
 			
 			//idx는 중복 확인을 위해서만 쓰기.
 			var idx = basketAllArr[basketSeq].indexOf(title);
 			if(idx > -1) basketAllArr[basketSeq].splice(idx, 1);
 			console.log("장바구니 삭제 후 basketTitleArr : "+ basketAllArr[basketSeq]);
 			
 			//맵에서 해당지역 마커 삭제
 			basketMarkerAllArr[basketSeq][title].setMap(null);
 			basketMarkerAllArr[basketSeq][title] = null;
 			basketMarkerAllArr[basketSeq].delete(title); 			
 			
 			//맵에서 해당지역 오버레이 삭제
 			overlayMap[title].setMap(null);
 			overlayMap[title] = null;
 			overlayMap.delete(title);
 			
 			//좌표 배열에서 해당 좌표 삭제
 			basketPointArr[basketSeq].splice(index,1);
 			// 해당 좌표 poly path에서 삭제.	
 			/* for(var k = 0 ; k < polyArr[basketSeq].getPath().getLength();k++){
 				console.log("X 전 polyPath "+k+" : " + polyArr[basketSeq].getPath().getAt(k));
 			} */
 			//console.log("x 전 index : "+idx);
 			console.log("cancel - index : "+index);
 			
 			var polyPath = polyArr[basketSeq].getPath();
 			for(var i = 0; i < polyPath.getLength(); i++){
 				console.log("삭제 전 polyPath : "+polyPath.getAt(i));
 			}
 			polyPath.removeAt(index);
 			for(var i = 0; i < polyPath.getLength(); i++){
 				console.log("삭제 후 polyPath : "+polyPath.getAt(i));
 			}
 			//console.log("x 후 index : "+idx);
 			/* for(var k = 0 ; k < polyArr[basketSeq].getPath().getLength();k++){
 				console.log("X 후 polyPath "+k+" : " + polyArr[basketSeq].getPath().getAt(k));
 			} */
 			planList[basketSeq].splice(index,1);
 			
 	
 		});
		
 		$(document).on("click",".basket-up",function(){
 			
 			// 부모 구해서 전꺼(prev()) 뒤로 가게 하면될듯
 			var index = $(this).parent().parent().index();
 			for(var k = 0 ; k < planList[basketSeq].length; k++){
 				console.log("up 전 planList[basketSeq]["+k+"]"+planList[basketSeq][k].title);
 			}
 			/* console.log("up 전 planList : "+planList[basketSeq][index].title);
 			for(var k = 0 ; k < polyArr[basketSeq].getPath().getLength(); k++){
				console.log("up 전 polypath "+k+" : "+polyArr[basketSeq].getPath().getAt(k));
			} */
 			var nowDiv = $(this).parent().parent();
 			var preDiv = $(this).parent().parent().prev();
 			if(preDiv[0]){
 				preDiv.before(nowDiv);
 			}
 			if(index != 0){
 				var temp = planList[basketSeq][index];
 				planList[basketSeq][index] = planList[basketSeq][index-1];
 				planList[basketSeq][index-1] = temp;
 				
 				for(var k = 0 ; k < planList[basketSeq].length; k++){
 					console.log("up 후 planList[basketSeq]["+k+"]"+planList[basketSeq][k].title);
 				}	
 				//좌표 배열 재배치
 				var temp = basketPointArr[basketSeq][index];
 				basketPointArr[basketSeq][index] = basketPointArr[basketSeq][index-1];
 				basketPointArr[basketSeq][index-1] = temp;
 				
 				console.log("polyPath 계산시작");
 				var polyPath = polyArr[basketSeq].getPath();
 				for(var i = 0; i < polyPath.getLength(); i++){
 					console.log("up 전  polyPath : " + polyPath.getAt(i));
 				}
 				polyPath.insertAt(index-1,polyPath.removeAt(index));
 				
 				
 				/* var temp = polyPath.getAt(index);
 				polyPath.insertAt(index,polyPath.getAt(index-1));
 				polyPath.insertAt(index-1,temp); */
 				
 				for(var i = 0; i < polyPath.getLength(); i++){
 					console.log("up 후 polyPath : " + polyPath.getAt(i));
 				}
 				
 				
 				//poly path 비우고 재배치된 basketPointArr에서 좌표 꺼내서 push
 	 			/* polyArr[basketSeq].getPath().clear();
 	 			for(var i = 0; i < basketPointArr.length; i++){
 	 				console.log("mapy : "+basketPointArr[basketSeq][i][0]+" mapx : "+basketPointArr[basketSeq][i][1]);
 	 				console.log("basketPointArr : "+basketPointArr);
 	 				var point = new naver.maps.LatLng(basketPointArr[basketSeq][i][0],basketPointArr[basketSeq][i][1]);
 	 				polyArr[basketSeq].getPath().push(point);
 	 			} */
 			}
 			/* console.log("up 후 planList : "+planList[basketSeq][index].title);
 			for(var k = 0 ; k < polyArr[basketSeq].getPath().getLength(); k++){
				console.log("up 후 polypath "+k+" : "+polyArr[basketSeq].getPath().getAt(k));
			} */
	
 			
 			
 			
 		});
		$(document).on("click",".basket-down",function(){
			var index = $(this).parent().parent().index();
			/* console.log("down 전 planList : "+planList[basketSeq][index].title);
			for(var k = 0 ; k < polyArr[basketSeq].getPath().getLength(); k++){
				console.log("down 전 polypath "+k+" : "+polyArr[basketSeq].getPath().getAt(k));
			} */
			console.log("down 전 polypath : "+polyArr[basketSeq].getPath());
			var nowDiv = $(this).parent().parent();
			var nextDiv = $(this).parent().parent().next();
			if(nextDiv[0]){
				nextDiv.after(nowDiv);
			}	
			console.log("planList[basketSeq].length : "+planList[basketSeq].length);
			console.log("index : "+index);
			if(index < planList[basketSeq].length-1){
 				var temp = planList[basketSeq][index];
 				planList[basketSeq][index] = planList[basketSeq][index+1];
 				planList[basketSeq][index+1] = temp;
 				
 				//좌표 배열 재배치
 				var temp = basketPointArr[basketSeq][index];
 				basketPointArr[basketSeq][index] = basketPointArr[basketSeq][index+1];
 				basketPointArr[basketSeq][index+1] = temp;
 				
 				console.log("polyPath 계산시작");
 				var polyPath = polyArr[basketSeq].getPath();
 				polyPath.insertAt(index+1,polyPath.removeAt(index));
 				
 				/* //poly path 비우고 재배치된 basketPointArr에서 좌표 꺼내서 push
 				polyArr[basketSeq].getPath().clear();
 	 			for(var i = 0; i < basketPointArr.length; i++){
 	 				var point = new naver.maps.LatLng(basketPointArr[basketSeq][i][0],basketPointArr[basketSeq][i][1]);
 	 				console.log("mapy : "+basketPointArr[basketSeq][i][0]+" mapx : "+basketPointArr[basketSeq][i][1]);
 	 				polyArr[basketSeq].getPath().push(point);
 	 			} */
 			}
			/* console.log("down 후 planList : "+planList[basketSeq][index].title);
			for(var k = 0 ; k < polyArr[basketSeq].getPath().getLength(); k++){
				console.log("down 후 polypath "+k+" : "+polyArr[basketSeq].getPath().getAt(k));
			} */
			

 		});
		//info안의 x눌렀을 때 마커 삭제
		/* $(document).on("click",".map-box",function(){
			console.log("!");
			//해당 타이틀 꺼내옴.
			var title = $(this).prev().text();
			//맵에서 해당 마커 없앰.
			markerMap[title].setMap(null);
			//그리고 마커 할당 해제해주고, markerMap에서 없앰.
			markerMap[title] = null;
			markerMap.delete(title);
			console.log("!");
		}); */
		
/* 		$(".map-cancel").on("click",function(){
			console.log("!");
			//해당 타이틀 꺼내옴.
			var title = $(this).prev().text();
			//맵에서 해당 마커 없앰.
			markerMap[title].setMap(null);
			//그리고 마커 할당 해제해주고, markerMap에서 없앰.
			markerMap[title] = null;
			markerMap.delete(title);
			console.log("!");
		});
 */		
 
 		//좌표간 경로 구하는 방법
 		/* console.log("Distance : "+Math.round(map.getProjection().getDistance(naver.maps.LatLng(37.5855900,127.0420500),
 						naver.maps.LatLng(37.5618946,127.0078812)))); */	
 		
 						

 						
 		//드래그 앤 드랍 이벤트
		/* $(document).on("drop",".basket-after-con",function(e){
			console.log("drop");
 			var dt = e.originalEvent.dataTransfer;
 			dt.dropEffect = "copy";
 			dt.getData("text");
 			e.target.appendChild(document.getElementById(data));
 			e.preventDefault();
		});	 */
 						
 		/* $(function(){				
	 		$(".tour_photoList_tourist").on("dragstart",function(e){
	 			var dt = e.originalEvent.dataTransfer;
	 			dt.effectAllowed = "copyMove";
	 			dt.setData("text",e.target.id);
	 			console.log("dragStart");
	 			console.log(e.target.id);
	 			e.dataTransfer.setData("text",e.target.id); });
	 						
	 		$("#basket-after-con").on("dragover",function(e){
	 			console.log("dragover");
	 			var dt = e.originalEvent.dataTransfer;
	 			dt.dropEffect = "copy";
	 			e.preventDefault();
	 		});
	 		
	 		$("#basket-after-con").on("drop",function(e){
	 			console.log("drop");
	 			var dt = e.originalEvent.dataTransfer;
	 			dt.dropEffect = "copy";
	 			dt.getData("text");
	 			e.target.appendChild(document.getElementById(data));
	 			e.preventDefault();
	 		}); */
	 		
	 		//검색어 2글자 이상 일 때 해당 입력어를 여행지 이름으로 광광지 api 호출
	 		$("#stayBtn").click(function(){
	 			category = 32;
	 			console.log("ac : "+areaSeq);
	 			$.ajax({
	 				url:"/searchResList",
	 				type:"get",
	 				data:{areaSeq:areaSeq,category:category},
	 				contentType: "application/json; charset=UTF-8",
	 				success: function(data){
	 					console.log(data[0]);
	 					console.log(data[0].touristAddr);
	 					
	 			 	//원래 div 삭제
	 				$(".tour_photoList_tourist").remove();
	 				//여기서 div 하나 추가하고 각각 여행지에 대한 정보 들어가있는 div 만들어서
	 				//처음만든 div에 넣어주면댐
	 				for(var i = 0; i < data.length; i++){	
	 					var addr = data[i].touristAddr;
	 					var title = data[i].touristTitle;
	 					var img = data[i].touristImg;
	 					var conId = data[i].touristConId;
	 					var id = data[i].touristId;
	 					var mapx = data[i].mapx;
	 					var mapy = data[i].mapy;
	 					
	 					var touristScroll = $("#tour_photoList_tourist_wrap_scroll");
	 					
	 					$("<div class='tour_photoList_tourist'><img id='tour_photoList_tourist_img' width='50' height='50' src='"+img+"'>"
	 							+"<div id='tour_photoList_tourist_content'>"
	 								+"<span id='tour_photo_title'>"+title+"</span><br>"
	 								+"<span id='tour_photo_addr'>"+addr+"</span>"
	 								+"<span id='tour_photo_con_id'>"+id+"</span>"
	 								+"<span id='tour_photo_con_type_id'>"+conId+"</span>"
	 								+"<span id='tour_photo_con_mapx'>"+mapx+"</span>"
	 								+"<span id='tour_photo_con_mapy'>"+mapy+"</span>"
	 							+"</div>"
	 							+"<div class='tour_photoList_tourist_basket'>"
	 								+"<img width='20' height='20' src='/img/장바구니.png'>"
	 							+"</div>"
	 							+"<div class='tour_photoList_tourist_intro'>"
	 								+"<img width='20' height='20' src='/img/검정핀.png'>"
	 							+"</div>"
	 						+"</div>").appendTo(touristScroll);	
	 					}
	 	
	 				} 
	 			});
	 		});
	 		
	 		
	 		
	 		
	 		
	 		
	 		$("#tourBtn").click(function(){
				category = 12;
	 			$.ajax({
	 				url:"/searchResList",
	 				type:"get",
	 				data:{areaSeq:areaSeq,category:category},
	 				contentType: "application/json; charset=UTF-8",
	 				success: function(data){
	 					console.log(data[0]);
	 					console.log(data[0].touristAddr);
	 					
	 			 	//원래 div 삭제
	 				$(".tour_photoList_tourist").remove();
	 				//여기서 div 하나 추가하고 각각 여행지에 대한 정보 들어가있는 div 만들어서
	 				//처음만든 div에 넣어주면댐
	 				for(var i = 0; i < data.length; i++){	
	 					var addr = data[i].touristAddr;
	 					var title = data[i].touristTitle;
	 					var img = data[i].touristImg;
	 					var conId = data[i].touristConId;
	 					var id = data[i].touristId;
	 					var mapx = data[i].mapx;
	 					var mapy = data[i].mapy;
	 					var touristScroll = $("#tour_photoList_tourist_wrap_scroll");
	 					
	 					$("<div class='tour_photoList_tourist'><img id='tour_photoList_tourist_img' width='50' height='50' src='"+img+"'>"
	 							+"<div id='tour_photoList_tourist_content'>"
	 								+"<span id='tour_photo_title'>"+title+"</span><br>"
	 								+"<span id='tour_photo_addr'>"+addr+"</span>"
	 								+"<span id='tour_photo_con_id'>"+id+"</span>"
	 								+"<span id='tour_photo_con_type_id'>"+conId+"</span>"
	 								+"<span id='tour_photo_con_mapx'>"+mapx+"</span>"
	 								+"<span id='tour_photo_con_mapy'>"+mapy+"</span>"
	 							+"</div>"
	 							+"<div class='tour_photoList_tourist_basket'>"
	 								+"<img width='20' height='20' src='/img/장바구니.png'>"
	 							+"</div>"
	 							+"<div class='tour_photoList_tourist_intro'>"
	 								+"<img width='20' height='20' src='/img/검정핀.png'>"
	 							+"</div>"
	 						+"</div>").appendTo(touristScroll);	
	 					}
	 	
	 				} 
	 			});
	 		});
	 		
	 		$("#resBtn").click(function(){
	 			category = 39;
	 		
	 			$.ajax({
	 				url:"/searchResList",
	 				type:"get",
	 				data:{areaSeq:areaSeq,category:category},
	 				contentType: "application/json; charset=UTF-8",
	 				success: function(data){
	 					console.log(data[0]);
	 					console.log(data[0].touristAddr);
	 					console.log(data[0].touristConId);
	 					console.log(data[0].touristId);
	 					
	 			 	//원래 div 삭제
	 				$(".tour_photoList_tourist").remove();
	 				//여기서 div 하나 추가하고 각각 여행지에 대한 정보 들어가있는 div 만들어서
	 				//처음만든 div에 넣어주면댐
	 				var touristScroll = $("#tour_photoList_tourist_wrap_scroll");
	 				for(var i = 0; i < data.length; i++){	
	 					var addr = data[i].touristAddr;
	 					var title = data[i].touristTitle;
	 					var img = data[i].touristImg;
	 					var conId = data[i].touristConId;
	 					var id = data[i].touristId;
	 					var mapx = data[i].mapx;
	 					var mapy = data[i].mapy;
	 					
	 					$("<div class='tour_photoList_tourist'><img id='tour_photoList_tourist_img' width='50' height='50' src='"+img+"'>"
	 							+"<div id='tour_photoList_tourist_content'>"
	 								+"<span id='tour_photo_title'>"+title+"</span><br>"
	 								+"<span id='tour_photo_addr'>"+addr+"</span>"
	 								+"<span id='tour_photo_con_id'>"+id+"</span>"
	 								+"<span id='tour_photo_con_type_id'>"+conId+"</span>"
	 								+"<span id='tour_photo_con_mapx'>"+mapx+"</span>"
	 								+"<span id='tour_photo_con_mapy'>"+mapy+"</span>"
	 							+"</div>"
	 							+"<div class='tour_photoList_tourist_basket'>"
	 								+"<img width='20' height='20' src='/img/장바구니.png'>"
	 							+"</div>"
	 							+"<div class='tour_photoList_tourist_intro'>"
	 								+"<img width='20' height='20' src='/img/검정핀.png'>"
	 							+"</div>"
	 						+"</div>").appendTo(touristScroll);	
	 					}
	 	
	 				} 
	 			});
	 		});
	 		
	 		$("#shopBtn").click(function(){
	 			category = 38;
	 			$.ajax({
	 				url:"/searchResList",
	 				type:"get",
	 				data:{areaSeq:areaSeq,category:category},
	 				contentType: "application/json; charset=UTF-8",
	 				success: function(data){
	 					console.log(data[0]);
	 					console.log(data[0].touristAddr);
	 					
	 			 	//원래 div 삭제
	 				$(".tour_photoList_tourist").remove();
	 				//여기서 div 하나 추가하고 각각 여행지에 대한 정보 들어가있는 div 만들어서
	 				//처음만든 div에 넣어주면댐
	 				for(var i = 0; i < data.length; i++){	
	 					var addr = data[i].touristAddr;
	 					var title = data[i].touristTitle;
	 					var img = data[i].touristImg;
	 					var conId = data[i].touristConId;
	 					var id = data[i].touristId;
	 					var mapx = data[i].mapx;
	 					var mapy = data[i].mapy;
	 					var touristScroll = $("#tour_photoList_tourist_wrap_scroll");
	 					
	 					$("<div class='tour_photoList_tourist'><img id='tour_photoList_tourist_img' width='50' height='50' src='"+img+"'>"
	 							+"<div id='tour_photoList_tourist_content'>"
	 								+"<span id='tour_photo_title'>"+title+"</span><br>"
	 								+"<span id='tour_photo_addr'>"+addr+"</span>"
	 								+"<span id='tour_photo_con_id'>"+id+"</span>"
	 								+"<span id='tour_photo_con_type_id'>"+conId+"</span>"
	 								+"<span id='tour_photo_con_mapx'>"+mapx+"</span>"
	 								+"<span id='tour_photo_con_mapy'>"+mapy+"</span>"
	 							+"</div>"
	 							+"<div class='tour_photoList_tourist_basket'>"
	 								+"<img width='20' height='20' src='/img/장바구니.png'>"
	 							+"</div>"
	 							+"<div class='tour_photoList_tourist_intro'>"
	 								+"<img width='20' height='20' src='/img/검정핀.png'>"
	 							+"</div>"
	 						+"</div>").appendTo(touristScroll);	
	 					}
	 	
	 				} 
	 			});
	 		});
	 		
	 		
	 		$("#seol").on("click",function(){
	 			areaSeq = 1;
	 			nowPosition = seoul;
	 			console.log(areaSeq);
	 			mapArr[basketSeq].panTo(new naver.maps.LatLng(37.5665734, 126.978179));
	 		});
	 		$("#incheon").on("click",function(){
 				areaSeq = 2;
 				console.log(areaSeq);
 				mapArr[basketSeq].panTo(new naver.maps.LatLng(37.4558138, 126.705050));
 			});
	 		$("#degoo").on("click",function(){
	 			areaSeq = 4;
 				console.log(areaSeq);
 				mapArr[basketSeq].panTo(new naver.maps.LatLng(35.8715288, 128.601501));
 			});
	 		$("#degyoen").on("click",function(){
	 			areaSeq = 3;
 				console.log(areaSeq);
 				mapArr[basketSeq].panTo(new naver.maps.LatLng(36.3501622, 127.385712));
 			});
	 		$("#gwangjoo").on("click",function(){
	 			areaSeq = 5;
 				console.log(areaSeq);
 				mapArr[basketSeq].panTo(new naver.maps.LatLng(37.4291906, 127.254372));
 			});
	 		$("#busan").on("click",function(){
	 			areaSeq = 6;
 				position = busan;
 				console.log(areaSeq);
 				mapArr[basketSeq].panTo(new naver.maps.LatLng(35.1797865, 129.0750194));
 			});	
	 		
	 		$("#intro").click(function(){
	 			$.ajax({
	 				url:"/introTourist",
	 				type:"get",
	 				contentType: "application/json; charset=UTF-8",
	 				success: function(data){
	 					console.log("성공");
	 					console.log(data);
/* 	 					console.log(data[0]);
	 					console.log(data[0].touristAddr); */
	 				}
	 			});
	 		});

			function intro(obj){
				//이거 눌렀을 때 새로운창으로 소개페이지를 띄워줌.
				//보내는 값은 contypeid,conid
				var typeId = $(obj).find("#type-id").text();
				var id = $(obj).find("#id").text();
				var image = $(obj).find("#image").text();
 				var title2 = $(obj).find("#title").text();
 				var url = "";
				console.log("this : "+$(obj));
				console.log("this->className : "+$(obj).attr('class'));
				console.log("this->tagName : " +$(obj).tagName);
				console.log("conId : "+typeId);
				console.log("id : "+id);
				console.log("title : "+title );
				var title = "";

				//창띄우기
				//location.href="/introRes?conId=conId&id=id";

				//typeId=" + typeId +"&id=" +id
				console.log("if문 전 typeId : "+typeId);
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
				
				var status = "left=0px, top=0px, width=2000px, height=2000px, menubar-no, status=no, scrollbar=yes";
				
				var popup = window.open("",title,status); //빈창 오픈
				
				info.id.value = id;
				info.typeId.value = typeId;
				info.image.value = image;
				console.log("plan.jsp - image : "+image);
				info.title.value = title2;
				info.index.value = "1";
				console.log("plan.jsp - index : "+$("#form-index").val());
				info.target = title;
				info.action = url;
				info.method = "post";
				
				info.submit();

			}
			
			//관광지 소개 페이지 이동
			function infoCancel(){
				//이벤트 버블링 제거.
				event.stopPropagation();
				
				console.log("info x버튼 클릭");
				//맵에 해당 마커 및 info 지우기.
				
				var map = mapArr[basketSeq];
				var marker = markerMap[basketSeq];
				console.log("map : "+map+"marker : " +marker);
				
				console.log(markerMap.size);
				
				markerMap.forEach((value,key) => {
					value.setMap(null);
					value = null;
					markerMap.delete(key);
				});
				
				infowindowObj.close();
				console.log(markerMap.size);
			}
			
			//즐겨찾기된 리스트 조회
			$("#clipBtn").on("click",function(){
				//clip db에서 꺼내옴
				$.ajax({
					url : "/loadClip",
					type : "get",
					contentType : "application/json; charset=utf-8",
					success : function(data){
							console.log("loadClip 송수신 성공");
							console.log("수신 data : "+data);
							
							//받아온 data 뿌림
							$(".tour_photoList_tourist").remove();
							var touristScroll = $("#tour_photoList_tourist_wrap_scroll");
							
							for(var i = 0; i < data.length; i++){
								var clipTitle = data[i].clipTitle;
								var clipImage = data[i].clipImage;
								var clipAddr = data[i].clipAddr;
								var mapx = data[i].mapx;
								var mapy = data[i].mapy;
								var id = data[i].id;
								var typeId = data[i].typeId;
			 					
			 					$("<div class='tour_photoList_tourist'><img id='tour_photoList_tourist_img' width='50' height='50' src='"+clipImage+"'>"
			 							+"<div id='tour_photoList_tourist_content'>"
			 								+"<span id='tour_photo_title'>"+clipTitle+"</span><br>"
			 								+"<span id='tour_photo_addr'>"+clipAddr+"</span>"
			 								+"<span id='tour_photo_con_id'>"+id+"</span>"
			 								+"<span id='tour_photo_con_type_id'>"+typeId+"</span>"
			 								+"<span id='tour_photo_con_mapx'>"+mapx+"</span>"
			 								+"<span id='tour_photo_con_mapy'>"+mapy+"</span>"
			 							+"</div>"
			 							+"<div class='tour_photoList_tourist_basket'>"
			 								+"<img width='20' height='20' src='/img/장바구니.png'>"
			 							+"</div>"
			 							+"<div class='tour_photoList_tourist_intro'>"
			 								+"<img width='20' height='20' src='/img/검정핀.png'>"
			 							+"</div>"
			 							+"<div class='tour_photoList_tourist_cancel'>"
	 										+"<img width='20' height='20' src='/img/취소2.png'>"
	 									+"</div>"
			 						+"</div>").appendTo(touristScroll);	
							}
							
					},
					error : function(){
							console.log("loadClip 송수신 실패");
					}
	 			});
			});
			
			$(document).on("click",".tour_photoList_tourist_cancel",function(){
				var id = $(this).parent().find("#tour_photo_con_id").text();
				var index = $(this).parent().index;
				
				
				console.log("clip 취소 버튼 눌렀을 때 id : "+id );
				//clip DB에서 뺸 뒤 다시 조회
				$.ajax({
					url : "/deleteClip",
					type : "get",
					contentType : "application/json; charset=utf-8",
					data : {id:id},
					success : function(data){
						console.log("deleteClip 송수신 성공");
						console.log("수신 data : "+data);
						
						//받아온 data 뿌림
						$(".tour_photoList_tourist").remove();
						var touristScroll = $("#tour_photoList_tourist_wrap_scroll");
						
						for(var i = 0; i < data.length; i++){
							var clipTitle = data[i].clipTitle;
							var clipImage = data[i].clipImage;
							var clipAddr = data[i].clipAddr;
							var mapx = data[i].mapx;
							var mapy = data[i].mapy;
							var id = data[i].id;
							var typeId = data[i].typeId;
		 					
		 					$("<div class='tour_photoList_tourist'><img id='tour_photoList_tourist_img' width='50' height='50' src='"+clipImage+"'>"
		 							+"<div id='tour_photoList_tourist_content'>"
		 								+"<span id='tour_photo_title'>"+clipTitle+"</span><br>"
		 								+"<span id='tour_photo_addr'>"+clipAddr+"</span>"
		 								+"<span id='tour_photo_con_id'>"+id+"</span>"
		 								+"<span id='tour_photo_con_type_id'>"+typeId+"</span>"
		 							+"</div>"
		 							+"<div class='tour_photoList_tourist_basket'>"
		 								+"<img width='20' height='20' src='/img/장바구니.png'>"
		 							+"</div>"
		 							+"<div class='tour_photoList_tourist_intro'>"
		 								+"<img width='20' height='20' src='/img/검정핀.png'>"
		 							+"</div>"
		 							+"<div class='tour_photoList_tourist_cancel'>"
 										+"<img width='20' height='20' src='/img/취소2.png'>"
 									+"</div>"
		 						+"</div>").appendTo(touristScroll);	
						}
					},
					error : function(){
						console.log("deleteClip 송수신 실패");
					}
				});
				
			});
			
			function save(){
				var planJson = JSON.stringify(planList);
				route.planList.value = planJson;
				route.submit();
			}
			
			//최단거리 계산
			$(document).on("click","#shortest",function(){
				
				if(shortestCountArr[basketSeq] != 1){
					
				shortestCountArr[basketSeq] = 1;
				shortestBoolArr[basketSeq] = 1;
				var thisDiv = $(this);
				
				console.log("this - id"+$(this).attr("id"));
				//title 키로 사용하는 맵
				var searchTitle = new Map();
				console.log("최단거리 버튼 클릭함.");
				var distanceArr = new Array();
				//여행지 갯수
				var size = planList[basketSeq].length;
				//(여행지1,여행지2,거리) 리스트 구성
				console.log("planList[basketSeq].length : "+planList[basketSeq].length);
				for(var i = 0; i < planList[basketSeq].length;i++){
					console.log("i : "+i);
					var titleObj = new Map(); 
					var title = planList[basketSeq][i].title;
					var addr = planList[basketSeq][i].addr;
					var image = planList[basketSeq][i].image;
					var mapy = planList[basketSeq][i].mapy;
					var mapx = planList[basketSeq][i].mapx;
					var date = planList[basketSeq][i].date;
					
					console.log("planList에서 꺼낸 여행지 이름 : " + title);
					
					titleObj["title"] = title;
					titleObj["addr"] = addr;
					titleObj["image"] = image;
					titleObj["mapy"] = mapy;
					titleObj["mapx"] = mapx;
					titleObj["date"] = date;
					
					
					console.log("titleObj['title'] : "+titleObj["title"]);
					
					//searchTitle.title = titleObj;
					//searchTitle.set(title,titleObj);
					searchTitle[title] = titleObj;
					console.log("searchTitle[title] : "+searchTitle[title]);
					console.log("searchTitle[title]['title'] : "+searchTitle[title]["title"]);
					//console.log("searchTitle.get(title) : "+searchTitle.get("t"));
					//console.log("searchTitle.title : " + searchTitle.t);
					//searchTitle 맵을 통해서 해당 여행지 title과 관련된 정보를 꺼낼 수 있음.
					//console.log("searchTitle.get(title).['title'] : "+searchTitle.get(title)["title"]); -> 안됨.
					
					console.log("title : "+title+" mapy : "+mapy+"mapx : "+mapx);
					
					for(var j = i+1; j < planList[basketSeq].length; j++){
						var title2 = planList[basketSeq][j].title;
						var mapy2 = planList[basketSeq][j].mapy;
						var mapx2 = planList[basketSeq][j].mapx;
						console.log("j : "+j);
						var distance = Math.round(mapArr[basketSeq].getProjection().getDistance(naver.maps.LatLng(mapy,mapx),
								naver.maps.LatLng(mapy2,mapx2)));
						
						var distanceCon=[title,title2,distance];
						distanceArr.push(distanceCon);
						console.log("distanceArr.title : " + distanceCon[0] + "distanceArr.title2 : "+distanceCon[1] + "distanceArr.distance : "+distanceCon[2]);
					}
					
				}
				console.log(searchTitle);
				/* console.log("searchTitle[title]['title'] : "+searchTitle["The-K호텔서울 (더케이호텔서울)"]['title']);
				console.log("searchTitle[title]['title'] : "+searchTitle["오스카"]["title"]);
				console.log("searchTitle[title]['title'] : "+searchTitle["아미가인서울[한국관광 품질인증/Korea Quality]"]["title"]); */
				
				for(var k = 0; k < distanceArr.length; k++){
					console.log("distanceArr["+k+"].title1 : " +distanceArr[k][0]);
					console.log("distanceArr["+k+"].title2 : " + distanceArr[k][1]);
					console.log("distanceArr["+k+"].distance : " +distanceArr[k][2]);
				}
				
				//json으로 변환
				var distanceArr = JSON.stringify(distanceArr);
				$.ajax({
					url:"/mstRoute",
					type: "get",
					contentType : "application/json; charset=utf-8",
					data:{distanceArr:distanceArr,size:size},
					success:function(data){
						console.log("data 송수신 성공 ");
						console.log(data);
			
						//여기서 최단경로 결과 받아온 정보로
						//planList[basketSeq] 속 요소 전체 삭제.
						
						
						console.log("prePlanList[basketSeq] 전 : " + prePlanList[basketSeq]);
						console.log(prePlanList);
						console.log("Planlist ");
						console.log(planList[0][0]);
						
						prePlanList[basketSeq] = planList[basketSeq].slice();
						
						
						
						console.log(prePlanList[0][0]);
						
						console.log("prePlanList[basketSeq] 후 : " + prePlanList[basketSeq]);
						console.log(prePlanList);
						
						var size = planList[basketSeq].length;
						
						//planList 초기화.
						planList[basketSeq].splice(0,planList[basketSeq].length);
						console.log("rkwk");
						console.log(prePlanList[0][0]);
						//거리간 직선 재설정하고
						//되돌리기 가능해야되니까 최단거리전 경로 저장
						console.log("prePolyPath 넣기 전 : ");
						console.log("->" + prePolyPath);
						
						//prePolyPath = polyArr[basketSeq].getPath().getArray();
						
						console.log("polyArr[basketSeq].getPath().getArray() : " + polyArr[basketSeq].getPath().getArray());
						//console.log(prePolyPath = polyArr[basketSeq].getPath().getArray());
						
						console.log(polyArr[basketSeq].getPath().getArray()[0].x);
						console.log(polyArr[basketSeq].getPath().getArray()[0].y);
						
						
						for(var q = 0; q < size; q++){
							var preInArray = new Array();
							
							mapx4 = polyArr[basketSeq].getPath().getArray()[q].x;
							mapy4 = polyArr[basketSeq].getPath().getArray()[q].y;
							
							preInArray.push(mapx4);
							preInArray.push(mapy4);
							
							prePolyPath.push(preInArray);
						}
						
						console.log("prePolyPath 넣기 후 : ");
						console.log("-> " + prePolyPath);
						console.log(prePolyPath);
						
						
							
						var polyPath = polyArr[basketSeq].getPath();
						console.log("poly 전");
						console.log(polyPath);
						polyPath.clear();
						console.log("poly 후");
						console.log(polyPath);
						
						var basketBody = $("#basket-day-"+basketSeq);
						console.log("basketBody-id : "+basketBody.attr("id"));
						console.log("#basket-day-i - id: "+basketBody.attr("id"));
						
 						//장바구니 div 비우기
 						console.log("thisDiv"+thisDiv.attr("id"));
 						console.log("thisDiv2 : " + thisDiv.parent().prev().attr("id"));
						
 						
 						//basket-day-i 비우기
 						thisDiv.parent().prev().empty();
 						
						//basketPointArr 전체 삭제
 						basketPointArr[basketSeq].splice(0,basketPointArr[basketSeq].length);
						console.log("basketPointArr[basketSeq] 초기화 후 : ");
						console.log(basketPointArr[basketSeq]);
						
 						console.log("planList[basketSeq].length : "+size);
						for(var i = 0; i < size; i++){
							//해당 여행지 정보 searchTitle에서 찾아서 변수에 저장
							console.log("for-i : "+i);
							console.log("data[i] : " +data[i]);
							console.log("data[i].toString() : " +data[i].toString());
							console.log("data[i].toString()-length : " +data[i].toString().length);
							console.log("subString : "+data[i].substring(1,data[i].toString().length-1));
							
							var input = data[i].substring(1,data[i].toString().length-1);
							
							console.log("searchTitle[data[i]] : "+searchTitle[input]);
							console.log("searchTitle[data[i]]['title'] : "+searchTitle[input]["title"]);
							var title = searchTitle[input]["title"];
							console.log("searchTitle[data[i]].title : " +searchTitle[input]["title"]);
							var mapy3 = searchTitle[input]["mapy"];
							console.log("mapy3 : "+searchTitle[input]["mapy"]);
							var mapx3 = searchTitle[input]['mapx'];
							
							var addr = searchTitle[input]['addr'];
							var image = searchTitle[input]['image'];
							var date = searchTitle[input]['date'];
							//db 저장 맵리스트 수정
							var tourConMap = new Map();
							//찾은 정보를 planList에 넣기 위해 맵 초기화
							tourConMap["title"] = title;
							tourConMap["addr"] = addr;
							tourConMap["image"] = image;
							tourConMap["image"] = image;
							tourConMap["mapx"] = mapx;
							tourConMap["mapy"] = mapy;
							tourConMap["date"] = date;
							
							
							console.log("planList[basketSeq] 삭제 전 : "+planList[basketSeq]);
							console.log(planList[basketSeq]);
							
							
							
							planList[basketSeq].push(tourConMap);
							
							console.log("planList[basketSeq] 삭제 후 : "+planList[basketSeq]);
							console.log(planList[basketSeq]);
							
							console.log("polyPath 넣기 전 : ");
							console.log(polyPath.getArray());
							console.log("-> " +polyPath.getArray());
							console.log("->polyArr로 접근 " +polyArr[basketSeq].getPath().getArray());
							console.log("poly push 전");
							console.log(polyPath);
							polyPath.push(new naver.maps.LatLng(mapy3,mapx3));
							console.log("poly push");
							console.log(polyPath);
							console.log("polyPath 넣은 후 : ");
							console.log("-> " +polyPath.getArray());
							console.log("->polyArr로 접근 " +polyArr[basketSeq].getPath().getArray());
							
							/* var basketBody = $("#basket-day-"+basketSeq); -> basket-day-i
							console.log("#basket-day-i - id: "+basketBody.attr("id"));
							console.log("basketBody-id : "+basketBody.attr("id"));
							var basketAfterCon = $("<div class='basket-after-con'></div>");
							 */
							
							var basketAfterCon = $("<div class='basket-after-con'></div>");
							 
	 						$("<img src="+image+" class='basket-img' width='50' height='50'>").appendTo(basketAfterCon);
							 
							console.log("basketAfterCon - "+basketAfterCon.attr('id'));
							
	 						$("<div class='basket-con'> <span class='basket-title'>"+title+"</span><br><span class='basket-addr'>"+addr+"</span><img src='/img/취소2.png' width='20' height='20' style='cursor:pointer;opacity:0.5; float:right;' class='basket-cancel' style='float:right'><img src='/img/업버튼.png' width='20' height='20' style='margin-right:5px; cursor:pointer;opacity:0.5; float:right;' class='basket-up' style='float:right'><img src='/img/다운버튼.png' width='20' height='20' style='margin-right:5px;cursor:pointer;opacity:0.5; float:right;' class='basket-down' style='float:right'></div>").appendTo(basketAfterCon);
	 						
	 						basketAfterCon.appendTo(basketBody);
	 						
	 						console.log(basketBody.html());
	 						
	 						/* var basketBody = $("#basket-day-"+basketSeq);
	 						var basketAfterCon = $("<div class='basket-after-con'></div>");
	 						$("<img src="+image+" class='basket-img' width='50' height='50'>").appendTo(basketAfterCon);
	 						$("<div class='basket-con'> <span class='basket-title'>"+title+"</span><br><span class='basket-addr'>"+addr+"</span><img src='/img/취소2.png' width='20' height='20' style='cursor:pointer;opacity:0.5; float:right;' class='basket-cancel' style='float:right'><img src='/img/업버튼.png' width='20' height='20' style='margin-right:5px; cursor:pointer;opacity:0.5; float:right;' class='basket-up' style='float:right'><img src='/img/다운버튼.png' width='20' height='20' style='margin-right:5px;cursor:pointer;opacity:0.5; float:right;' class='basket-down' style='float:right'></div>").appendTo(basketAfterCon);
	 						
	 						basketAfterCon.appendTo(basketBody); */
	 				
	 						var basketPoint = new Array();
	 						basketPoint.push(mapy);
	 						basketPoint.push(mapx);
	 						basketPointArr[basketSeq].push(basketPoint);
						}
					},
					error:function(){
						console.log("data 송수신 실패 ");
					}
				});				
			}else{
				alert("이미 최단경로가 적용 되었습니다.");
			}
			});	
			
			//prePlanList
			
			$(document).on("click","#return",function(){
				if(shortestBoolArr[basketSeq] == 1){
					var thisDiv = $(this);
					shortestCountArr[basketSeq] = 0;
					shortestBoolArr[basketSeq] = 0;
					
					console.log("this - id"+$(this).attr("id"));
					//title 키로 사용하는 맵
	
					console.log("최단거리 버튼 클릭함.");
					//여행지 갯수
					var size = planList[basketSeq].length;
					//(여행지1,여행지2,거리) 리스트 구성
					console.log("planList[basketSeq].length : "+planList[basketSeq].length);
					//prePlanList[basketSeq] 꺼내면됨
					//var size = planList[basketSeq].length;
					
					planList[basketSeq].splice(0,planList[basketSeq].length);
							
					//거리간 직선 재설정하고
					//되돌리기 가능해야되니까 최단거리전 경로 저장
					//var prePolyPath = polyArr[basketSeq].getPath().getArray(); <- 저장 해놨음.
					var polyPath = polyArr[basketSeq].getPath();
					console.log("polyPath 출력1")
					console.log("->" + polyPath.getArray());
					console.log(polyPath.getArray()[0].x);
					console.log(polyPath.getArray()[0].y);
					
					
					polyPath.clear();
					console.log("polyPath 출력2");
					console.log("->" + polyPath.getArray());
					
					console.log("polyPath 에 prePolyPath 넣기 전 ");
					console.log("->" + polyArr[basketSeq].getPath().getArray());
					
					//polyPath = prePolyPath;
					console.log("prePolyPath.length : "+prePolyPath.length);
					for(var k = 0; k < prePolyPath.length; k++){
						
						var mapx5 = prePolyPath[k][0];
						var mapy5 = prePolyPath[k][1];
						
						console.log("mapx5, mapy5 : " + mapx5 +" / "+mapy5);
						
						var LatLng = new naver.maps.LatLng(mapy5,mapx5);
					
						polyPath.push(LatLng);
					}
					
					console.log("polyPath 에 prePolyPath 넣은 후 ");
					console.log("->" + polyArr[basketSeq].getPath().getArray());
							
					
					
					
					var basketBody = $("#basket-day-"+basketSeq);
					console.log("#basket-day-i - id: "+basketBody.attr("id"));
					
						//장바구니 div 비우기
					console.log("thisDiv : "+thisDiv.attr("id"));
					console.log("thisDiv2 : " + thisDiv.parent().prev().attr("id"));
					//basket-day-i 비우기
					thisDiv.parent().prev().empty();
					//basketPointArr 전체 삭제
					
					basketPointArr[basketSeq].splice(0,basketPointArr[basketSeq].length);
				
					console.log("prePlanList[basketSeq].length : " + prePolyPath.length);
					
					console.log("prePlanList[basketSeq] for문 들어가기 전 : " + prePlanList[basketSeq]);
					console.log(prePlanList);
					
					polyArr[basketSeq].getPath().clear();
					
					for(var i = 0; i < prePolyPath.length; i++){
						//해당 여행지 정보 searchTitle에서 찾아서 변수에 저장
						console.log("prePlan-i : "+i);
						
						var title = prePlanList[basketSeq][i]["title"];
						console.log("title1111111 : "+title);
						var mapy3 = prePlanList[basketSeq][i]["mapy"];
						var mapx3 = prePlanList[basketSeq][i]["mapx"];
						var addr = prePlanList[basketSeq][i]["addr"];
						var image = prePlanList[basketSeq][i]["image"];
						var date = prePlanList[basketSeq][i]["date"];
						//db 저장 맵리스트 수정
						var tourConMap = new Map();
						//찾은 정보를 planList에 넣기 위해 맵 초기화
						tourConMap["title"] = title;
						tourConMap["addr"] = addr;
						tourConMap["image"] = image;
						tourConMap["image"] = image;
						tourConMap["mapx"] = mapx3;
						tourConMap["mapy"] = mapy3;
						tourConMap["date"] = date;
						
						planList[basketSeq].push(tourConMap);
						
						console.log("planList[basketSeq] - tourConMap push 후: "+planList[basketSeq]);
						console.log(planList[basketSeq]);
						
						polyPath.push(new naver.maps.LatLng(mapy3,mapx3));
						console.log("polyPath : " + polyPath);
						console.log(polyPath.getArray());
						
						var basketAfterCon = $("<div class='basket-after-con'></div>");
						 
						$("<img src="+image+" class='basket-img' width='50' height='50'>").appendTo(basketAfterCon);
						console.log("basketAfterCon - "+basketAfterCon.attr('id'));
						$("<div class='basket-con'> <span class='basket-title'>"+title+"</span><br><span class='basket-addr'>"+addr+"</span><img src='/img/취소2.png' width='20' height='20' style='cursor:pointer;opacity:0.5; float:right;' class='basket-cancel' style='float:right'><img src='/img/업버튼.png' width='20' height='20' style='margin-right:5px; cursor:pointer;opacity:0.5; float:right;' class='basket-up' style='float:right'><img src='/img/다운버튼.png' width='20' height='20' style='margin-right:5px;cursor:pointer;opacity:0.5; float:right;' class='basket-down' style='float:right'></div>").appendTo(basketAfterCon);
						basketAfterCon.appendTo(basketBody);
						console.log(basketBody.html());
							
						var basketPoint = new Array();
						basketPoint.push(mapy3);
						basketPoint.push(mapx3);
						basketPointArr[basketSeq].push(basketPoint);
						
						console.log(polyArr[basketSeq].getPath());
					}
				}else{
					alert("최단거리 기능 수행 후 가능합니다.");
				}
			});
			
			$("#logo-div").on("click",function(){
				console.log("!");
				location.href="index.jsp";	
			});
			
			
	</script>
</body>
</html>
