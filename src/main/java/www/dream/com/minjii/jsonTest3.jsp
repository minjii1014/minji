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
            var form = {
                    regId : "11B00000",
                    tmFc : "201809090600"
            }
            $.ajax({
                url: "getData",
                type: "POST",
                data: JSON.stringify(form),
                contentType: "application/json; charset=utf-8;",
                dataType: "json",
                success: function(data){
                    console.log(data.corona19status.row[0]);    
                    $('#tbody').append("<tr>");
                    appendingText(data.corona19status.row[0].corona19_id);
                    appendingText(data.corona19status.row[0].corona19_date);
                    appendingText(data.corona19status.row[0].corona19_no);
                    appendingText(data.corona19status.row[0].corona19_country);
                    appendingText(data.corona19status.row[0].corona19_personal);
                    appendingText(data.corona19status.row[0].corona19_area);
                    appendingText(data.corona19status.row[0].corona19_travel_history);
                    appendingText(data.corona19status.row[0].corona19_contact_history);
                    appendingText(data.corona19status.row[0].corona19_corrective);
                    appendingText(data.corona19status.row[0].corona19_leave_status);
                    appendingText(data.corona19status.row[0].corona19_moving_path);
                    appendingText(data.corona19status.row[0].corona19_idate);
                    appendingText(data.corona19status.row[0].corona19_mdate);
                    $('#tbody').append("</tr>");
                },
                error: function(){
                    alert("err");
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
                <td>연번</td>
                <td>확진일</td>
                <td>환자번호</td>
                <td>국적</td>
                <td>환자정보</td>
                <td>지역</td>
                <td>여행력</td>
                <td>접촉력</td>
                <td>조치사항</td>
                <td>상태</td>
                <td>이동경로</td>
                <td>등록일</td>
                <td>수정일</td>
            </tr>
        </thead>
        <tbody id="tbody"></tbody>
    </table>
</body>
</html>