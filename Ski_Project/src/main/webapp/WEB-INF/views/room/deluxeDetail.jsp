<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
     /* 기존 body 스타일 제거 */
/* 배경 이미지 설정 */
body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
	background: url('${pageContext.request.contextPath}/resources/images/room/background.jpg') no-repeat center center fixed; /* 배경 이미지 경로 */
    background-size: cover; /* 화면 크기에 맞게 이미지 크기 조정 */
    background-position: center center; /* 배경 이미지를 중앙에 위치 */
    background-attachment: fixed; /* 스크롤 시 배경 이미지 고정 */
}
    body::before {
      content: '';
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.5); /* 투명도 설정 (0.5는 50% 투명) */
      z-index: -1; /* 배경 이미지보다 뒤로 보내기 */
    }

		
		/* wrap 클래스에만 flex 스타일 적용 */
		.wrap {

		    display: flex;
		    flex-direction: column;
		    align-items: center;
		    justify-content: center;
		    max-width: 1000px;
		    border-radius: 10px;
		    margin: 30px auto;
		    padding: 20px;
		    background-color: #fff; /* 필요에 따라 배경 색상 지정 */

		}


        .roomDescription1 {
            width: 1000px;
            height: 400px;
            display: flex; /* 자식 요소들을 수평으로 배치 */
            justify-content: space-between; /* 자식 요소 간 간격을 자동으로 분배 */
        }

        .desc1 {
		    position: relative; /* 부모 요소를 기준으로 버튼 위치를 조정 */
		    width: 60%; /* 부모 요소의 너비 설정 */
		    height: 100%; /* 부모 요소의 높이 설정 */
		}
		
		.prev-btn, .next-btn {
		    position: absolute; /* 절대 위치 설정 */
		    top: 50%; /* 세로로 중앙에 배치 */
		    transform: translateY(-50%); /* 세로 중앙 정렬 */
		    color: white; /* 버튼 글씨 색 */
		    border: none; /* 테두리 제거 */
		    padding: 10px 0px; /* 버튼 내부 여백 */
		    cursor: pointer; /* 마우스 커서 모양 변경 */
		    z-index: 10; /* 버튼을 이미지 위로 올림 */
		}
		
		.prev-btn {
			width : 30px;
			height : 40px;
		    left: 10px; /* 왼쪽 끝에서 간격 설정 */
		}
		
		.next-btn {
			width : 30px;
			height : 40px;
		    right: 10px; /* 오른쪽 끝에서 간격 설정 */
		}
		
		.slider-image {
		    width: 100%; /* 이미지 너비 100% */
		    height: 100%; /* 이미지 높이 100% */
		    object-fit: cover; /* 이미지 비율 유지하며 크기 조정 */
		}

        .slider-image {
            width: 100%; /* 각 요소의 너비를 지정 (필요에 따라 조정) */
            height: 100%;
        }
        
        .image-counter {
		    position: absolute;
		    bottom: 10px;  /* 슬라이드 이미지 하단에 위치 */
		    left: 50%;
		    transform: translateX(-50%); /* 가운데 정렬 */
		    color: white;
		    font-size: 15px;
		    background-color: rgba(0, 0, 0, 0.3); /* 반투명 배경 */
		    padding: 5px 10px;
		    border-radius: 5px;
		}

        .desc2 {
		    background-color: #f5f3ee;
		    width: 40%;
		    height: auto; /* 높이를 내용에 맞게 설정 */
		    padding: 20px; /* 내부 여백 추가 */
		    text-align: center; /* 텍스트 중앙 정렬 */
		}
		
		.desc2 h2 {
		    margin-bottom: 15px; /* 제목과 아래 내용 사이 간격 추가 */
		}
		
		.desc2 p {
		    line-height: 1.8; /* 줄 간격을 늘려 가독성 향상 */
		    margin: 15px 0; /* 문단 상하 여백 */
		}
		
		.desc2>hr {
		    margin: 20px auto; /* 수평선 상하 여백 */
		    width: 80%; /* 수평선 길이 */
		}

		.roomDescription2 {
			width : 950px;
		    display: flex;
		    justify-content: space-between;
		    padding: 20px;
		    background-color: #fff;
		    border: 1px solid #ddd;
		}
		
		.info1 {
		    width: 60%;
		    height : 100%;
		}
		
		.info2 {
			margin-left : 30px;
		    width: 40%;
		    height : 100%;
		}
		
		.info1 h4, .info2 h4 {
		    font-size: 18px;
		    margin-bottom: 10px;
		    color: #333;
		    font-weight: bold;
		}
		
		.info1 p, .info2 ul li {
		    font-size: 14px;
		    margin-bottom: 8px;
		    line-height: 1.5;
		    color: #555;
		}
		
		.icons {
		    display: flex;
		    justify-content: space-between;
		    margin: 40px 5px;
		}
		
		.icons div {
		    text-align: center;
		    width: 22%;
		}
		
		.icons img {
		    width: 40px;
		    height: 40px;
		    margin-bottom: 0px;
		}
		
		.icons p {
		    font-size: 12px;
		    color: #666;
		}
		
		.button-group {
		    text-align: center;
		    margin-top: 20px;
		    
		}
		
		button {
		    background-color: #000;
		    color: #fff;
		    border: none;
		    padding: 10px 20px;
		    font-size: 14px;
		    cursor: pointer;
		}
		
		.desc1 button {
			 border-radius: 5px;
		}
		
		.reserve-btn {
			width : 150px;
			 border-radius: 25px;
		}
		
		.reserv-btn {
			background-color: #000;
		    color: #fff;
		    border: none;
		    border-radius: 20px;
		    padding: 10px 20px;
		    font-size: 14px;
		    cursor: pointer;
		}
		
		button:hover {
		    background-color: #444;
		}
		
		.info2 ul {
		    padding-left: 20px;
		}
		
		.info2 ul li {
		    list-style: disc;
		    margin-bottom: 5px;
		    color: #666;
		}
		
		/* 슬라이드 효과 ? */
