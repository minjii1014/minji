<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
<!-- jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<script type="text/javascript">
    $(document).ready(function(){
        $('#btn').on("click", function(){
            $.ajax({
                url:'https://dapi.kakao.com/v2/local/search/address.json?query='+encodeURIComponent('당산동'),
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
                <td>x</td>
                <td>y</td>
                <td>건물 종류</td>
            </tr>
        </thead>
        <tbody id="tbody"></tbody>
    </table>
</body>
</html>