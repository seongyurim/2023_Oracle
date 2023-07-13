<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index NEW</title>
</head>
<body>
    <h1>안녕하세요! 로그인 해주세요.</h1>
    <input type="submit" id="btnLogin" value="로그인">

    <script>
        const $btnLogin = document.querySelector('#btnLogin');
        $btnLogin.addEventListener('click', ()=>{
            location.href = '/login';
        });
    </script>
</body>
</html>