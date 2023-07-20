<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>0720 - INDEX</title>
</head>
<body>
    <h1>INDEX</h1>
    <hr>
    <p id="welcomeMsg"></p>
    <p>
        <button type="button" id="btnLogin">로그인</button>
        <button type="button" id="btnJoin">회원가입</button>
</p>



    <script>
    (()=>{
        let sessionState = false;
        const welcomeMsg = document.querySelector('#welcomeMsg');
        const btnLogin = document.querySelector('#btnLogin');
        const btnJoin = document.querySelector('#btnJoin');


        ////// 함수부 ///////////////////////////////////////////////////////////////////////////////////

        // 세션 존재 여부 확인
        const setSessionState = function() {
            if ('${vo.MEMBERID}' === '') {
                sessionState = false;
            }
            else {
                sessionState = true;
            }
        }

        // 웰컴메세지 작성
        const setWelcomeMsg = function() {
            if (sessionState === true) {
                welcomeMsg.textContent = '${vo.NAME}님 반갑습니다.';
            }
            else {
                welcomeMsg.textContent = '어서오세요! 사이트를 이용하시려면 로그인이 필요합니다.';
            }
        }

        // 로그인 버튼 변경
        const setLoginBtn = function() {
            if (sessionState === true) {
                btnLogin.textContent = '로그아웃';
            }
            else {
                btnLogin.textContent = '로그인';
            }
        }

        // 회원가입 버튼 변경
        const setJoinBtn = function() {
            if (sessionState === false) {
                btnJoin.style.display = 'inline';
            }
            else {
                btnJoin.style.display = 'none';
            }
        }



        ////// 이벤트 리스너 ////////////////////////////////////////////////////////////////////////////

        btnLogin.addEventListener('click', ()=>{
            if (sessionState === true) {
                location.href = '/logout';
            }
            else {
                location.href = '/login';
            }
        });

        btnJoin.addEventListener('click', ()=>{
            location.href = '/join';
        });



        ////// 호출부 ///////////////////////////////////////////////////////////////////////////////////

        setSessionState(); // 세션 저장 여부 확인
        setWelcomeMsg(); // 로그인 여부에 따라 웰컴메세지 변경
        setLoginBtn(); // 로그인 여부에 따라 로그인 버튼 변경
        setJoinBtn(); // 로그인 여부에 따라 회원가입 버튼 변경

    })();
    </script>
</body>
</html>