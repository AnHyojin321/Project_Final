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
    background: linear-gradient(to bottom, #2a2a72, #304987);
    color: #fff;
    position: relative;
    padding: 40px 20px;
    text-align: center;
    overflow: hidden;
    box-shadow: 0px -4px 10px rgba(0, 0, 0, 0.2);
}

.footer-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    max-width: 1200px;
    margin: 0 auto;
    flex-wrap: wrap;
    gap: 20px;
}

.footer-left h2 {
    font-size: 2rem;
    margin-bottom: 10px;
    color: #85caed;
    text-shadow: 2px 2px 5px rgba(255, 255, 255, 0.6);
}

.footer-left p {
    margin: 5px 0;
    font-size: 0.9rem;
    opacity: 0.9;
}

.footer-right {
    margin-top: 90px;
}

.footer-right ul {
    list-style: none;
    padding: 0;
    margin: 0;
    display: flex;
    gap: 20px;
}

.footer-right ul li {
    display: inline;
}

.footer-right ul li a {
    color: #85caed;
    text-decoration: none;
    font-size: 1rem;
    transition: color 0.3s ease, transform 0.2s ease;
}

.footer-right ul li a:hover {
    color: #fff;
    transform: scale(1.1);
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
    opacity: 0.8;
}

.snowflake:nth-child(1) {
    left: 10%;
    animation-delay: 0s;
}

.snowflake:nth-child(2) {
    left: 30%;
    animation-delay: 2s;
}

.snowflake:nth-child(3) {
    left: 50%;
    animation-delay: 4s;
}

.snowflake:nth-child(4) {
    left: 70%;
    animation-delay: 6s;
}

.snowflake:nth-child(5) {
    left: 90%;
    animation-delay: 8s;
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
              <div class="snowflake">❄</div>
            <div class="snowflake">❄</div>
        </div>
    </footer>
</body>
</html>