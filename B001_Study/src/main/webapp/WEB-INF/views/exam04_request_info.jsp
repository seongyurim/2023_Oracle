<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Exam04_request_info</title>
</head>
<body>
    <h1>Exam04_request_info</h1>
    <p>
        <strong>1. 일반적인 정보</strong><br>
        <ul>
            <li>데이터 전송 메소드: <%= request.getMethod() %></li>
            <li>URL: <%= request.getRequestURL() %></li>
            <li>URI: <%= request.getRequestURI() %></li>
            <li>프로토콜: <%= request.getProtocol() %></li>
            <li>서버명: <%= request.getServerName() %></li>
            <li>서버포트: <%= request.getServerPort() %></li>
        </ul>
    </p>
    <p>
        <strong>2. 중요한 정보</strong>
        <ul>
            <li>클라이언트IP: <%= request.getRemoteAddr() %></li>
            <li>클라이언트Port: <%= request.getRemotePort() %></li>
            <li>Query String: <%= request.getQueryString() %></li>
            <li>Param1: <%= request.getParameter("eng") %></li>
            <li>Param2: <%= request.getParameter("ko") %></li>
        </ul>
    </p>

</body>
</html>