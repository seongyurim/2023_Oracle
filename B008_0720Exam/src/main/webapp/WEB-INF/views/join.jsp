<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>0720 - JOIN</title>
<style>
    .inputBox {
        width: 280px;
        height: 28px;
        margin: 8px;
    }

    #btnJoin {
        width: 300px;
        height: 40px;
    }

    #btnIndex {
        width: 100px;
        height: 40px;
    }
</style>
</head>
<body>
    <h1>JOIN</h1>
    <hr>

    <table>
        <tr>
            <td><label for="userId">아이디</label></td>
            <td>
                <input type="text" name="MEMBERID" id="memberId" class="inputBox" placeholder="아이디 입력(6~12자)">
                <button type="button" id="btnIdCheck">중복확인</button>
            </td>
        </tr>
        <tr>
            <td><label for="userPw">비밀번호</label></td>
            <td>
                <input type="password" name="MEMBERPW" id="memberPw" class="inputBox" placeholder="비밀번호 입력(6~20자)">
                <span id="isPwCorrect"></span>
            </td>
        </tr>
        <tr>
            <td><label for="userPwRe">비밀번호 확인</label></td>
            <td>
                <input type="password" id="memberPwRe" class="inputBox" placeholder="비밀번호 재입력">
                <span id="isPwSame"></span>
            </td>
        </tr>
        <tr>
            <td><label for="name">이름</label></td>
            <td><input type="text" name="NAME" id="name" class="inputBox" placeholder="이름 입력"></td>
        </tr>
        <tr>
            <td><label for="name">이메일</label></td>
            <td><input type="text" name="EMAIL" id="email" class="inputBox" placeholder="이메일 입력"></td>
        </tr>
        <tr>
            <td>등급</td>
            <td>
                <input type="radio" name="GRADE" id="gradeN" value="N" checked> <label for="gradeN">일반회원</label>
                <input type="radio" name="GRADE" id="gradeA" value="A"> <label for="gradeA">관리자</label>
            </td>
        </tr>
    </table>

    <p>
        <button type="button" id="btnJoin">회원가입</button>
        <button type="button" id="btnIndex">메인으로</button>
    </p>

    <script src="/JS/jquery-3.7.0.min.js"></script>

    <script>
    (()=>{

        // 회원정보
        const memberId   = document.querySelector('#memberId');
        const memberPw   = document.querySelector('#memberPw');
        const memberPwRe = document.querySelector('#memberPwRe');
        const name       = document.querySelector('#name');
        const email      = document.querySelector('#email');
        const grade      = document.querySelector('input[name=GRADE]:checked').value;

        // 버튼 등
        const btnJoin    = document.querySelector('#btnJoin');
        const btnIndex   = document.querySelector('#btnIndex');
        const btnIdCheck = document.querySelector('#btnIdCheck');
        const isPwCorrect = document.querySelector('#isPwCorrect');
        const isPwSame = document.querySelector('#isPwSame');

        // 기타변수
        let idCheckState = false // 아이디 검증이 완료되면 true로 변경
        let finalId = '';        // 검증이 완료된 아이디 저장

        const joinVerification = function() {
            // 1.아이디 중복여부 확인
            if ((idCheckState == false) || (finalId != memberId.value)) { 
                alert('아이디 중복확인이 필요합니다.');
                memberId.value = '';
                memberId.focus();
                return false;
            }

            // 2. 비밀번호 검증(정규표현식을 사용하는 것이 더 좋음)
            if (memberPw.value.length === 0) {
                alert('비밀번호를 입력해주세요.');
                memberPw.value = '';
                memberPwRe.value = '';
                memberPw.focus();
                return false;
            }

            // 3. 비밀번호와 비밀번호 확인 값이 서로 같은지 확인
            if (memberPw.value != memberPwRe.value) {
                alert('입력된 비밀번호가 서로 다릅니다.');
                memberPwRe.value = '';
                memberPwRe.focus();
                return false;
            }

            // 4. 이름을 입력했는지 확인
            if (name.value.length === 0) {
                alert('이름을 입력해주세요.');
                name.focus();
                return false;
            }

            // 5. 이메일을 입력했는지 확인
            if (email.value.length === 0) {
                alert('이메일을 입력해주세요.');
                email.focus();
                return false;
            }

            // 6. 이메일의 정규표현식 검증
            let regex = new RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/);
            let testResult = regex.test(email.value);
            if (testResult === false) {
                // console.log("REGEX FOR EMAIL = " + testResult);
                alert('올바른 이메일 형태를 입력해주세요.');
                email.focus();
                return false;
            }

            // 7. 위의 검사를 모두 통과했으면 true
            return true;
        }

        // 비밀번호의 글자수와 일치여부 확인
        const checkPw = function() {
            // 비밀번호 글자수 확인
            if (memberPw.value != '') {
                if ((memberPw.value.length < 6) || (memberPw.value.length > 16)) {
                    isPwCorrect.innerHTML = '비밀번호는 6~16자만 가능합니다.';
                    isPwCorrect.style.color = 'red';
                }
                else {
                    isPwCorrect.innerHTML = '사용 가능한 비밀번호입니다.';
                    isPwCorrect.style.color = 'green';
            
                    // 비밀번호 일치여부 확인
                    if ((memberPw.value != '') && (memberPwRe.value != '')) {
                        isPwCorrect.innerHTML = '';
                        if (memberPw.value == memberPwRe.value) {        
                            isPwSame.innerHTML = '비밀번호가 일치합니다.';
                            isPwSame.style.color = 'green';
                        }
                        else {
                            isPwSame.innerHTML = '비밀번호가 일치하지 않습니다.';
                            isPwSame.style.color = 'red';
                        }
                    }
                }
            }
            else {
                isPwCorrect.innerHTML = '';
            }
        }

        ////// 이벤트 리스너 ////////////////////////////////////////////////////////////////////////////

        // 아이디 중복확인 버튼
        btnIdCheck.addEventListener('click', ()=>{

            // 1. 값이 비어 있는 경우
            if (memberId.value.length === 0) {
                alert('아이디를 입력해주세요.');
                idCheckState = false;
                memberId.focus();
                return;
            }

            // 2. 값이 범위를 넘는 경우
            if ((memberId.value.length < 6) || (memberId.value.length > 12)) {
                alert('아이디 길이는 6~12자만 가능합니다.');
                idCheckState = false;
                memberId.focus();
                return;
            }

            // 3. 허용되지 않은 값이 있는 경우: 특수문자, 영대문자, 공백
            let regex = new RegExp(/^[a-z0-9]+$/);
            let testResult = regex.test(memberId.value);
            if (testResult == false) {
                alert('아이디는 영소문자와 숫자만 사용할 수 있습니다.');
                idCheckState = false;
                memberId.focus();
                return;
            }

            // 4. 아이디를 서버에 전송한다.
            let requestData = {
                MEMBERID : memberId.value
            }
            console.log(requestData);

            $.ajax({
                url : '/checkId',
                type : 'POST',
                data : requestData,
                success : function(data) {
                    // 5. 결과를 받는다.
                    if (data === "OK") {
                        alert('사용 가능한 아이디입니다.');
                        finalId = memberId.value;
                        idCheckState = true;
                        console.log(idCheckState);
                        console.log(finalId);
                        memberPw.focus();
                    }
                    else {
                        alert('이미 존재하는 아이디입니다.');
                        idCheckState = false;
                        memberId.value = '';
                        memberId.focus();
                    }   
                }
            });   
        });

        // 회원가입 버튼
        btnJoin.addEventListener('click', ()=>{

            // 데이터를 검사한다.
            if (false === joinVerification()) {
                return;
            }
            
            const requestData = {
                MEMBERID : memberId.value,
                MEMBERPW : memberPw.value,
                NAME : name.value,
                EMAIL : email.value,
                GRADE : grade
            };
            console.log(requestData);
    
            $.ajax({
                url : '/join',
                type : 'POST',
                data : requestData,
                success : function(data) {
                    if (data === "OK") {
                        alert('정상적으로 가입되었어요!');
                        location.href = "/login";
                    }
                    else {
                        alert('회원가입에 실패했어요.');
                        return;
                    }    
                }
            });

        });

        // 메인으로 돌아가는 버튼
        btnIndex.addEventListener('click', ()=>{
            location.href = '/index';
        });

        // 비밀번호 유효성을 클라이언트단에서 확인하게 만드는 이벤트
        memberPw.addEventListener('input', checkPw);
        memberPwRe.addEventListener('input', checkPw);

    })();
    </script>
</body>
</html>