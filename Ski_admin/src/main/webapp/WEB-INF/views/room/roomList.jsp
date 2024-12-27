<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
   body {
       font-family: Arial, sans-serif;
       margin: 0;
       padding: 0;
   }
   .container {
       width: 800px;
       margin: 20px auto;
       background: #fff;

   }
   h1 {
       text-align: left;
       color: #333;
       padding: 10px 0;
       margin-left : 20px;
       margin-bottom : 30px;
   }

   table {
       width: 1200px; /* 최대 너비 제한 */
       margin-left : 10px;
       border-collapse: collapse; /* 테두리 겹침 제거 */
       border-radius: 10px; /* 테이블에 둥근 모서리 추가 */
       overflow: hidden; /* 둥근 모서리를 위한 내용 잘림 처리 */
   }

   th, td {
       padding: 15px; /* 내부 여백 추가 */
       text-align: center; /* 텍스트 중앙 정렬 */
       border-bottom: 1px solid #ddd; /* 행 간 구분선 */
       font-size: 1em; /* 텍스트 크기 */
       font-family: Arial, sans-serif; /* 깔끔한 폰트 */
   }

   th {
       background-color: #2c3e50; /* 짙은 회색 배경 */
       color: #fff; /* 흰색 텍스트 */
       text-transform: uppercase; /* 대문자 변환 */
       letter-spacing: 0.05em; /* 글자 간격 추가 */
   }



   tr:hover {
       background-color: #f1f3f5; /* 마우스 올렸을 때 연한 회색 배경 */
       cursor: pointer; /* 커서를 포인터로 변경 */
   }

   td span.status {
       display: inline-block; /* 인라인 블록 형태 */
       padding: 5px 15px; /* 내부 여백 */
       font-size: 14px; /* 텍스트 크기 */
       font-weight: bold; /* 굵은 텍스트 */
       border-radius: 20px; /* 둥근 태그 스타일 */
   }

   td span.status.available {
       background-color: #eafaf1; /* 연한 초록색 배경 */
       color: #2e7d32; /* 초록색 텍스트 */
   }

   td span.status.unavailable {
       background-color: #fdecea; /* 연한 빨간색 배경 */
       color: #e74c3c; /* 빨간색 텍스트 */
   }

   
   /* 상태 표시 스타일 */
	.status {
	    display: inline-block;
	    padding: 5px 15px;
	    font-size: 14px;
	    font-weight: bold;
	    border-radius: 10px;
	    text-align: center;
	    color: #fff;
	}
	
	.status.available {
	    background-color: #eafaf1; /* 연한 초록색 배경 */
	    color: #2e7d32; /* 초록색 텍스트 */
	}
	
	.status.unavailable {
	    background-color: #fdecea; /* 연한 주황색 배경 */
	    color: #e74c3c; /* 주황색 텍스트 */
	}
   
	/* 페이지네이션 관련 css */
	#pagingArea {
	    text-align: center;
	    margin-top: 20px;
	}
	
	.custom-pagination {
	    display: inline-flex;
	    list-style: none;
	    padding: 0;
	    margin: 0;
	    border: 1px solid #ddd;
	    border-radius: 5px;
	    overflow: hidden;
	    background-color: #f9f9f9;
	}
	
	.custom-pagination li {
	    margin: 0;
	    border-right: 1px solid #ddd;
	}
	
	.custom-pagination li:last-child {
	    border-right: none;
	}
	
	.custom-pagination a,
	.custom-pagination span {
	    display: inline-block;
	    padding: 8px 12px;
	    text-decoration: none;
	    font-size: 14px;
	    color: #555;
	    background-color: #f9f9f9;
	    transition: all 0.2s ease-in-out;
	}
	
	.custom-pagination a:hover {
	    background-color: #e2e6ea;
	    color: #333;
	}
	
	.custom-pagination li.current span {
	    color: white;
	    background-color: darkgray;
	    font-weight: bold;
	    border: none;
	    cursor: default;
	}
	
	.custom-pagination li.disabled span {
	    color: #aaa;
	    background-color: #f9f9f9;
	    cursor: not-allowed;
	}
	
	.custom-pagination li.disabled span:hover {
	    background-color: #f9f9f9;
	}
	
	.custom-pagination a:active {
	    background-color: #dcdcdc;
	}  
	
	
	/* 모달창 관련 css */
.modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    justify-content: center;
    align-items: center;
}

.modal-content {
    background-color: #fff;
    border-radius: 10px;
    width: 400px;
    padding: 20px;
    position: relative;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    text-align: center;
    font-family: Arial, sans-serif;
}

.close {
    position: absolute;
    top: 10px;
    right: 15px;
    font-size: 20px;
    cursor: pointer;
}

h2 {
    font-size: 1.5rem;
    margin-bottom: 20px;
    text-align : left;
}

.modal-body p {
    display: flex; /* 플렉스 박스 설정 */
    justify-content: space-between; /* 텍스트를 양 끝으로 정렬 */
    align-items: center; /* 세로 정렬 */
    margin: 10px 0; /* 상하 간격 추가 */
    font-size: 1rem; /* 글자 크기 설정 */
}

