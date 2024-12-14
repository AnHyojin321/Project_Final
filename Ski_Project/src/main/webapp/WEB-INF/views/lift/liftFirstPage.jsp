<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>리프트권 페이지</title>
<style>
    body {
        margin: 0;
        padding: 0;
    }
    #outer {
        height: 100vh;
        display: flex;
    }
    .liftDiv {
        width: 50%;
        height: 100%;
        position: relative;
        overflow: hidden;
    }
    .liftDiv::after {
        content: "";
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0);
        transition: background-color 0.3s ease;
        z-index: 1;
        pointer-events: none; /* Click-through for a tags */
    }
    .liftDiv:hover::after {
        background-color: rgba(0, 0, 0, 0.5);
    }
    img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        position: relative;
        z-index: 0;
    }
    .textOverlay {
        position: absolute;
        top: 70%;
        left: 55%;
        transform: translate(-10%, -40%);
        color: white;
        font-size: 3rem;
        font-weight: bold;
        text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7);
        z-index: 2;
    }
    .detail {
        font-size: 1.3rem;
    }
    a {
        text-decoration: none;
        color: inherit;
    }
</style>
</head>
<body>
    <div id="outer">
        <div class="liftDiv">
            <a href="dayPass.li">
                <span class="textOverlay">
                    24/25 <br>DAY PASS <br>
                    <span class="detail">
                        Morning Pass (09:00-14:00)<br>
                        Afternoon Pass (16:00-21:00)<br>
                        Full-Day Pass  (09:00-21:00)<br>
                        Grooming Time (14:00-16:00)<br>
                    </span>
                </span>
                <img src="image/ski1.jpg">
            </a>
        </div>
        <div class="liftDiv">
            <a href="seasonPass.li">
                <span class="textOverlay">
                    24/25 <br>SEASON PASS <br>
                    <span class="detail">
                        24/25 All Season <br>
                        Grooming Time (14:00-16:00)<br>
                    </span>
                </span>
                <img src="image/ski2.jpg">
            </a>
        </div>
    </div>
</body>
</html>