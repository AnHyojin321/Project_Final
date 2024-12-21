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
        select {
            display: none; 
            width: 100%;
            height:100%;
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
        
        /* 메인 콘텐츠 */
.content {
	flex:1;
	width:100%;
    padding: 30px;
    background-color: #f8f9fa;
}

header h1 {
    font-size: 2.5em;
    color: #2c3e50;
    margin-bottom: 10px;
}

.welcome-msg {
    font-size: 1.2em;
    color: #6c757d;
}

/* 테이블 */
.dashboard-tables table {
	width: 100%; 
    border-collapse: collapse;
    height:90%;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}


.dashboard-tables th,
.dashboard-tables td {
    padding: 15px;
    text-align: left;
    height:20px;
}

.dashboard-tables th {
    background-color: #2c3e50;
    color: white;
    font-size: 1em;
}

.dashboard-tables td {
    background-color: white;
    font-size: 0.9em;
    max-height: 30px;
    border-bottom: 1px solid #ddd;
}


/* 애니메이션 효과 */
.dashboard-cards, .dashboard-tables {
    animation: fadeIn 1s ease-in-out;
}

@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(10px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}
#btnOpenTd {
	padding:0px;
	
}
        .openBtn {
            width: 100%;
            height: 98%;
            background-color: rgb(194, 220, 255);
            border: 0px;
            font-weight: bold;
            cursor: pointer;
        }
       #submitDiv {
		    width: 100%;
		    display: flex;           /* flexbox를 사용하도록 설정 */
		    justify-content: flex-end; /* 자식 요소들을 오른쪽으로 정렬 */
		}
		#submit {
            width: 130px;
            height: 50px;
            background-color: rgb(194, 220, 255);
            border: none;
            border-radius: 5px;
            font-weight: bold;
            font-size: 15px;
            transition: background-color 0.3s ease;
            margin:15px;
        }
        #submit:hover {
            cursor: pointer;
            background-color: rgb(139, 190, 255);
        }
        #selectTd {
        	padding:5px;
        }
    </style>
    
</head>
<body>
	<div class="admin-container">
        <jsp:include page="../common/sidebar.jsp" />
        <main class="content">
            <header>
                <h1>슬로프 오픈 관리</h1>
                <p class="welcome-msg">환영합니다, <strong>관리자님</strong>!</p>
            </header>
            <section class="dashboard-tables">
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
		                <c:forEach var="so" items="${requestScope.list}" varStatus="status">
						    <tr>
						        <!-- Slope Number -->
						        <td>
						            ${so.slopeNo}
						            <input type="hidden" name="so[${status.index}].slopeNo" value="${so.slopeNo}" />
						        </td>
						        <!-- Slope Name -->
						        <td>
						            ${so.slopeName}
						            <input type="hidden" name="so[${status.index}].slopeName" value="${so.slopeName}" />
						        </td>
						        <!-- Slope Level -->
						        <td>
						            ${so.slopeLevel}
						            <input type="hidden" name="so[${status.index}].slopeLevel" value="${so.slopeLevel}" />
						        </td>
						        <!-- Open/Close 상태 -->
						        <td id="btnOpenTd">
						            <input type="button" class="openBtn" name="so[${status.index}].slopeIsOpen" value="${so.slopeIsOpen == 'Y' ? 'OPEN' : 'CLOSE'}" />
						            <input type="hidden" class="slopeIsOpen" name="so[${status.index}].slopeIsOpen" value="${so.slopeIsOpen}" />
						        </td>
						        <!-- 사유 선택 -->
						        <td id="selectTd">
						            <select name="so[${status.index}].slopeNote">
						                <option value="" ${so.slopeNote == '' ? 'selected' : '' } disabled>사유선택</option>
						                <option value="눈상태" ${so.slopeNote == '눈상태' ? 'selected' : ''}>눈상태</option>
						                <option value="점검" ${so.slopeNote == '점검' ? 'selected' : ''}>점검</option>
						                <option value="날씨" ${so.slopeNote == '날씨' ? 'selected' : ''}>날씨</option>
						                <option value="대회" ${so.slopeNote == '대회' ? 'selected' : ''}>대회</option>
						            </select>
						        </td>
						    </tr>
						</c:forEach>
	
		            </thead>
		        </table>
		        <div id="submitDiv">
		        	<input type="submit" id="submit" value="적용하기">
		        </div>
	    	</form>
	    	</section>
        </main>
	    </div>

    <script>
	    $(document).ready(function() {
	        // 페이지 로드 시 초기 상태 설정
	        $('tr').each(function() {
	            const btn = $(this).find('.openBtn'); 
	            const selectTag = $(this).find('select'); 
	
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
                const btn = $(this);
                const row = btn.closest('tr');
                const hiddenInput = row.find('.slopeIsOpen');

                if (btn.val() === "OPEN") {
                    btn.val("CLOSE").css('background-color', 'rgb(255, 194, 194)');
                    hiddenInput.val('N');
                    row.find('select').show();
                } else {
                    btn.val("OPEN").css('background-color', 'rgb(194, 220, 255)');
                    hiddenInput.val('Y');
                    row.find('select').hide();
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