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
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4f2dd7e4bc5fdd4c16a578f03d42b1f8"></script>
	<script>

		setInterval(function(){
			getGeoLocation();
		},2000);
		
		function getGeolocation() {
			if (navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(showLocation);
			}
		}
		function showLocation(location) {
			myDiv.innerHTML = "(위도: " + location.coords.latitude +
			", 경도: " + location.coords.longitude + ")"
		}
		
	</script>
	
사용자 위치정보 저장
	
</body>
</html>