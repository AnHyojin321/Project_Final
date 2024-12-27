<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>드래그 가능한 마커 생성하기</title>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=고유키들어갈자리"></script>    
	<style>
		body {
			margin : 0px;
			padding : 0px;
		}
		#outer {
			margin : auto;
			padding : 20px;
		}
		h1 {
			color : rgb(5, 0, 50);
		}
		#mapOuter {
			width: 100%;
			height : 600px;
			border: 5px solid rgb(5, 0, 50, 0.1);
			border-radius: 10px;
			padding:10px;
			box-sizing: border-box;
		}
		#map {
			
			display : flex;
			align-items : center;
		}
		p {
			color : rgb(150, 150, 150);
			font-size : 15px;
		}
	</style>
</head>
<body>
<jsp:include page="../common/header.jsp" />
	<div id="outer">	
		<h1>찾아오시는 길</h1>
		<div id="mapOuter">	
			<div id="map" style="width:100%;height:100%;"></div>   
		</div>
		<div>
			<p>
				서울특별시 영등포구 선유동2로 57 이레빌딩(구관) 19F, 20F
			</p>
			<p>
				당산역 (2호선, 9호선) 에서 도보 10분 거리
			</p>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
	
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(37.5338259242698, 126.896882129276), // 지도의 중심좌표
		        level: 4 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		var imageSrc = '<c:url value="resources/images/mapIcon.png"/>', // 마커이미지의 주소입니다    
		    imageSize = new kakao.maps.Size(60, 60), // 마커이미지의 크기입니다
		    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		      
		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
		    markerPosition = new kakao.maps.LatLng(37.5338259242698, 126.896882129276); // 마커가 표시될 위치입니다
		
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition, 
		    image: markerImage // 마커이미지 설정 
		});
		
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);  
	
	</script>
</body>
</html>