/* hr 스타일 */
.modal-body hr {
    border: none; /* 기본 테두리 제거 */
    border-top: 1px solid #ddd; /* 상단 테두리 설정 */
    margin: 10px 0; /* 상하 간격 설정 */
}

.modal-footer {
    display: flex;
    justify-content: space-around;
    margin-top: 20px;
}

.btn {
    padding: 10px 20px;
    border: 2px solid black;
    border-radius: 25px;
    background-color: transparent;
    font-size: 1rem;
    font-weight: bold;
    cursor: pointer;
    transition: all 0.3s ease-in-out;
}



.btn:hover {
    background-color: black;
    color: white;
}

.edit {
    border-color: #007bff;
}

.delete {
    border-color: #dc3545;
}

/* 수정폼 관련 css */

/* 입력 필드 스타일 */
.form-input {
    width: 100px;
    height : 10px;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    font-size: 1rem;
}

/* 입력 필드 포커스 스타일 */
.form-input:focus {
    border-color: #007bff;
    box-shadow: 0 0 4px rgba(0, 123, 255, 0.5);
    outline: none;
}

/* 필터 관련 css */
/* 필터 컨테이너 스타일 */
.filter-container {
    display: flex;
    align-items: center;
    justify-content: right;
    margin-bottom: 20px;
    gap: 10px;
    padding: 15px 20px;
}

/* 필터 라벨 */
.filter-label {
    font-size: 1rem;
    font-weight: bold;
    color: #333;
}

/* 드롭다운 스타일 */
.filter-select {
    width: 150px;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 1rem;
    color: #333;
    background-color: #fff;
    transition: all 0.3s ease;
}

.filter-select:focus {
    border-color: #007bff;
    box-shadow: 0 0 4px rgba(0, 123, 255, 0.5);
    outline: none;
}

/* 필터 버튼 스타일 */
.filter-button {
    padding: 10px 15px;
    font-size: 1rem;
    font-weight: bold;
    color: white;
    background-color: #007bff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.filter-button:hover {
    background-color: #0056b3;
}

.filter-button:active {
    background-color: #003d7a;
}



</style>
</head>
<body>
	<div class="admin-container">
	<jsp:include page="../common/sidebar.jsp" />
	<main class="content">
    <h1>객실 리스트</h1>
    
    
    
    <table border="1">
        <thead>
            <tr>
                <th>객실명</th>
                <th>객실타입</th>
                <th>예약상태</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="r" items="${list}">
                <tr onclick="openModal('${r.roomNo}')">
                    <td> ${r.roomType} ${r.roomName}</td>
                    <td>${r.roomType}</td>
                    <td>
						<c:choose>
						    <c:when test="${r.status == 'Y'}">
						        <span class="status available">확정</span>
						    </c:when>
						    <c:otherwise>
						        <span class="status unavailable">불가</span>
						    </c:otherwise>
						</c:choose>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
<!-- 모달 창 -->
<div id="roomModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        
        <!-- 읽기 모드 -->
        <div id="readMode">
            <h2 id="modalRoomName">객실명</h2> <!-- 객실명 표시 -->
            <div class="modal-body">
                <p>객실 번호: <span id="modalRoomNumber"></span></p><hr>
                <p>투숙 가능 인원: <span id="modalOccupancy"></span></p><hr>
                <p>객실 가격: <span id="modalRoomPrice"></span></p><hr>
            </div>
            <div class="modal-footer">
                <button class="btn edit" onclick="switchToEditMode()">수정</button>
            </div>
        </div>

		<!-- 수정 모드 -->
		<div id="editMode" style="display: none;">
		    <h2>객실 수정</h2>
		    <div class="modal-body">
		        <p>객실 번호: <span id="modalRoomNumberEdit"></span></p><hr>
		        <p>
		            <label for="editOccupancy" class="form-label">투숙 가능 인원:</label>
		            <input type="number" id="editOccupancy" min="1" class="form-input">
		        </p><hr>
		        <p>
		            <label for="editRoomPrice" class="form-label">객실 가격:</label>
		            <input type="number" id="editRoomPrice" min="0" class="form-input">
		        </p><hr>
		    </div>
		    <div class="modal-footer">
		        <button class="btn save" onclick="saveRoom();">저장</button>
		        <button class="btn cancel" onclick="switchToReadMode()">취소</button>
		    </div>
		</div>

    </div>
