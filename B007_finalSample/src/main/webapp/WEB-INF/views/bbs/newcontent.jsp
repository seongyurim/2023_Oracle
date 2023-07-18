<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WRITE</title>
</head>
<body>
    <h1>WRITE</h1>

    <p>
        <input type="text" id="txtTitle">
        <select name="divi" id="divi">
            <option value="C">일반(Common)</option>
            <option value="R">필독(Required)</option>
            <option value="N">공지(Notice)</option>
        </select>
    </p>
    <p><textarea id="txtContent" cols="40" rows="10"></textarea></p>    
    <button type="button" id="btnList">목록으로</button>
    <button type="button" id="btnInsert">등록하기</button>

    <!-- <script src="/JS/jquery-3.7.0.min.js"></script> -->

    <script>
    (()=>{

        const txtTitle   = document.querySelector('#txtTitle');
        const txtContent = document.querySelector('#txtContent');
        const btnInsert  = document.querySelector('#btnInsert');
        const btnList    = document.querySelector('#btnList');
        const divi       = document.querySelector('#divi');

        btnInsert.addEventListener('click', ()=>{

            // DB로 전송할 데이터
            let requestData = {
                userId : '${vo.userId}',
                seq : '${vo.seq}',
                title : txtTitle.value,
                content : txtContent.value,
                divi : divi.value
            };
            console.log(requestData);

        });


        
    })();
    </script>
</body>
</html>