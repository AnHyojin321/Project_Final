<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>환불 조회</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background-color: #f8f9fa;
            padding: 50px;
        }
        .menu {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 50px;
        }
        .menu button {
            padding: 15px 30px;
            font-size: 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .menu button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h1>환불 유형 선택</h1>
    <div class="menu">
        <form action="refund/lockerRefund" method="get">
            <button type="submit">락커 환불</button>
        </form>
        <form action="refund//packageRefund" method="get">
            <button type="submit">패키지 환불</button>
        </form>
        <form action="refund/liftRefund" method="get">
            <button type="submit">리프트권 환불</button>
        </form>
        <form action="refund/roomRefund" method="get">
            <button type="submit">객실 환불</button>
        </form>
    </div>
</body>
</html>
