<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Exam02_try</title>
</head>
<body>
    <h1>Exam02_try</h1>    
    <%
    try {
        int age = Integer.parseInt(request.getParameter("age"));
        out.println("당신의 나이는 " + age + "세입니다.");
    }
    catch (Exception e) {
        out.println("당신의 나이를 가져올 수 없습니다.");
    }
    %>
</body>
</html>