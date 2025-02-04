<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
    }

    .admin-container {
        display: flex;
    }

    .content {
        flex: 1;
        padding: 20px;
    }

    h1 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
    }

    .filter-bar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
    }

    .filter-bar input, .filter-bar select {
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 14px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    table th, table td {
        padding: 12px;
        text-align: center;
        border: 1px solid #ddd;
    }

    table th {
        background-color: #f4f4f4;
        font-weight: bold;
    }

    table tbody tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    table tbody tr:hover {
        background-color: #f1f1f1;
        cursor: pointer;
    }

    .status {
        padding: 5px 10px;
        border-radius: 5px;
        font-weight: bold;
    }

    .status.confirmed {
        background-color: #eafaf1;
        color: #2e7d32;
    }

    .status.cancelled {
        background-color: #fdecea;
        color: #e74c3c;
    }

    
    /* 모달창 관련 CSS */
        .modal {
        display: none;
        position: fixed;
        z-index: 10;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.5);
        justify-content: center;
        align-items: center;
    }

    .modal-content {
        background: #fff;
        padding: 20px;
        border-radius: 10px;
        width: 400px;
        text-align: left;
        position: relative;
    }

    .modal-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
    }

    .modal-header h2 {
        margin: 0;
    }

    .close {
        cursor: pointer;
        font-size: 18px;
        color: #aaa;
    }

    .close:hover {
        color: #000;
    }

    .modal-body p {
        margin: 10px 0;
    }
    /* hr 태그 스타일 추가 */
	.modal-body hr {
	    border: 1px solid #ddd;
	    margin: 20px 0;
	}
	
	.modal-header h2 {
		text-align : center;
	}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

</head>
<body>
    <div class="admin-container">
        <jsp:include page="../common/sidebar.jsp" />
        <main class="content">
            <h1>패키지 예약 내역</h1>

            <div class="filter-bar">
                <select id="statusFilter">
                    <option value="X">모든 상태</option>
                    <option value="N">예약 완료</option>
                    <option value="Y">취소됨</option>
                </select>
            </div>

            <table id="reservationTable">
                <thead>
                    <tr>
                        <th>예약 번호</th>
                        <th>패키지 이름</th>
                        <th>예약자 이름</th>
                        <th>예약자 전화번호</th>
                        <th>예약 상태</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="p" items="${list}">

                        <tr data-status="${p.packageReservNo}" data-member="${p.memberNo}" onclick="openModal('${p.packageReservNo}', '${p.memberNo}')">
                        	<td>${p.packageReservNo}</td>
                            <td>${p.packageName}</td>
                            <td>${p.memberName}</td>
                            <td>${p.phone}</td>
                            <td>
							    <c:choose>
							        <c:when test="${p.prefundStatus == 'Y'}">
							            예약 취소
							        </c:when>
							        <c:otherwise>
							            예약 완료
							        </c:otherwise>
							    </c:choose>
							</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </main>
    </div>

    <!-- 모달창 -->
    <div id="reservationModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2>예약 상세 정보</h2>
                <span class="close" onclick="closeModal()">&times;</span>
            </div>
            <div class="modal-body">
            	<h4>예약자 정보</h4>
                <p>예약자 성함: <span id="modalMemberName"></span></p>
                <p>전화번호: <span id="modalMemberPhone"></span></p>
                <p>이메일: <span id="modalMemberEmail"></span></p>
                <hr>
                <h4>예약 상세 내역</h4>
                <p>패키지 구성: <span id="modalPackageSet"></span></p>
                <p>객실 체크인/체크아웃: <span id="modalcheckInOut"></span></p>
                <p>결제 금액: <span id="modalTotalPrice"></span></p>
                <p>결제일: <span id="modalPayDate"></span></p>
                <p>환불일: <span id="modalRefundDate"></span></p>
            </div>
        </div>
    </div>
       <script>
        // 모달 열기 함수
        function openModal(reservNo, memberNo) {
        	console.log("예약 번호:", reservNo);
            console.log("회원 번호:", memberNo);
            // AJAX 요청으로 상세 데이터 가져오기
            $.ajax({
                url: "packageReservDetail.pk", // 서버의 URL
                type: "GET",
                data: { 
                	packageReservNo: reservNo,
                	memberNo : memberNo
                },
                success: function(data) {
                	console.log("ajax 통신 성공");
                	var m = data.m;
                	var p = data.p;
                    // 데이터 채우기
                    $("#modalMemberName").text(m.memberName);
                    $("#modalMemberPhone").text(m.phone);
                    $("#modalMemberEmail").text(m.email);
                    $("#modalPackageSet").text(p.packageSet);
                    $("#modalcheckInOut").text(p.checkInDate);
                    $("#modalTotalPrice").text(p.packagePrice);
                    $("#modalPayDate").text(p.payDate);
                    $("#modalRefundDate").text(p.prefuncDate);
                   

                    // 모달 열기
                    $("#reservationModal").css("display", "flex");
                },
                error: function() {
                    alert("상세 정보를 가져오는 데 실패했습니다.");
                }
            });
        }

        // 모달 닫기 함수
        function closeModal() {
            $("#reservationModal").css("display", "none");
        }
        
        
        /// ---------  필터링
        $(function() {
    // 상태 필터 선택 시 이벤트 처리
    $("#statusFilter").change(function() {
        // 선택된 값 가져오기
        var selectedValue = $(this).val();
        
        // 콘솔에 출력
        console.log("선택된 예약 상태: " + selectedValue);

        // 예약 상태에 따라 테이블 데이터 필터링
        if (selectedValue === "N") {
            // 예약 완료 상태만 필터링
            filterTable("N");
        } else if (selectedValue === "Y") {
            // 예약 취소 상태만 필터링
            filterTable("Y");
        } else {
            // "모든 상태" 선택 시, 모든 데이터 표시
            filterTable("");
        }
    });

    function filterTable(status) {
        // 모든 예약 데이터가 들어있는 테이블의 tr 요소를 선택
        $("#reservationTable tbody tr").each(function() {
            var rowStatus = $(this).find("td").eq(4).text().trim(); // 예약 상태 (td의 5번째 열)

            // 상태 필터링
            if (status === "") {
                // "모든 상태" 선택 시, 모든 행을 표시
                $(this).show();
            } else if (rowStatus === "예약 완료" && status === "N") {
                // 예약 완료 상태에서 "예약 완료"인 행만 표시
                $(this).show();
            } else if (rowStatus === "예약 취소" && status === "Y") {
                // 예약 취소 상태에서 "예약 취소"인 행만 표시
                $(this).show();
            } else {
                // 조건에 맞지 않는 경우 해당 행 숨기기
                $(this).hide();
            }
        });
    }
});

    </script>

</body>
</html>