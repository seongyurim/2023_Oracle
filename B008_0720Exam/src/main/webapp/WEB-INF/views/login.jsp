<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>0720 - LOGIN</title>
</head>
<body>
    <h1>LOGIN</h1>
    <hr>
    <p>
        <form action="/login" method="post" id="formLogin">
            <table>
                <tr>
                    <td><label for="userId">아이디</label></td>
                    <td><input type="text" name="MEMBERID" id="memberId"></td>
                </tr>
                <tr>
                    <td><label for="userPw">비밀번호</label></td>
                    <td><input type="password" name="MEMBERPW" id="memberPw"></td>
                </tr>
            </table>
        </form>
    </p>
    <p>
        <button type="button" id="btnLogin">로그인</button>
        <button type="button" id="btnJoin">회원가입</button>
        <button type="button" id="btnIndex">메인으로</button>
    </p>

    <script src="/JS/jquery-3.7.0.min.js"></script>

    <script>
    (()=>{
        const memberId = document.querySelector('#memberId');
        const memberPw = document.querySelector('#memberPw');
        const btnLogin = document.querySelector('#btnLogin');
        const btnJoin  = document.querySelector('#btnJoin');
        const btnIndex = document.querySelector('#btnIndex');



        
        ////// 이벤트 리스너 ////////////////////////////////////////////////////////////////////////////

        btnLogin.addEventListener('click', ()=>{
            if ((memberId.value.length === 0) || (memberPw.value.length === 0)) {
                alert('아이디 혹은 비밀번호가 입력되지 않았습니다.');
                return;
            }
            const formLogin = document.querySelector('#formLogin');
            formLogin.submit();
        });

        btnJoin.addEventListener('click', ()=>{
            location.href = '/join';
        });

        btnIndex.addEventListener('click', ()=>{
            location.href = '/index';
        });
        
    })();
    </script>
</body>
</html>