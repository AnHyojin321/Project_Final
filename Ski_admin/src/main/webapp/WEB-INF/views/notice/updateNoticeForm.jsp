<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>공지사항 수정</title>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Summernote CSS -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.css" rel="stylesheet">
    <!-- Summernote JS -->
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.js"></script>
    <!-- Summernote Language Pack -->
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/lang/summernote-ko-KR.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#noticeContent').summernote({
                height: 300,
                lang: 'ko-KR',
                placeholder: '내용을 입력하세요...'
            });
        });
    </script>
</head>
<body>
    <div>
        <h1>공지사항 수정</h1>
        <form action="/admin/updateNotice" method="post">
            <input type="hidden" name="noticeNo" value="${notice.noticeNo}">
            
            <label for="noticeTitle">제목</label>
            <input type="text" id="noticeTitle" name="noticeTitle" value="${notice.noticeTitle}" required>
            
            <label for="noticeContent">내용</label>
            <textarea id="noticeContent" name="noticeContent">${notice.noticeContent}</textarea>
            
            <button type="submit">수정</button>
        </form>
    </div>
</body>
</html>
