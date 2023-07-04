<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Exam04_request</title>
</head>
<body>
    <h1>Exam04_request</h1>

    <%
    // class ApplicationHttpRequest extends HttpServletRequestWrapper // 자식 extends 부모
    // class HttpServletReqestWrapper implements HttpServletRequest // 구현 implements 인터페이스
    out.println(request.getClass());
    %>

    <br><br><hr>
    <h2>1. 클라이언트와 서버의 환경정보 읽기</h2>
    <p><a href="http://localhost:9090/exam04_request_info?eng=hello&ko=안녕">GET 방식으로 요청</a></p>

    <p>
        <form action="/exam04_request_info" method="post">
            영어: <input type="text" name="eng" value="hi"> <br>
            한글: <input type="text" name="ko" value="반갑습니다."> <br><br>
            <input type="submit" value="POST 방식으로 요청">
        </form>
    </p>

    <br><br><hr>
    <h2>2. 클라이언트의 Request Parameter 읽기</h2>

    <form action="/exam04_request_value" method="post">
        <p>아이디 <input type="text" name="userId" value="mongmongeo"></p>
        <p>이메일 <input type="text" name="userEmail" value="eo2013@gmail.com"></p>
    
        <p>성별
        <input type="radio" name="gender" id="gender_male" value="남성"><label for="gender_male">남성</label>
        <input type="radio" name="gender" id="gender_female" value="여성" checked><label for="gender_female">여성</label></p>
    
        <p>관심사항
        <label><input type="checkbox" name="interest" value="정치" checked>정치</label>
        <label><input type="checkbox" name="interest" value="경제" checked>경제</label>
        <label><input type="checkbox" name="interest" value="사회">사회</label>
        <label><input type="checkbox" name="interest" value="문화">문화</label></p>
    
        <p>자기소개<br>
        <textarea name="intro" id="" cols="30" rows="10">안녕하세요. 강아지입니다.</textarea></p>
    
        <input type="submit" value="전송하기">
    </form>

</body>
</html>