/* .slider-image 클래스를 수정하여 이미지 전환 애니메이션 효과 추가 */
.slider-image {
    width: 100%;
    height: 100%;
    object-fit: cover;
    position: absolute; /* 절대 위치로 설정하여 다른 콘텐츠 위에 겹치게 */
    transition: opacity 0.5s ease-in-out; /* 슬라이드 전환 시 페이드 효과 */
}

/* 슬라이드 전환을 위한 효과 */
.slider-image.slide-left {
    opacity: 0; /* 이미지가 사라지도록 */
}

.slider-image.slide-right {
    opacity: 0; /* 이미지가 사라지도록 */
}

.slider-image.fade-in {
    opacity: 1; /* 이미지가 부드럽게 나타나도록 */
}


    </style>
</head>
<body>
<jsp:include page="../common/header.jsp" />
    <div class="wrap">
        <div class="roomDescription1">
            <div class="desc1">
            		<img src="${pageContext.request.contextPath}/resources/images/room/left.png" class="prev-btn">
                    <img src="${pageContext.request.contextPath}/resources/images/room/deluxe.jpg" class="slider-image">
                    <img src="${pageContext.request.contextPath}/resources/images/room/right.png" class="next-btn">

                    <div class="image-counter">
			            <span id="currentIndex">1</span> / <span id="totalImages">3</span>
			        </div>
            </div>
            <div class="desc2">
                <h2>디럭스(Deluxe)</h2>
                <hr>
                <p>
                    당산동에 위치한 디럭스룸은 넉넉한 공간과 세련된 디자인이 어우러진 고급스러운 콘도미니엄입니다. <br>
        			개인 거실과 주방을 갖추어 더욱 여유롭고 편안한 숙박을 제공합니다. <br>
        			탁 트인 자연 전망과 현대적인 인테리어가 조화를 이루어 <br>마치 집처럼 아늑하고 품격 있는 시간을 선사합니다.
                </p>
            </div>
        </div>
        
        
     <script>
     let currentIndex = 0; // 현재 표시된 이미지 인덱스
     const images = [
         "${pageContext.request.contextPath}/resources/images/room/deluxe1.jpg",
         "${pageContext.request.contextPath}/resources/images/room/deluxe2.jpg",
         "${pageContext.request.contextPath}/resources/images/room/deluxe3.jpg"
     ]; // 이미지 경로 배열
     const totalImages = images.length; // 이미지의 총 개수

     // 이미지 순서 표시 업데이트 함수
     function updateImageCounter() {
         document.getElementById("currentIndex").textContent = currentIndex + 1; // 현재 이미지 번호
         document.getElementById("totalImages").textContent = totalImages; // 총 이미지 개수
     }

     // 슬라이드 이미지 변경 함수
     function changeImage(direction) {
         const imgElement = document.querySelector(".slider-image"); // 이미지 요소

         // 슬라이드 효과 적용
         imgElement.classList.remove("fade-in", "slide-left", "slide-right");

         // 이동 방향에 맞는 클래스 추가
         if (direction === 'left') {
             imgElement.classList.add("slide-left"); // 왼쪽으로 슬라이드
         } else if (direction === 'right') {
             imgElement.classList.add("slide-right"); // 오른쪽으로 슬라이드
         }

         // 이미지 변경 후 다시 원위치로 복귀
         setTimeout(() => {
             imgElement.src = images[currentIndex]; // 현재 인덱스에 해당하는 이미지로 변경
             imgElement.classList.add("fade-in"); // 원위치로 돌아가면서 페이드 인 효과
             updateImageCounter(); // 이미지 번호 업데이트
         }, 600); // 애니메이션 시간과 맞추기 위해 600ms 후에 이미지 변경
     }

     // 이전 버튼 클릭 시
     document.querySelector(".prev-btn").addEventListener("click", function() {
         currentIndex = (currentIndex === 0) ? totalImages - 1 : currentIndex - 1; // 인덱스를 순환
         changeImage('left');
     });

     // 다음 버튼 클릭 시
     document.querySelector(".next-btn").addEventListener("click", function() {
         currentIndex = (currentIndex === totalImages - 1) ? 0 : currentIndex + 1; // 인덱스를 순환
         changeImage('right');
     });

     // 초기 이미지 설정
     changeImage('right');

	</script>


        <br>


       <div class="roomDescription2">
		    <div class="info1">
	         	<h4>객실 기본정보</h4>
			    <p><strong>룸구성 </strong>| 거실, 주방, 방 3, 화장실 2</p>
			    <p><strong>기본 세면용품 </strong>| 타올/비누/샴푸/바디워시</p>
			    <p><strong>입실/퇴실 </strong>| 15:00 ~ 11:00</p>
			    <p><strong>정원 </strong>| 6인 1실</p>
		
		        <div class="icons">
		        	
		            <div>
		                <img src="${pageContext.request.contextPath}/resources/images/room/info1.png">
		                <p>입실/퇴실 시간 준수</p>
		            </div>
		            <hr>
		            <div>
		                <img src="${pageContext.request.contextPath}/resources/images/room/info2.png">
		                <p>퇴실 전 객실 정리</p>
		            </div>
		            <hr>
		            <div>
		                <img src="${pageContext.request.contextPath}/resources/images/room/info3.png">
		                <p>객실 내 조리 가능</p>
		            </div>
		            <hr>
		            <div>
		                <img src="${pageContext.request.contextPath}/resources/images/room/info4.png">
		                <p>반려동물 입실 가능</p>
		            </div>
		         
		        </div>
		
				<form id="reservationForm" action="payStep1.ro" method="post">
				    <!-- 객실 타입 -->
				    <input type="hidden" name="roomType" id="roomType" value="">
				    <!-- 회원 번호 -->
				    <input type="hidden" name="memberNo" id="memberNo" value="">
				</form>
				
				<div class="button-group">
				    <button class="reserve-btn" data-roomtype="디럭스" onclick="payStep(this);">객실 예약</button>
				</div>
		        
		    </div>
			<hr>
		    <div class="info2">
		        <h4>운영안내</h4>
		        <ul>
		            <li>객실 이용: 1577-0069 (객실 예약 1번)</li>
		            <li>객실 사진은 당산동 리뉴얼 사진입니다.</li>
		            <li>객실은 당일 프론트에서 현장 배정 됩니다.</li>
		            <li>반려동물 동반 객실은 4만원의 추가금액이 발생 되며, 사전예약제로 운영 됩니다.</li>
		            <li>특수 반려동물은 객실당 1마리, 12kg 이하까지 입실 가능합니다.</li>
		        </ul>
		    </div>
		</div>
    </div>
        <script>
		// 서버에서 로그인 상태를 JavaScript 변수로 전달
		// 서버에서 로그인 상태를 JavaScript 변수로 전달
		const memberNo = "${sessionScope.loginMember != null ? sessionScope.loginMember.memberNo : null}";

		function payStep(button) {
			console.log("payStep 함수 호출됨");

		    // 버튼에서 data-roomtype 값을 가져오기
		    const roomType = button.getAttribute("data-roomtype");
		    
		    console.log(roomType);
		    // 로그인 여부 확인
		    if (${empty sessionScope.loginMember}) { // 문자열 비교로 "false"와 비교
		        alert("로그인 후 이용 가능합니다.");
		         location.href = "login.me"; // 로그인 페이지로 리다이렉트
		    } else {
		        // roomType 데이터를 컨트롤러로 전달
		        // 폼의 hidden input 값 설정
		        document.getElementById("roomType").value = roomType;
		        document.getElementById("memberNo").value = memberNo;
		
		        // 디버그용 콘솔 출력
		        console.log("Room Type:", roomType);
		        console.log("Member No:", memberNo);
		
		        // 폼 제출
		        document.getElementById("reservationForm").submit();
		    }
		}

    </script>
<jsp:include page="../common/footer.jsp" />
</body>
</html>