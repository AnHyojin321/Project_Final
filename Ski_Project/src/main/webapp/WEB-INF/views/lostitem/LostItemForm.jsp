<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>분실물 등록</title>
    <!-- jQuery (반드시 가장 먼저 로드) -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Summernote CSS -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.css" rel="stylesheet">
    <!-- Summernote JS -->
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.js"></script>
    <!-- Summernote Language (Korean) -->
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/lang/summernote-ko-KR.min.js"></script>
</head>
<body>
    <h1>분실물 등록</h1>
    <form action="insertLostItem" method="post" enctype="multipart/form-data">
        <label for="lostTitle">제목:</label>
        <input type="text" id="lostTitle" name="lostTitle" required><br>

          <label for="lostLocation">위치:</label>
        <!-- 드롭다운 메뉴 -->
        <select id="lostLocation" name="lostLocation" required>
            <option value="">위치를 선택하세요</option>
            <option value="전체">전체</option>
            <option value="리조트">리조트</option>
            <option value="로비">로비</option>
            <option value="슬로프">슬로프</option>
            <option value="리프트">리프트</option>
            <option value="주차장">주차장</option>
            
        </select>
        <br>
        <label for="lostContent">내용:</label>
        <textarea id="lostContent" name="lostContent"></textarea><br>

        <button type="submit">등록</button>
    </form>

    <!-- Summernote 초기화 -->
    <script>
        $(document).ready(function() {
            $('#lostContent').summernote({
                height: 300, // 높이 설정
                lang: 'ko-KR', // 한국어 설정
                placeholder: '내용을 입력하세요...'
            });
        });
    </script>
</body>
</html>
