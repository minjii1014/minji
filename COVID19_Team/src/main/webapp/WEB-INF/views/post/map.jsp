<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>클릭한 위치에 마커 표시하기</title>
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
</head>
<body>
	<button onclick="startGeolocation()">위치 정보 시작</button>
	<button onclick="stopGeolocation()">위치 정보 중지</button>
	<div id="target"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4f2dd7e4bc5fdd4c16a578f03d42b1f8"></script>
	<script>
		var id;
		var myDiv = document.getElementById("target");
		function startGeolocation() {
			if (navigator.geolocation) {
				id = navigator.geolocation.watchPosition(showGeolocation);
			}
		}
		function showGeolocation(location) {
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(location.coords.latitude, location.coords.longitude), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };

			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
			// 지도를 클릭한 위치에 표출할 마커입니다
			var marker = new kakao.maps.Marker({ 
			    // 지도 중심좌표에 마커를 생성합니다 
			    position: map.getCenter() 
			}); 
			// 지도에 마커를 표시합니다
			marker.setMap(map);
	
			// 지도에 클릭 이벤트를 등록합니다
			// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
			kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
			    
			    // 클릭한 위도, 경도 정보를 가져옵니다 
			    var latlng = mouseEvent.latLng; 
			    
			    // 마커 위치를 클릭한 위치로 옮깁니다
			    marker.setPosition(latlng);
			    
			    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
			    message += '경도는 ' + latlng.getLng() + ' 입니다';

			    var resultDiv = document.getElementById('clickLatlng'); 
			    resultDiv.innerHTML = message;

			    var party = {
						latitude:latlng.latlng.Ma,
						longitude:latlng.latlng.La
				};
				
			    $.ajax({
					url:'/party/saveAjaxLocation',
					data: party,
					type:'post',
					dataType:'json',	//결과를 json으로 받습니다.
					success:function(result) {
						console.log(result);
					}
				});
			    
			});
		}
		
		function stopGeolocation() {
			if (navigator.geolocation) {
				navigator.geolocation.clearWatch(id);
			}
		}
	</script>
	
	<input type="hidden" value="${latitude }" id="latitude" >
	<input type="hidden" value="${longitude }" id="longitude">
	<input type="hidden" value="${start_date }" id="start_date">
	<input type="hidden" value="${thru_date }" id="thru_date">
	
	
<div id="map" style="width:100%;height:350px;"></div>
<p><em>지도를 클릭해주세요!</em></p> 
<div id="clickLatlng"></div>

</body>
</html>