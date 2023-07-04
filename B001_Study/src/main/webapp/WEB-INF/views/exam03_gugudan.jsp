<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
int gugu;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Exam03_gugudan</title>
</head>
<body>
    <h1>Exam03_gugudan</h1>

    <%
    try {
        int dan = Integer.parseInt(request.getParameter("dan"));
        int gugu = 1;

        if ((dan < 2) || (dan > 9)) {
            out.println("[알림] 구구단 범위를 벗어났습니다.");
            return;
        }

        out.println("[알림] 구구단 " + dan + "단을 출력합니다. <br>");
        out.println("<p>");
        for(int i = 0; i < 9; i++) {
            out.println(dan + " * " + gugu + " = " + (dan*gugu) + "<br>");
            gugu++;
        }
        out.println("</p>");

    } catch (Exception e) {
        out.println("[알림] 구구단 값이 입력되지 않았습니다.");
    }
    %>

</body>
</html>