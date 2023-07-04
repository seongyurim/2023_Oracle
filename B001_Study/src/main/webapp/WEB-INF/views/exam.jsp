<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%! <!-- %!는 선언부 -->
String str1 = "Exam";
String str2 = "jsp";

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Exam</title>
</head>
<body>
    <h1>Exam.jsp</h1>
    <h1><%= str1 %></h1> <!-- %=는 expression!(자바 표현식) not statement -->
    <h1><%= str2 %></h1>
    <h1><%= str1 + "." + str2 %></h1>

    <p>
        <% <!-- %는 expression(X) statement(O) -->
        out.println(str1 + "." + str2 + "파일입니다.");
        %>
    </p>
</body>
</html>