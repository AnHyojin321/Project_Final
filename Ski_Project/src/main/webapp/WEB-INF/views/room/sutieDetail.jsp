<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>

        .wrap {
            /*  border: 1px solid black; */
            width: 1000px;
            height: 900px;
        }

        div {
           /* border: 1px solid red; */
        }

        body {
           
            display: flex; /* 부모 요소를 flexbox로 설정 */
            justify-content: center; /* 수평 중앙 정렬 */
            align-items: center; /* 수직 중앙 정렬 */
            flex-direction: column; /* 자식 요소들을 수직으로 배치 */
            margin: 0; /* 기본 마진 제거 */
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
		    display: flex;
		    justify-content: space-between;
		    padding: 20px;
		    background-color: #fff;
		    border: 1px solid #ddd;
		    border-radius: 10px;
		    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
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


    </style>
</head>
<body>
<jsp:include page="../common/header.jsp" />
    <div class="wrap">
        <div class="roomDescription1">
            <div class="desc1">
            		<img src="${pageContext.request.contextPath}/resources/images/room/left.png" class="prev-btn">
                    <img src="${pageContext.request.contextPath}/resources/images/room/suite.jpg" class="slider-image">
                    <img src="${pageContext.request.contextPath}/resources/images/room/right.png" class="next-btn">

                    <div class="image-counter">
			            <span id="currentIndex">1</span> / <span id="totalImages">3</span>
			        </div>
            </div>
            <div class="desc2">
                <h2>스위트(Suite)</h2>
                <hr>
                <p>
			        스위트룸은 최상급의 품격을 자랑하는 럭셔리한 공간으로, <br> 
			        넓은 거실과 별도의 침실, 고급스러운 주방을 완비하여 <br>
			        완벽한 프라이버시와 편안함을 제공합니다. <br>
			        탁월한 자연 전망과 세련된 인테리어가 결합되어 <br> 
			        독특한 스타일과 안락함을 동시에 누릴 수 있는 특별한 공간입니다.
                </p>
            </div>
        </div>
        
        
     <script>
	    let currentIndex = 0; // 현재 표시된 이미지 인덱스
	    const images = [
	        "${pageContext.request.contextPath}/resources/images/room/suite1.jpg",
	        "${pageContext.request.contextPath}/resources/images/room/suite2.jpg",
	        "${pageContext.request.contextPath}/resources/images/room/suite3.jpg",
	        "${pageContext.request.contextPath}/resources/images/room/suite4.jpg"
	    ]; // 이미지 경로 배열
	    const totalImages = images.length; // 이미지의 총 개수
	
	    // 이미지 순서 표시 업데이트 함수
	    function updateImageCounter() {
	        document.getElementById("currentIndex").textContent = currentIndex + 1; // 현재 이미지 번호
	        document.getElementById("totalImages").textContent = totalImages; // 총 이미지 개수
	    }
	
	    // 슬라이드 이미지 변경 함수
	    function changeImage() {
	        const imgElement = document.querySelector(".slider-image"); // 이미지 요소
	        imgElement.src = images[currentIndex]; // 현재 인덱스에 해당하는 이미지로 변경
	        updateImageCounter(); // 이미지 번호 업데이트
	    }
	
	    // 이전 버튼 클릭 시
	    document.querySelector(".prev-btn").addEventListener("click", function() {
	        currentIndex = (currentIndex === 0) ? totalImages - 1 : currentIndex - 1; // 인덱스를 순환
	        changeImage();
	    });
	
	    // 다음 버튼 클릭 시
	    document.querySelector(".next-btn").addEventListener("click", function() {
	        currentIndex = (currentIndex === totalImages - 1) ? 0 : currentIndex + 1; // 인덱스를 순환
	        changeImage();
	    });
	
	    // 초기 이미지 설정
	    changeImage();
	</script>


        <br>


       <div class="roomDescription2">
		    <div class="info1">
	         	<h4>객실 기본정보</h4>
			    <p><strong>룸구성 </strong>| 거실, 주방, 방 2, 화장실 2</p>
			    <p><strong>기본 세면용품 </strong>| 타올/비누/샴푸/바디워시</p>
			    <p><strong>입실/퇴실 </strong>| 15:00 ~ 11:00</p>
			    <p><strong>정원 </strong>| 4인 1실</p>
		
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
				    <button class="reserve-btn" data-roomtype="스위트" onclick="payStep(this);">객실 예약</button>
				</div>

	<!-- location.href='payStep1.ro' -->
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
    <script>
	// 서버에서 로그인 상태를 JavaScript 변수로 전달
	// 서버에서 로그인 상태를 JavaScript 변수로 전달
	const memberNo = "${sessionScope.loginMember != null ? sessionScope.loginMember.memberNo : null}";

	function payStep(button) {

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
    </script>
<jsp:include page="../common/footer.jsp" />
</body>
</html>