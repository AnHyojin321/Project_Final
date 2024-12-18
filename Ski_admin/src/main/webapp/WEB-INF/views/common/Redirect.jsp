<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>메시지</title>
    <script>
        function redirect() {
            alert("<%= request.getAttribute("msg") %>");
            location.href = "<%= request.getAttribute("url") %>";
        }
    </script>
</head>
<body onload="redirect()">
</body>
</html>
