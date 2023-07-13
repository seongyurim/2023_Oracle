<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login NEW</title>
</head>
<body>
    <h1>Login</h1>

    <form action="/login" method="post">
        <fieldset>
            <p><label for="userId">아이디 </label> <input type="text" name="userId" id="userId"></p>
            <p><label for="userPw">비밀번호 </label> <input type="text" name="userPw" id="userPw"></p>
        </fieldset>
        <br>
        <input type="submit" value="로그인">
        <input type="submit" id="btnBack" value="뒤로가기">
        <hr>
        <input type="submit" value="아이디찾기">
        <input type="submit" value="비밀번호찾기">
    </form>

    <script>
        const $btnBack = document.querySelector('#btnBack');
        $btnBack.addEventListener('click', ()=>{
            // history.back();
            location.href = '/index';
        });
    </script>

</body>
</html>