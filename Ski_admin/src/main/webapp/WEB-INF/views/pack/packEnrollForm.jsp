<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


    .container {
        width: 1000px;
        padding: 20px;
        margin : 30px 50px;
        item-align : center;
        border : 1px dashed black;
        border-radius : 10px;
    }

    .container h1 {
        text-align: center;
        margin-bottom: 20px;
        font-size: 24px;
        color: #333;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }

    table td {
        padding: 10px;
        vertical-align: top;
    }

    table td label {
        font-weight: bold;
        color: #555;
        display: inline-block;
        vertical-align: middle;
        font-weight: bold;
        color: #555;
    }

    table td input, table td select {
        width: calc(100% - 10px);
        padding: 8px;
        border: 1px solid #ddd;
        border-radius: 4px;
        box-sizing: border-box;
        vertical-align: middle;
        width: 100%;
        padding: 8px;
        border: 1px solid #ddd;
        border-radius: 4px;
        box-sizing: border-box;
    }

    table td input[type="radio"] {
        width: auto;
        margin-right: 5px;
        vertical-align: middle;
        width: auto;
        margin-right: 5px;
    }

    .form-group {
        text-align: center;
    }

    .form-group button {
        width: 50%;
        padding: 10px;
        background-color: #007BFF;
        color: #fff;
        border: none;
        border-radius: 4px;
        font-size: 16px;
        cursor: pointer;
    }

    .form-group button:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
	<div class="admin-container">
	<jsp:include page="../common/sidebar.jsp" />
	<main class="content">
    <div class="container">
        <h1>패키지 등록</h1>
        <form action="insertPackage.pk" method="post" enctype="multipart/form-data">
            <table>
                <tr>
                    <td><label for="packageName">패키지 이름</label></td>
                    <td><input type="text" id="packageName" name="packageName" required></td>
                </tr>
                <tr>
                    <td><label for="productComposit">패키지 구성</label></td>
                    <td><input type="text" id="productComposit" name="productComposit" required></td>
                </tr>
                <tr>
                    <td><label for="packagePrice">패키지 가격</label></td>
                    <td><input type="number" id="packagePrice" name="packagePrice" required></td>
                </tr>
                <tr>
                    <td><label for="startDate">패키지 시작 이용 날짜</label></td>
                    <td><input type="date" id="availableStartDate" name="availableStartDate" required></td>
                </tr>
                <tr>
                    <td><label for="endDate">패키지 마감 날짜</label></td>
                    <td><input type="date" id="availableEndDate" name="availableEndDate" required></td>
                </tr>
                <tr>
                    <td><label for="packageSet">패키지 종류</label></td>
                    <td>
                        <input type="radio" id="type1" name="packageSet" value="1">
                        <label for="type1">객실+리프트</label><br>
                        <input type="radio" id="type2" name="packageSet" value="2">
                        <label for="type2">리프트+락커</label><br>
                        <input type="radio" id="type3" name="packageSet" value="3">
                        <label for="type3">객실+리프트+락커</label>
                    </td>
                </tr>
                <tr>
                    <td><label for="upfile">패키지 이미지</label></td>
                    <td><input type="file" id="upfile" name="upfile" accept="image/*"></td>
                </tr>
            </table>
            <div class="form-group">
                <button type="submit">등록하기</button>
            </div>
        </form>
    </div>
    
    </main>
    </div>
</body>
</html>