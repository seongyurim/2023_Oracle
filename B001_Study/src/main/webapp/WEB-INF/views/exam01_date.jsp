<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Exam01_date</title>
</head>
<body>
    <h1>Exam01_date.jsp</h1>

    <%
    Date today = new Date();
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    String todayStr = dateFormat.format(today);
    out.println("<h1>오늘날짜: " + todayStr + "</h1>");

    <!-- 
        선언부에 들어가야 할 것을 이렇게 구현부에 넣으면 오류 발생
        이것은 마치 자바에서 메인함수에 함수를 만들어 넣는 것과 같다.
        public int add(int a, int b) {
        return a + b;
    } -->
    
    %>

</body>
</html>