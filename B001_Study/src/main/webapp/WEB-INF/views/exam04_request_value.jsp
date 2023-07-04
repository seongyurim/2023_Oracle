<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>exam04_request_value</title>
</head>
<body>
    <h1>회원정보</h1>
    
    <%
    String userId     = request.getParameter("userId");
    String userEmail  = request.getParameter("userEmail");
    String gender     = request.getParameter("gender");
    String intro      = request.getParameter("intro");
    String interest[] = request.getParameterValues("interest");
    String strInterest = "";

    if (interest != null) {
        for (int i = 0; i < interest.length; i++) {
            strInterest += interest[i] + " ";
        }
    }
    %>

    <ul>
        <li>아이디: <%= userId %></li>
        <li>이메일 <%= userEmail %></li>
        <li>성별: <%= gender %></li>
        <li>관심사: <%= strInterest %></li>
        <li>자기소개: <%= intro %></li>
    </ul>
</body>
</html>