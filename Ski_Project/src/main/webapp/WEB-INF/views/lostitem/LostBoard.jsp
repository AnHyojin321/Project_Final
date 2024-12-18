<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.kh.ski.lostitem.model.vo.LostItem" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>분실물 게시판</title>
</head>
<body>
    <h1>분실물 게시판</h1>
    <table border="1" cellspacing="0" cellpadding="10">
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>장소</th>
            <th>내용</th>
            <th>작성일</th>
            <th>조회수</th>
        </tr>
        <%
            List<LostItem> list = (List<LostItem>) request.getAttribute("lostList");
            if (list != null) {
                for (LostItem item : list) {
        %>
        <tr>
            <td><%= item.getLostNo() %></td>
            <td><%= item.getLostTitle() %></td>
            <td><%= item.getLostLocation() %></td>
            <td><%= item.getLostContent() %></td>
            <td><%= item.getCreateDate() %></td>
            <td><%= item.getCount() %></td>
        </tr>
        <%
                }
            }
        %>
    </table>
</body>
</html>
