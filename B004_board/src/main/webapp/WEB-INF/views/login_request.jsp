<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login_request</title>
</head>
<body>
    <h1>Login Request</h1>

    <ul>
        <li>아이디: <%= request.getParameter("userId") %></li>
        <li>비밀번호: <%= request.getParameter("userPw") %></li>
    </ul>

</body>
</html>