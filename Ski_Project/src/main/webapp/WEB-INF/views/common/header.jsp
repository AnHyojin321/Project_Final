<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* Reset */
body, html {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    box-sizing: border-box;
}

header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 20px 40px;
    background: linear-gradient(to right, #2a2a72, #1e2a50);
    color: white;
    height: 40px;
}

.header-left {
    display: flex;
    flex-direction: column;
}

.brand-title {
    font-size: 1.5rem;
    font-weight: bold;
    margin: 0;
}

.brand-subtitle {
    font-size: 0.9rem;
    margin: 5px 0 0;
    opacity: 0.8;
}

.header-right {
    display: flex;
    align-items: center;
    gap: 20px;
}

.btn-contact {
    display: flex;
    align-items: center;
    background-color: #365edc;
    color: white;
    padding: 8px 16px;
    border: none;
    border-radius: 10px;
    font-size: 0.9rem;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.btn-contact:hover {
    background-color: #2747a5;
}

.btn-contact .icon {
    width: 16px; /* 이미지 너비 */
    height: 16px; /* 이미지 높이 */
    margin-right: 8px; /* 이미지와 텍스트 간격 */
}


.menu-icon {
    position: relative;
    text-align: center;
    font-size: 1rem;
    font-weight: bold;
    color: white;
}

.menu-icon span {
	font-size : 13px;
    display: block;
    margin-top: 20px; /* 텍스트와 이미지 사이 여백 */
}

.menu-icon::before {
    content: "";
    position: absolute;
    top: -20px; /* 이미지 위치 조정 */
    left: 50%;
    transform: translateX(-50%);
    width: 40px; /* 이미지 크기 */
    height: 40px;
    background-image: url('resources/images/menu.png'); /* 이미지 경로 */
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
}


</style>
</head>
<body>
    <header class="header">
        <div class="header-left">
            <p class="brand-title">[Adv:nture]</p>
            <p class="brand-subtitle">MAKE YOUR</p>
        </div>
        <div class="header-right">
            <button class="btn-contact">
                <img src="resources/images/question.png" alt="돋보기 아이콘" class="icon"> 문의하기
            </button>
            
            <div class="menu-icon">
                <span>MENU</span>
            </div>
        </div>
    </header>
    	<script>
		if("${sessionScope.alertMsg}" != ""){
			alert("${sessionScope.alertMsg}");		
		}
	</script>
	<c:remove var="alertMsg" scope="session"/>
</body>
</html>