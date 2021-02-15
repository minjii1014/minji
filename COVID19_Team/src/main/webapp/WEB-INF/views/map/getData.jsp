<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>Home</title>
<!-- jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<script type="text/javascript">

    $(document).ready(function(){
    	
    	var resultX = $("#x").val();
    	var resultY = $("#y").val();
    	console.log(resultX + "이거 값이있나");
    	
    		
        $('#btn').on("click", function(){
            $.ajax({
                url:'https://dapi.kakao.com/v2/local/search/address.json?query='+encodeURIComponent('마포'),
                async:false,
                type:'GET',
                headers: {'Authorization' : 'KakaoAK 7f48426793337b42a984cdbe26119d0a'},
        success:function(data){
            console.log(data);   
            
            for(var i=0, len=data.documents.length; i < len; i++){
            	$('#tbody').append("<tr>");
            	appendingText(data.documents[i].address_name);
                appendingText(data.documents[i].x);
                appendingText(data.documents[i].y);
                appendingText(data.documents[i].address_type);
                $('#tbody').append("</tr>");
            }
            
            var resultX = $("#x").val(data.documents[0].x);
        	var resultY = $("#y").val(data.documents[0].y);
            resultX = data.documents[0].x;
            resultY = data.documents[0].y;	
            console.log(resultX);
            console.log(resultY);
            consolo.log
        },
        error : function(e){
            console.log(e);
        }
     });
        });
    });
    
    function appendingText(txt){
        var tag = "<td>" + txt + "</td>";
        $('#tbody').append(tag);
    }
</script>
<body>
    <button id="btn">btn</button>
    <table border="1">
        <thead>
            <tr>
            	<td>주소명</td>
                <td id="locationX">x</td>
                <td id="locationY">y</td>
                <td>건물 종류</td>
            </tr>
        </thead>
        <tbody id="tbody"></tbody>
    </table>
    <br>
    <br>
    <br>
    
    <form action= "/map/insert" method="post">
		<input  id="x" type="hidden" name="locationX">
		<input  id="y" type="hidden" name="locationY">   
		<button type="submit">위도 경도 저장하기</button> 
    </form>
</body>
</html>