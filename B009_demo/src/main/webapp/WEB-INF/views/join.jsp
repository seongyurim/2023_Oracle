<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOIN</title>
<style>
    h1 {
        text-align: center;
        margin-top: 100px;
    }

    table {
        margin: 20px auto;
    }
    
    td {
        padding: 5px;
    }
    
    .inputs {
        width: 280px;
        height: 30px;
    }

    .btn {
        margin: 0 auto;
        width: 360px;
        height: 50px;
        display: block;
        margin-top: 20px;
        font-size: 20px;
    }
</style>
</head>
<body>
    <h1>JOIN</h1>
    <hr>
    <table>
        <tr>
            <td>아이디</td>
            <td><input type="text" name="memberId" id="memberId" class="inputs"></td>
        </tr>
        <tr>
            <td>비밀번호</td>
            <td><input type="text" name="memberPw" id="memberPw" class="inputs"></td>
        </tr>
        <tr>
            <td>이름</td>
            <td><input type="text" name="name" id="name" class="inputs"></td>
        </tr>
        <tr>
            <td>이메일</td>
            <td><input type="text" name="email" id="email" class="inputs"></td>
        </tr>
        <tr>
            <td>섬네일</td>
            <td><input type="file" name="thumbnail" id="thumbnail"></td>
        </tr>
    </table>
    <div><button type="button" id="join" class="btn">회원가입</button></div>
    
    <script>
    (()=>{

        const $memberId  = document.getElementById('memberId');
        const $memberPw  = document.getElementById('memberPw');
        const $name      = document.getElementById('name');
        const $email     = document.getElementById('email');
        const $thumbnail = document.getElementById('thumbnail');
        const $join      = document.getElementById('join');

        $join.addEventListener('click', ()=> {
            // console.log($memberId);
            // console.log($memberPw);
            // console.log($name);
            // console.log($email);
            // console.log($thumbnail);
            // 출력 성공

            // 서버에 전달할 데이터를 구성한다. //////////////////////////////////////////////////////////////////
            let formData = new FormData();

            formData.append('memberId', $memberId.value);
            formData.append('memberPw', $memberPw.value);
            formData.append('name', $name.value);
            formData.append('email', $email.value);

            if ($thumbnail.files[0] !== undefined) {
                formData.append('thumbnail', $thumbnail.files[0]);
            }

            // console.log(formData.get('memberId'));
            // console.log(formData.get('memberPw'));
            // console.log(formData.get('name'));
            // console.log(formData.get('email'));
            // console.log(formData.get('thumbnail'));
            // 출력 성공


            // 서버에 AJAX로 전송한다. ////////////////////////////////////////////////////////////////////////////
            let xhr = new XMLHttpRequest();
            xhr.open('POST', '/join', true);

            xhr.onreadystatechange = function() {
                // 수신을 완료했다.
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        console.log('회원가입 성공');
                        console.log('서버가 전송한 메세지: ' + xhr.responseText);
                        // xhr.responseText = 컨트롤러에서 작성한 'JOIN_SUCCESS'가 담기는 곳
                    }
                    else {
                        console.error('회원가입 실패');
                        console.error('서버가 전송한 메세지: ' + xhr.status);
                    }
                }
            }
            xhr.send(formData);
        });
        
    })();
    </script>
</body>
</html>