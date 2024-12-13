<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패키지 수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
/* 기존 스타일 그대로 사용 */
body {
    font-family: 'Arial', sans-serif;
    margin: 0;
    padding: 0;
    background: linear-gradient(135deg, #e2ebf0, #f7f9fc);
    display: flex;
    justify-content: center;
    align-items: center;
}
.card-container {
    width: 1000px;
    background-color: #fff;
    overflow: hidden;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}
.card-header {
    padding: 20px;
    background-color: #85caed;
    color: #fff;
    text-align: center;
}
.card-header h1 {
    font-size: 23px;
    margin-bottom: 5px;
}
.card-details {
    padding: 20px;
}
.detail-row {
    margin-bottom: 15px;
}
.label {
    font-weight: bold;
    color: #333;
    margin-bottom: 5px;
}
.input-field, .textarea-field, .select-field {
    width: 100%;
    padding: 10px;
    font-size: 16px;
    margin-bottom: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
}
.card-footer {
    padding: 20px;
    display: flex;
    justify-content: flex-end;
    background-color: #f4f4f4;
}
.btn {
    padding: 10px 20px;
    font-size: 1rem;
    border-radius: 5px;
    border: none;
    cursor: pointer;
    transition: background-color 0.3s ease;
}
.btn.save {
    background-color: #28a745;
    color: #fff;
}
.btn.save:hover {
    background-color: #218838;
}
.btn.back {
    background-color: #6c757d;
    color: #fff;
}
.btn.back:hover {
    background-color: #5a6268;
}
</style>
</head>
<body>
    <div class="card-container">
        <header class="card-header">
            <h1>패키지 수정</h1>
        </header>

        <form action="update.pk" method="post">
            <div class="card-details">
                <div class="detail-row">
                    <label for="packageName" class="label">패키지 이름</label>
                    <input type="text" id="packageName" name="packageName" class="input-field" value="${p.packageName}" required>
                </div>
                <div class="detail-row">
                    <label for="packagePrice" class="label">가격</label>
                    <input type="number" id="packagePrice" name="packagePrice" class="input-field" value="${p.packagePrice}" required>
                </div>
                <div class="detail-row">
                    <label for="availableDates" class="label">판매 기간</label>
                    <input type="date" id="availableStartDate" name="availableStartDate" class="input-field" value="${p.availableStartDate}" required>
                    <input type="date" id="availableEndDate" name="availableEndDate" class="input-field" value="${p.availableEndDate}" required>
                </div>
                <div class="detail-row">
                    <label for="productComposit" class="label">상품 구성</label>
                    <textarea id="productComposit" name="productComposit" class="textarea-field" required>${p.productComposit}</textarea>
                </div>
                <div class="detail-row">
                    <label for="packageSet" class="label">패키지 세트</label>
                    <select id="packageSet" name="packageSet" class="select-field" required>
                        <option value="1" ${p.packageSet == 1 ? 'selected' : ''}>객실+리프트</option>
                        <option value="2" ${p.packageSet == 2 ? 'selected' : ''}>리프트+락커</option>
                        <option value="3" ${p.packageSet == 3 ? 'selected' : ''}>객실+리프트+락커</option>
                    </select>
                </div>
                <div class="detail-row">
                    <label for="packageStatus" class="label">상태</label>
                    <select id="packageStatus" name="packageStatus" class="select-field" required>
                        <option value="Y" ${p.packageStatus == 'Y' ? 'selected' : ''}>판매중</option>
                        <option value="N" ${p.packageStatus == 'N' ? 'selected' : ''}>판매종료</option>
                    </select>
                </div>
				<div class="detail-row">
				    <label for="packImgPath" class="label">현재 이미지</label>
				    <img id="currentImage" src="${p.packImgPath}" class="preview-image">
				</div>
				<div class="detail-row">
				    <label for="upfile" class="label">새 이미지 업로드</label>
				    <input type="file" id="upfile" name="reupfile" class="input-field">
				    <img id="previewImage" class="preview-image" style="display: none;">
				</div>
            </div>

            <footer class="card-footer">
                <button type="submit" class="btn save">저장</button>
                <a href="/admin/list.pk" class="btn back">취소</a>
            </footer>

            <input type="hidden" name="packageNo" value="${p.packageNo}">
        </form>
    </div>
    <script>
    $(document).ready(function () {
        // 새 이미지 업로드 이벤트 핸들러
        $('#reupfile').on('change', function (event) {
            const file = event.target.files[0]; // 선택한 파일
            if (file) {
                const reader = new FileReader(); // FileReader 객체 생성
                
                reader.onload = function (e) {
                    // 새 이미지 미리 보기
                    $('#previewImage').attr('src', e.target.result).show(); // 새 이미지 표시
                    $('#currentImage').hide(); // 기존 이미지 숨김
                };

                reader.readAsDataURL(file); // 파일 데이터를 읽어 Base64로 변환
            } else {
                // 파일이 없을 경우 기본 상태로 복귀
                $('#previewImage').hide();
                $('#currentImage').show();
            }
        });
    });

    </script>
</body>
</html>
