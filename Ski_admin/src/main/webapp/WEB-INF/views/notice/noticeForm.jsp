<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>공지사항 작성</title>
    <!-- jQuery (반드시 가장 먼저 로드) -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Summernote CSS -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.css" rel="stylesheet">
    <!-- Summernote JS -->
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.js"></script>
    <!-- Summernote Language (Korean) -->
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/lang/summernote-ko-KR.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        h1 {
            text-align: center;
            margin-top: 20px;
            font-size: 30px;
        }

        .form-container {
            width: 60%;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }

        label {
            display: block;
            margin: 10px 0 5px;
            font-weight: bold;
        }

        input, textarea, select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
        }

        .btn {
            display: inline-block;
            padding: 10px 15px;
            background-color: #2c3e50;
            color: #fff;
            border-radius: 5px;
            text-decoration: none;
            font-size: 14px;
            text-align: center;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #2980b9;
        }
        .content {
	flex:1;
	width:100%;
    padding: 30px;
    background-color: #f8f9fa;
}
    </style>
</head>
<body>
              <div class="admin-container">
        <jsp:include page="../common/sidebar.jsp" />
        <main class="content">

    <h1>공지사항 작성</h1>

    <div class="form-container">
        <form action="/admin/insertNotice" method="post">
            <label for="title">제목</label>
            <input type="text" id="title" name="noticeTitle" required>

            <label for="content">내용</label>
            <textarea id="content" name="noticeContent"></textarea>

            <button type="submit" class="btn">등록</button>
               <a href="/admin/noticeList" class="btn">목록으로</a>
        </form>
    </div>

    <!-- Summernote 초기화 -->
    <script>
        $(document).ready(function() {
            $('#content').summernote({
                height: 300, // 높이 설정
                lang: 'ko-KR', // 한국어 설정
                placeholder: '내용을 입력하세요...'
            });
        });
    </script>
    
       </main>
	</div>
</body>
</html>
 