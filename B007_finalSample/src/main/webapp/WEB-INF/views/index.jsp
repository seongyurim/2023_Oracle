<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main BBS</title>
</head>
<body>
    <h1>Main BBS</h1>
    <!-- <h1>${vo.userId}</h1>
    <h1>${vo.userPw}</h1>
    <h1>${vo.name}</h1>
    <h1>${vo.email}</h1> -->
    <hr>
    <div>
        <p><span id="spnWelcome"></span></p>
        <p><button type="button" id="btnLogin">로그인</button></p>        
    </div>
    
    <script>
    (()=>{
        
        let sessionState = false;
        const spnWelcome = document.querySelector('#spnWelcome');
        const btnLogin = document.querySelector('#btnLogin');

        ////// 함수부 //////////////////////////////////////////////////////////////////
        // 현재 세션이 있는지 없는지 설정해준다.
        const setSessionState = function() {
            if ('${vo.userId}' == '') {
                sessionState = false;
            }
            else {
                sessionState = true;
            }
        }

        // 메인 화면의 웰컴 메세지를 설정한다.
        const setWelcomeMsg = function() {
            if (sessionState === true) {
                spnWelcome.textContent = '${vo.name}님 반갑습니다!';
            }
            else {
                spnWelcome.textContent = '로그인 해주세요.';
            }
        }

        // 로그인 여부에 따라 버튼을 다르게 설정한다.
        const setLoginButton = function() {
            if (sessionState === true) {
                btnLogin.textContent = '로그아웃';
            }
            else {
                btnLogin.textContent = '로그인';
            }
        }



        ////// 이벤트 핸들러 ///////////////////////////////////////////////////////////
        // 로그인 상태
        btnLogin.addEventListener('click', ()=>{
            if (sessionState === true) { // 로그인한 상태라면
                location.href = '/logout';
            }
            else { // 로그인한 상태가 아니라면
                location.href = '/login';
            }
        });



        ////// 호출부 //////////////////////////////////////////////////////////////////
        setSessionState(); // 세션이 있는지 없는지 상태값을 저장한다.
        setWelcomeMsg();   // 로그인한 사용자에게 웰컴 메세지를 설정한다.
        setLoginButton();  // 로그인 여부에 따라 버튼을 로그인/로그오프로 설정한다.

    })();
    </script>
</body>
</html>