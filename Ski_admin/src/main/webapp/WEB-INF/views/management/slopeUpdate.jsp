<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>슬로프 오픈 관리</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        thead>tr>th {
            width: 200px;
        }
        .openBtn {
            width: 100%;
            height: 40px;
            background-color: rgb(194, 220, 255);
            border: 0px;
            font-weight: bold;
            cursor: pointer;
        }
        table {
            border-spacing: 0px;
            width: 100%;
        }
        th {
            padding: 0px;
        }
        select {
            display: none; 
            width: 90%;
            font-size: 13px;
            background-color: #f5f5f5;
            border: 1px solid #ccc;
            padding: 8px 12px;
            border-radius: 5px;
            transition: border-color 0.3s, background-color 0.3s;
        }

        select:focus {
            outline: none;
            border-color: #666666;
            background-color: #f5f5f5;
        }

        form>div {
            width: 99%;
            padding-top:10px;
            text-align: right;
        }
        #submit {
            width: 100px;
            height: 40px;
            background-color: rgb(194, 220, 255);
            border: 1px solid gray;
            border-radius: 5px;
            font-weight: bold;
            font-size: 15px;
            transition: background-color 0.3s ease;
        }
        #submit:hover {
            cursor: pointer;
            background-color: rgb(139, 190, 255);
        }
    </style>
</head>
<body>
    <div id="title">
        <h1>슬로프 오픈 관리</h1>
        <h2>2024-12-09 (Monday)</h2>
    </div>
    <div>
    	<form action="slopeUpdateControl.sm" id="slopeForm" method="post">
	        <table border="1px solid black">
	            <thead>
	                <tr>
	                    <th>SlopeNo</th>
	                    <th>Name</th>
	                    <th>Level</th>
	                    <th>Open</th>
	                    <th>Reason</th>
	                </tr>
	                <c:forEach var="so" items="${ requestScope.list }">                    
		                <tr>
		                    <th>
		                    	${ so.slopeNo }
		                        <input type="hidden" name="so[${status.index}].slopeNo" value="${so.slopeNo}" />
		                    </th>
		                    <th>${ so.slopeName }</th>
		                    <th>${ so.slopeLevel }</th>
		                    <th>
		                        <input type="button" class="openBtn" name="so[${status.index}].slopeIsOpen" value="${ so.slopeIsOpen == 'Y' ? 'OPEN' : 'CLOSE'}" name="slopeIsOpen"></input>
		                    </th>
		                    <th>
		                        <select name="so[${status.index}].slopeNote">
		                            <option value="" disabled>사유선택</option>
		                            <option value="눈상태" ${ so.slopeNote == "눈상태" ? "selected" : "" }>눈상태</option>
		                            <option value="점검" ${ so.slopeNote == "점검" ? "selected" : "" }>점검</option>
		                            <option value="날씨" ${ so.slopeNote == "날씨" ? "selected" : "" }>날씨</option>
		                            <option value="대회" ${ so.slopeNote == "대회" ? "selected" : "" }>대회</option>
		                        </select>
		                    </th>
		                </tr>
		            </c:forEach>
	            </thead>
	        </table>
	        <div>
	        	<input type="submit" id="submit" value="적용하기">
	        </div>
    	</form>
    </div>

    <script>
	    $(document).ready(function() {
	        // 페이지 로드 시 초기 상태 설정
	        $('tr').each(function() {
	            const btn = $(this).find('.openBtn'); // 현재 행의 버튼
	            const selectTag = $(this).find('select'); // 현재 행의 select 태그
	
	            if (btn.length && selectTag.length) {
	                if (btn.val() === "OPEN") {
	                    btn.css('background-color', 'rgb(194, 220, 255)');
	                    selectTag.hide();
	                } else if (btn.val() === "CLOSE") {
	                    btn.css('background-color', 'rgb(255, 194, 194)');
	                    selectTag.show();
	                }
	            }
	        });
	        
	        $('.openBtn').on('click', function() {
	            const btn = $(this); // 클릭된 버튼
	            const row = btn.closest('tr'); // 버튼이 속한 행
	            const selectTag = row.find('select'); // 해당 행의 select 태그
	            const hiddenInput = row.find('.slopeIsOpen'); // hidden 필드

	            if (btn.val() === "OPEN") {
	                btn.val("CLOSE");
	                btn.css('background-color', 'rgb(255, 194, 194)');
	                selectTag.show().focus();
	                hiddenInput.val('N'); // hidden 필드 값 변경
	            } else {
	                btn.val("OPEN");
	                btn.css('background-color', 'rgb(194, 220, 255)');
	                selectTag.hide();
	                hiddenInput.val('Y'); // hidden 필드 값 변경
	            }
	        });

	    });
	</script>
</body>
</html>



<!-- 
1	Crystal Path	Beginner
2	Snowflake Glide	Beginner
3	Bluebird Trail	Beginner
4	Frostbite Run	Intermediate
5	Glacier Alley	Intermediate
6	Summit Slide	Intermediate
7	Icicle Pass	Intermediate
8	Avalanche Chute	Advanced
9	Blizzard Peak	Advanced
10	Thunder Ridge	Advanced
11	Fury Descent	Expert
12	Dragon's Spine	Expert
-->