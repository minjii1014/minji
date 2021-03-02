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

<%-- 	${party.partyId} --%>
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
				// 감염자 구분 번호를 가져옵니다.
			    // 클릭한 위도, 경도 정보를 가져옵니다 
			    var latlng = mouseEvent.latLng; 
			    
			    // 마커 위치를 클릭한 위치로 옮깁니다
			    marker.setPosition(latlng);
			    
			    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
			    message += '경도는 ' + latlng.getLng() + ' 입니다';
			    var resultDiv = document.getElementById('clickLatlng'); 
			    resultDiv.innerHTML = message;
			
			    $("input[name=latitude]").val(latlng.getLat());
			    $("input[name=longitude]").val(latlng.getLng());
			    
			});
		}
		
		function stopGeolocation() {
			if (navigator.geolocation) {
				navigator.geolocation.clearWatch(id);
			}
		}
		$(document).ready(function(){
			stopGeolocation();
			
			$("#btnSave").on("click", function(e){
				e.preventDefault();
			
				if($("input[name=latitude]").val() == '' || $("input[name=latitude]").val() == null) {
					alert('지도 클릭해주세요');
					return;
				} else if ($("input[name=startDate]").val() == '' || $("input[name=thruDate]").val() == '') {
					alert('시간을 입력해주세요');
					return;
				}
				
				var party = {
						latitude : $("input[name=latitude]").val(),
						longitude : $("input[name=longitude]").val(),
						startDate : $("input[name=startDate]").val().replace('T', ' '),
						thruDate : $("input[name=thruDate]").val().replace('T', ' '),
				};
				
	    		$.ajax({
					url:'/party/saveInfectedLocation',
					data: party,
					type:'post',
					dataType:'json',	//결과를 json으로 받습니다.
					success:function(result) {
						console.log(result);
					}
				});
			
			});
			
			
		});
	
	</script>
	
<!-- 	확진자 경로랑 시간을 넣을라고 -->
<!-- 	위도 경도 찍어서 -->
<!-- 	시간을 우리가 수기로 입력하려고 함. -->
<button onclick="startGeolocation()">위치 정보 시작</button>
<button onclick="stopGeolocation()">위치 정보 중지</button>
<div id="map" style="width:100%;height:350px;"></div>
<a href="/party/user">사용자 지도</a>
<p><em>지도를 클릭해주세요!</em></p> 
<div id="clickLatlng"></div> 


	<input name="startDate" type="datetime-local">
	<input name="thruDate" type="datetime-local"  >
	<input name="latitude" type="hidden" value="${latitude }" id="latitude" >
	<input name="longitude" type="hidden" value="${longitude }" id="longitude">
	
	<button id="btnSave" value="버튼">시간을 적어주세요</button>

		
</body>
</html>