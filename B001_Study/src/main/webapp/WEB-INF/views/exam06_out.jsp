<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>exam06_out</title>
</head>
<body>
    <h1>exam06_out.jsp</h1>
    <%
    out.println(out.getClass());

    out.println("<h1>out object</h1>");

    out.print("출력버퍼크기: " + out.getBufferSize() + "<br>"); // 8192 출력
    
    out.print("남은버퍼크기: " + out.getRemaining() + "<br>"); // 7972 출력

    out.flush(); // 버퍼를 비우는 것
    out.print("flush 메소드로 버퍼를 비웠어요!" + "<br>");

    out.print("출력버퍼크기: " + out.getBufferSize() + "<br>"); // 8192 출력 
    %>
</body>
</html>