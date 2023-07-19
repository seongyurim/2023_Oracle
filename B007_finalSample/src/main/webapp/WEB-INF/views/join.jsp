<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join</title>
<style>
    table input {
        width: 280px;
        height: 25px;
        margin: 8px;
    }
</style>
</head>
<body>
    <h1>Join</h1>
    <hr>

    <table>
        <tr> </label>
            <td><label for="txtUserId">아이디</label></td>
            <td>
                <input type="text" id="txtUserId" name="userId" placeholder="아이디 입력 (영소문자, 숫자 포함 6~12자)">
                <button type="button" id="btnCheckId">중복확인</button>
            </td>
        </tr>
        <tr>
            <td><label for="txtUserPw">비밀번호</label></td>            
            <td>
                <input type="password" id="txtUserPw" name="userPw" placeholder="비밀번호 입력 (6~20자)"> 
                <span id="isPwCorrect"></span>
            </td>            
        </tr>
        <tr>
            <td><label for="txtCheckPw">비밀번호 확인</label></td>
            <td>
                <input type="password" id="txtCheckPw" placeholder="비밀번호 재입력"> 
                <span id="isPwSame"></span>
            </td>
        </tr>

        <tr>
            <td><label for="txtName">이름</label></td>
            <td><input type="text" id="txtName" name="name" placeholder="이름 입력"></td>
        </tr>
        <tr>
            <td><label for="txtEmail">이메일</label></td>
            <td><input type="eamil" id="txtEmail" name="email" placeholder="이메일 입력 (ex. id@domain.com)"></td>
        </tr>

    </table>
    <br>
    <button type="button" id="btnJoin" style="width: 407px;">회원가입</button>

<script src="/JS/jquery-3.7.0.min.js"></script>

<script>
(()=>{   

    const txtUserId   = document.querySelector('#txtUserId');   // 아이디 입력
    const txtUserPw   = document.querySelector('#txtUserPw');   // 비밀번호 입력
    const txtName     = document.querySelector('#txtName');     // 이름 입력
    const txtEmail    = document.querySelector('#txtEmail');    // 이메일 입력
    const btnJoin     = document.querySelector('#btnJoin');     // 회원가입 버튼

    const txtCheckPw  = document.querySelector('#txtCheckPw');  // 비밀번호 확인
    const btnCheckId  = document.querySelector('#btnCheckId');  // 아이디 중복확인 버튼
    const isPwCorrect = document.querySelector('#isPwCorrect'); // 비밀번호 글자수 확인 메세지
    const isPwSame    = document.querySelector('#isPwSame');    // 비밀번호 일치여부 확인 메세지

    let idChecking = false; // 중복확인을 통과하면 true로 변경된다.
    let checkedId = ''; // 중복확인이 통과된 아이디가 저장된다.



    ////// 함수부 //////////////////////////////////////////////////////////////////

    const checkJoinData = function() {

        // 1.아이디 중복여부 확인
        if ((idChecking == false) || (checkedId != txtUserId.value)) { 
            alert('아이디 중복확인이 필요합니다.');
            txtUserId.value = '';
            txtUserId.focus();
            return false;
        }

        // 2. 비밀번호 검증(정규표현식을 사용하는 것이 더 좋음)
        if (txtUserPw.value.length === 0) {
            alert('비밀번호를 입력해주세요.');
            txtUserPw.value = '';
            txtCheckPw.value = '';
            txtUserPw.focus();
            return false;
        }

        // 3. 비밀번호와 비밀번호 확인 값이 서로 같은지 확인
        if (txtUserPw.value != txtCheckPw.value) {
            alert('입력된 비밀번호가 서로 다릅니다.');
            txtCheckPw.value = '';
            txtCheckPw.focus();
            return false;
        }

        // 4. 이름을 입력했는지 확인
        if (txtName.value.length === 0) {
            alert('이름을 입력해주세요.');
            txtName.focus();
            return false;
        }

        // 5. 이메일을 입력했는지 확인
        if (txtEmail.value.length === 0) {
            alert('이메일을 입력해주세요.');
            txtEmail.focus();
            return false;
        }

        // 6. 이메일의 정규표현식 검증
        let regex = new RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/);
        let testResult = regex.test(txtEmail.value);
        if (testResult === false) {
            // console.log("REGEX FOR EMAIL = " + testResult);
            alert('올바른 이메일 형태를 입력해주세요.');
            txtEmail.focus();
            return false;
        }

        // 7. 위의 검사를 모두 통과했으면 true
        return true;
    }

    // 비밀번호의 글자수와 일치여부 확인
    const checkPw = function() {
        // 비밀번호 글자수 확인
        if (txtUserPw.value != '') {
            if ((txtUserPw.value.length < 6) || (txtUserId.value.length > 16)) {
                isPwCorrect.innerHTML = '비밀번호는 6~16자만 가능합니다.';
                isPwCorrect.style.color = 'red';
            }
            else {
                isPwCorrect.innerHTML = '사용 가능한 비밀번호입니다.';
                isPwCorrect.style.color = 'green';
        
                // 비밀번호 일치여부 확인
                if ((txtUserPw.value != '') && (txtCheckPw.value != '')) {
                    isPwCorrect.innerHTML = '';
                    if (txtUserPw.value == txtCheckPw.value) {        
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



    ////// 이벤트 핸들러 ///////////////////////////////////////////////////////////

    // 아이디 검증: 빈 값, 범위 외의 값, 중복 값
    btnCheckId.addEventListener('click', ()=>{

        // 1. 값이 비어 있는 경우
        if (txtUserId.value.length === 0) {
            alert('아이디를 입력해주세요.');
            idChecking = false;
            txtUserId.focus();
            return;
        }

        // 2. 값이 범위를 넘는 경우
        if ((txtUserId.value.length < 6) || (txtUserId.value.length > 12)) {
            alert('아이디 길이는 6~12자만 가능합니다.');
            idChecking = false;
            txtUserId.focus();
            return;
        }

        // 3. 허용되지 않은 값이 있는 경우: 특수문자, 영대문자, 공백
        let regex = new RegExp(/^[a-z0-9]+$/);
        let testResult = regex.test(txtUserId.value);
        if (testResult == false) {
            alert('아이디는 영소문자와 숫자만 사용할 수 있습니다.');
            idChecking = false;
            txtUserId.focus();
            return;
        }

        // 4. 아이디를 서버에 전송한다.
        let requestData = {
            userId : txtUserId.value
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
                    checkedId = txtUserId.value;
                    idChecking = true;
                    txtUserPw.focus();
                }
                else {
                    alert('이미 존재하는 아이디입니다.');
                    idChecking = false;
                    txtUserId.value = '';
                    txtUserId.focus();
                }   
            }
        });        
    });

    // 회원가입 버튼
    btnJoin.addEventListener('click', ()=>{

        // 데이터를 검사한다.
        if (false === checkJoinData()) {
            // alert('error');
            return;
        }

        // 가입을 위한 요청 데이터
        let requestData = {
            userId : txtUserId.value, 
            userPw : txtUserPw.value,
            name : txtName.value,
            email : txtEmail.value
        };
        console.log(requestData); // 꼭 확인해보자.

        $.ajax({
            url : '/join',
            type : 'POST',
            data : requestData,
            success : function(data) {
                if (data == "OK") {
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

    txtUserPw.addEventListener('input', checkPw);
    txtCheckPw.addEventListener('input', checkPw);



    ////// 출력부 //////////////////////////////////////////////////////////////////

    // checkEmail();
    checkId();
        
})(); 
</script>
        
</body>