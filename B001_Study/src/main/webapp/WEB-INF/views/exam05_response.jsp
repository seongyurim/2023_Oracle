<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Exam05_response</title>
</head>
<body>
    <h1>Exam05_response.jsp</h1>

    <form action="/exam05_response_info" method="post">
        <fieldset>
            <p><label for="userId">아이디 </label> <input type="text" name="userId" id="userId"></p>
            <p><label for="userPw">비밀번호 </label> <input type="password" name="userPw" id="userPw"></p>
        </fieldset>
        <br><input type="submit" value="로그인">
    </form>

</body>
</html>