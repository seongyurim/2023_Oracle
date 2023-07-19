<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
    <h1>Join</h1>
    <hr>

    <table>
        <tr> </label>
            <td><label for="txtUserId">아이디</label></td>
            <td><input type="text" id="txtUserId" name="userId"> <button type="button" id="btnCheckId">중복확인</button></td>
        </tr>
        <tr>
            <td><label for="txtUserPw">비밀번호</label></td>            
            <td><input type="password" id="txtUserPw" name="userPw"> <span id="isPwCorrect"></span></td>            
        </tr>
        <tr>
            <td><label for="txtCheckPw">비밀번호 확인</label></td>
            <td><input type="password" id="txtCheckPw"> <span id="isPwSame"></span></td>
        </tr>

        <tr>
            <td><label for="txtName">이름</label></td>
            <td><input type="text" id="txtName" name="name"></td>
        </tr>
        <tr>
            <td><label for="txtEmail">이메일</label></td>
            <td><input type="eamil" id="txtEmail" name="email"></td>
        </tr>

    </table>
    <br>
    <button type="button" id="btnJoin" style="width: 290px;">회원가입</button>

<script src="/JS/jquery-3.7.0.min.js"></script>

<script>
(()=>{   

    const txtUserId   = document.querySelector('#txtUserId');   // 아이디 입력
    const btnCheckId  = document.querySelector('#btnCheckId');  // 아이디 중복확인 버튼
    const txtUserPw   = document.querySelector('#txtUserPw');   // 비밀번호 입력
    const txtCheckPw  = document.querySelector('#txtCheckPw');  // 비밀번호 확인
    const isPwCorrect = document.querySelector('#isPwCorrect'); // 비밀번호 글자수 확인 메세지
    const isPwSame    = document.querySelector('#isPwSame');    // 비밀번호 일치여부 확인 메세지
    const txtName     = document.querySelector('#txtName');     // 이름 입력
    const txtEmail    = document.querySelector('#txtEmail');    // 이메일 입력
    const btnJoin     = document.querySelector('#btnJoin');     // 회원가입 버튼

    let idChecking = false; // 중복확인을 통과하면 true로 변경된다.
    let checkedId = ''; // 중복확인이 된 아이디가 저장된다.



    ////// 함수부 //////////////////////////////////////////////////////////////////

    const checkJoinData = function() {

        // 1.아이디 중복여부 확인
        if ((idChecking == false) || (checkedId != txtUserId.value)) { 
            alert('아이디 중복확인이 필요해요.');
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

        //
        if (txtUserPw.value != txtCheckPw.value) {
            alert('비밀번호 입력 값이 서로 다릅니다.');
            txtCheckPw.value = '';
            txtCheckPw.focus();
            return false;
        }

        //
        if (txtName.value.length === 0) {
            alert('이름을 입력해주세요.');
            txtName.focus();
            return false;
        }

        //
        if (txtEamil.value.length === 0) {
            alert('이메일을 입력해주세요.');
            txtEamil.focus();
            return false;
        }

        return true;
    }




    // 비밀번호의 글자수와 일치여부를 확인한다.
    const checkPw = function() {
        // 비밀번호 글자수 확인
        if (txtUserPw.value != '') {
            if ((txtUserPw.value.length < 6) || (txtUserId.value.length > 16)) {
                isPwCorrect.innerHTML = '비밀번호는 6글자 이상, 16글자 이하만 가능합니다.';
                isPwCorrect.style.color = 'red';
            }
            else {
                isPwCorrect.innerHTML = '알맞은 비밀번호입니다.';
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

    // 이메일을 정규표현식으로 검증한다.
    const checkEmail = function() {
        if (txtEmail.value !== '') {
           // let regex = new RegExp('[a-z0-9]+@[a-z]+\.edu\.[a-z]{2,3}');
          //  let testResult = regex.test(txtEmail.value);
            console.log(testResult);
        }
    }



    ////// 이벤트 핸들러 ///////////////////////////////////////////////////////////

    // 아이디 중복확인
    btnCheckId.addEventListener('click', ()=>{

        // 1. 아이디를 가지고 온다.
        let id = txtUserId.value;

        // 2. 아이디를 서버에 전송한다.
        let requestData = {
            userId : txtUserId.value
        }

        $.ajax({
            url : '/checkId',
            type : 'POST',
            data : requestData,
            success : function(data) {

                // 3. 결과를 받는다.
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
        if (false === checkJoinData) {
            return;
        }

        // 내 코드
        // // 1. 중복아이디 체크여부 확인
        // if (idChecking === false) {
        //     alert('아이디 중복확인을 해주세요.');
        //     return;
        // }

        // // 2. 비밀번호 일치여부 확인
        // checkPw();
        
        // // 3. 아이디~이메일까지 공백이 있는지 확인
        // if ((txtUserId.value == '') ||
        //     (txtCheckPw.value == '') ||
        //     (txtName.value == '') ||
        //     (txtEmail.value == '')) {
        //         alert('비어있는 양식을 마저 입력해주세요.');
        //         return;
        // }
        // // 4. 중복확인을 했던 아이디와 회원가입 버튼 클릭 시의 아이디가 동일한지 다시 확인
        // if (txtUserId.value != checkedId) {
        //     alert('아이디 중복확인이 다시 필요합니다.');
        //     txtUserId.focus();
        //     return;
        // }

        // 가입을 위한 요청 데이터를 만든다.
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

    checkEmail();

        
})(); 
</script>
        
</body>