</div>


    
    <!-- 페이징바를 표 바로 아래로 이동 -->
    <div id="pagingArea">
        <ul class="custom-pagination">
            <!-- 왼쪽 화살표 -->
            <c:choose>
                <c:when test="${requestScope.pi.currentPage eq 1}">
                    <li class="disabled">
                        <span>&lt;</span>
                    </li>
                </c:when>
                <c:otherwise>
                    <li>
                        <a href="list.ro?cpage=${requestScope.pi.currentPage - 1}">&lt;</a>
                    </li>
                </c:otherwise>
            </c:choose>

            <!-- 페이지 번호 -->
            <c:forEach var="p" begin="${requestScope.pi.startPage}" end="${requestScope.pi.endPage}" step="1">
                <c:choose>
                    <c:when test="${p ne requestScope.pi.currentPage}">
                        <li>
                            <a href="list.ro?cpage=${p}">${p}</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="current">
                            <span>${p}</span>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <!-- 오른쪽 화살표 -->
            <c:choose>
                <c:when test="${requestScope.pi.currentPage ne requestScope.pi.maxPage}">
                    <li>
                        <a href="list.ro?cpage=${requestScope.pi.currentPage + 1}">&gt;</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="disabled">
                        <span>&gt;</span>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
    </main>
    </div>
    
    <script>

    // 모달 열기 함수

    function openModal(roomNo) {
        const modal = document.getElementById("roomModal");
		console.log(roomNo);
        // AJAX 요청으로 객실 정보 가져오기
        $.ajax({
            url: "roomDetail.ro", // 서버의 컨트롤러 URL
            type: "GET", // GET 요청
            data: { 
            	roomNo: roomNo
        	}, 
            success: function(response) {
                // JSON 데이터를 받아서 모달에 표시
                console.log("응답 데이터:", response);

                // JSON 데이터로 모달 내용 업데이트
                document.getElementById("modalRoomName").textContent = response.roomType + "  " + response.roomName; // 객실명
                document.getElementById("modalRoomNumber").textContent = "#" + response.roomNo; // 객실 번호
                document.getElementById("modalOccupancy").textContent = response.capacity + "인"; // 투숙 가능 인원
                document.getElementById("modalRoomPrice").textContent = 
                    new Intl.NumberFormat().format(response.roomPrice) + "원"; // 객실 가격

                // 모달 열기
                const modal = document.getElementById("roomModal");
                modal.style.display = "flex";
            },
            error: function(xhr, status, error) {
                console.error("AJAX 요청 오류:", error);
                alert("객실 정보를 불러오는 데 실패했습니다.");
            }
        });
    }


    // 모달 닫기 함수
    function closeModal() {
        const modal = document.getElementById("roomModal");
        modal.style.display = "none"; // 모달 닫기
    }

    // 모달 외부 클릭 시 닫기
    window.onclick = function(event) {
        const modal = document.getElementById("roomModal");
        if (event.target === modal) {
            closeModal();
        }
    };
    
    
 // 읽기 모드에서 수정 모드로 전환
    function switchToEditMode() {
        // 읽기 모드 숨기기
        document.getElementById("readMode").style.display = "none";
        // 수정 모드 보여주기
        document.getElementById("editMode").style.display = "block";

        // 기존 정보 가져와서 수정 필드에 넣기
        const roomNo = document.getElementById("modalRoomNumber").textContent.replace("#", "");
        const capacity = document.getElementById("modalOccupancy").textContent.replace("인", "");
        const roomPrice = document.getElementById("modalRoomPrice").textContent.replace("원", "").replace(",", "");

        document.getElementById("modalRoomNumberEdit").textContent = "#" + roomNo;
        document.getElementById("editOccupancy").value = capacity;
        document.getElementById("editRoomPrice").value = roomPrice;
    }

    // 수정 모드에서 읽기 모드로 전환
    function switchToReadMode() {
        document.getElementById("readMode").style.display = "block";
        document.getElementById("editMode").style.display = "none";
    }

    // 수정된 정보 저장
    function saveRoom() {
        const roomNo = document.getElementById("modalRoomNumberEdit").textContent.replace("#", "");
        const capacity = document.getElementById("editOccupancy").value;
        const roomPrice = document.getElementById("editRoomPrice").value;
        
        console.log("수정한 객실 정보 ");
        console.log(capacity);
        console.log(roomPrice);

        // 검증
        if (!capacity || capacity <= 0) {
            alert("투숙 가능 인원은 1명 이상이어야 합니다.");
            return;
        }
        if (!roomPrice || roomPrice <= 0) {
            alert("객실 가격은 0원 이상이어야 합니다.");
            return;
        }

        // AJAX 요청
        $.ajax({
            url: "updateRoom.ro", // 서버의 컨트롤러 URL
            type: "POST",
            data: {
                roomNo: roomNo,
                capacity: capacity,
                roomPrice: roomPrice
            },
            success: function(response) {
            	console.log("성공인가 ?" + response);
                if (response === "success") {
                    alert("객실 정보가 성공적으로 수정되었습니다.");
                    closeModal(); // 모달 닫기
                    location.reload(); // 페이지 새로고침
                } else {
                    alert("객실 정보 수정에 실패했습니다.");
                }
            },
            error: function(xhr, status, error) {
                console.error("AJAX 요청 오류:", error);
                alert("객실 정보를 수정하는 중 오류가 발생했습니다.");
            }
        });
    }

</script>

</body>
</html>