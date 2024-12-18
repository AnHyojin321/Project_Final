<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
}

.footer {
    background-color: #2a2a72;
    color: #fff;
    position: relative;
    padding: 30px 20px;
    text-align: center;
    overflow: hidden;
}

.footer-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    max-width: 1200px;
    margin: 0 auto;
    flex-wrap: wrap;
}

.footer-left h2 {
    font-size: 1.8rem;
    margin-bottom: 10px;
}

.footer-left p {
    margin: 5px 0;
    font-size: 0.9rem;
    opacity: 0.8;
}

.footer-right {
    margin-top: 90px;
}

.footer-right ul {
    list-style: none;
    padding: 0;
    margin: 0;
    display: flex;
    gap: 15px;
}

.footer-right ul li {
    display: inline;
}

.footer-right ul li a {
    color: #85caed;
    text-decoration: none;
    font-size: 0.9rem;
    transition: color 0.3s ease;
}

.footer-right ul li a:hover {
    color: #fff;
}

.footer-decoration {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    pointer-events: none;
    overflow: hidden;
}

.snowflake {
    position: absolute;
    font-size: 1.5rem;
    color: #85caed;
    animation: fall 10s linear infinite;
}

.snowflake:nth-child(1) {
    left: 10%;
    animation-delay: 0s;
}

.snowflake:nth-child(2) {
    left: 50%;
    animation-delay: 3s;
}

.snowflake:nth-child(3) {
    left: 80%;
    animation-delay: 5s;
}

@keyframes fall {
    0% {
        top: -10%;
        opacity: 0;
    }
    10% {
        opacity: 1;
    }
    100% {
        top: 110%;
        opacity: 0;
    }
}

</style>
</head>
<body>
    <footer class="footer">
        <div class="footer-container">
            <div class="footer-left">
                <h2>SEOLLEENUN</h2>
                <p>Ski & Resort - Premium Adventure Shop</p>
                <p>&copy; 2024 SEOLLEENUN. All rights reserved.</p>
            </div>
            <div class="footer-right">
                <ul>
                    <li><a href="#">문의하기</a></li>
                    <li><a href="#">이용약관</a></li>
                    <li><a href="#">개인정보처리방침</a></li>
                </ul>
            </div>
        </div>
        <div class="footer-decoration">
            <div class="snowflake">❄</div>
            <div class="snowflake">❄</div>
            <div class="snowflake">❄</div>
        </div>
    </footer>
</body>
</html>