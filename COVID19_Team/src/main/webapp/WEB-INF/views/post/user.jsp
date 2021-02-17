<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>유저 위치 확인 및 지도 생성</title>
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
</head>
<body>
	<div id="map" style="width:500px;height:400px;"></div>
	<button onclick="getGeolocation()">사용자 위치 정보 얻기</button>
	<div id="target"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4f2dd7e4bc5fdd4c16a578f03d42b1f8"></script>
	
	<script>
		var myDiv = document.getElementById("target");
// 		// 시간 반복 설정
// 		setInterval(function(){
// 			getGeolocation();
// 		}, 2000);
		
		function getGeolocation() {
			if (navigator.geolocation) {
				id = navigator.geolocation.getCurrentPosition(showLocation);
			}
		}
		
		function showLocation(location) {
			var container = document.getElementById('map');
			var options = {
					center: new kakao.maps.LatLng(location.coords.latitude, location.coords.longitude),
					level: 3
				};
			var map = new kakao.maps.Map(container, options);

			// 지도를 클릭한 위치에 표출할 마커입니다
			var marker = new kakao.maps.Marker({ 
			    // 지도 중심좌표에 마커를 생성합니다 
			    position: map.getCenter() 
			}); 
			// 지도에 마커를 표시합니다
			marker.setMap(map);
									
// 			console.log( "(위도: " + location.coords.latitude +
// 					", 경도: " + location.coords.longitude + ")");

			$.ajax({
				url:'/party/saveUserLocation',
				data: {
					 latitude :location.coords.latitude,
					 longitude :location.coords.longitude,
				},
				type:'post',
				dataType:'json',	//결과를 json으로 받습니다.
				success:function(result) {
					console.log(result);
				}
			});
			
			myDiv.innerHTML = "(위도: " + location.coords.latitude +
			", 경도: " + location.coords.longitude + ")"
				
		}
		
	</script>
	
사용자 위치정보 저장
	
</body>
</html>