<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 20px;
        }
        .form-container {
            background-color: white;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: 0 auto;
        }
        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-group input, .form-group textarea {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .form-group textarea {
            resize: vertical;
            height: 100px;
        }
        .form-group input[type="file"] {
            padding: 5px;
        }
        .form-group button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }
        .form-group button:hover {
            background-color: #45a049;
        }
        .form-group .checkbox-group {
            display: flex;
            gap: 20px;
        }
    </style>
</head>
<body>
	  <div class="form-container">
        <h2>객실 등록</h2>
        <form action="insert.ro" method="POST" enctype="multipart/form-data">
            <!-- 객실명 입력 -->
            <div class="form-group">
                <label for="roomName">객실명</label>
                <input type="text" id="roomName" name="roomName" required>
            </div>
            
            <!-- 객실 타입 선택 (체크박스) -->
            <div class="form-group">
                <label>객실 타입</label>
                <div class="checkbox-group">
                    <label>
                        <input type="checkbox" name="roomType" value="스탠다드"> 스탠다드
                    </label>
                    <label>
                        <input type="checkbox" name="roomType" value="디럭스"> 디럭스
                    </label>
                    <label>
                        <input type="checkbox" name="roomType" value="패밀리"> 패밀리
                    </label>
                </div>
            </div>

            <!-- 객실 설명 입력 -->
            <div class="form-group">
                <label for="roomDescription">객실 설명</label>
                <textarea id="roomDesc" name="roomDesc" required></textarea>
            </div>

            <!-- 수용인원 입력 -->
            <div class="form-group">
                <label for="capacity">수용 인원</label>
                <input type="number" id="capacity" name="capacity" required min="1">
            </div>

            <!-- 숙박비 입력 -->
            <div class="form-group">
                <label for="price">숙박비 (원)</label>d
                <input type="number" id="roomPrice" name="roomPrice" required min="0">
            </div>

            <!-- 썸네일 이미지 업로드 -->
            <div class="form-group">
                <label for="thumbnail">썸네일 이미지 (1개)</label>
                <input type="file" id="thumbnail" name="upfiles" accept="image/*" required>
            </div>

            <!-- 상세 이미지 업로드 (최대 5개) -->
            <div class="form-group">
                <label for="detailImages">상세 이미지 (최대 5개)</label>
                <input type="file" id="detailImages" name="upfiles" accept="image/*" >
                <input type="file" id="detailImages" name="upfiles" accept="image/*" >
                <input type="file" id="detailImages" name="upfiles" accept="image/*" >
                <input type="file" id="detailImages" name="upfiles" accept="image/*" >
                <input type="file" id="detailImages" name="upfiles" accept="image/*" >
                <small>최대 5개 이미지 선택 가능</small>
            </div>

            <!-- 제출 버튼 -->
            <div class="form-group">
                <button type="submit">등록하기</button>
            </div>
        </form>
    </div>
</body>
</html>