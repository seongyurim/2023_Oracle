<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main BBS</title>
</head>
<body>
    <h1>Main BBS</h1>
    <hr>
    <div>
        <span>홍길동님 반갑습니다.</span>
        <input type="button" id="login" value="로그인">
    </div>
    <br>

    <table border="1" id="bbs">
        <thead>
            <tr>
                <th>글번호</th>
                <th>글제목</th>
                <th>작성자</th>
                <th>작성일</th>
            </tr>
        </thead>

        <tbody id="tbody">

        </tbody>
    </table>
    <br><br>
    <form id="bbsform" name="bbsform">
        <input type="hidden" id="divi" name="divi">
        <input type="hidden" id="pageNum" name="pageNum">
    </form>

    <script src="/JS/jquery-3.7.0.min.js"></script>

    <script>

        (() => {
            
            // 로그인 버튼을 누르면 alert("login")
            // 1) Javascript로 구현
            //     const $btn = document.querySelector('#login');    
            //     $btn.addEventListener('click', () => {    
            //         alert('Login by Javascript');
            //     });

            // 2) JQuery로 구현
            $('#login').click(() => {
                alert('Login by JQuery');
            });
            // #login = CSS Selector 사용(매우 간편)
            // 하지만 현재는 이렇게 사용하지 않으므로 알고만 있자
            // 라이브러리보다는 정통 방식인 JS 코드 사용을 권장

            ////////////////////////////////////////////////////////////////////////////////////////

            const getBbs = function(page) {

                // 1. divi에는 A(All)를 넣고 pageNum에는 1을 넣는다.        
                const $inputDivi = document.getElementById('divi'); 
                const $inputPageNum = document.getElementById('pageNum');
                $inputDivi.setAttribute('value', 'A');
                $inputPageNum.setAttribute('value', page.toString());

                ///2. form 데이터를 JSON 형태로 만든다.
                // formData: <form> 요소의 데이터를 쉽게 수집하고 전송하기 위한 객체
                let formData = new FormData(bbsform);

                // 3. 만들어진 'FORM JSON 데이터'를 AJAX 통신방식으로 서버에게 전달한다.
                // AJAX 통신을 위해 필요한 것
                // 1) 보낼 데이터: fromData
                // 2) 전송할 URL: bbs/list (라고 정하자)
                // 3) 전송할 Method Type: post
                // 4) 결과를 받는 함수
                $.ajax({ // ajax는 이렇게 객체를 받는다.
                    data : formData,
                    type : 'POST',
                    url : '/bbs/list',                
                    // 아래부터는 ajax에 기본적으로 들어가는 구성
                    cache : false,
                    processData : false,
                    contentType : false,
                    success : function(data) {                        
                        fillBbs(data);
                    }
                });

            }

            getBbs(1);

            const fillBbs = function(data) {

                // tbody DOM구조로 가져오기
                const $tbody = document.getElementById('tbody');
                // $tbody.empty();

                for (let i = 0; i < data.bbsList.length; i++) {
                    const bbs = data.bbsList[i];

                    // 행(row) 생성
                    const $row = document.createElement('tr');

                    // 각 데이터에 해당하는 셀(td)을 생성하여 내용 설정
                    const $seq = document.createElement('td');
                    const $title = document.createElement('td');
                    const $titleLink = document.createElement('a');
                    const $userId = document.createElement('td');
                    const $regdate = document.createElement('td');

                    $seq.textContent = bbs.seq;
                    $userId.textContent = bbs.userId;
                    $regdate.textContent = bbs.regdate;

                    // 타이틀에 링크 적용하기
                    $titleLink.textContent = bbs.title;
                    $title.appendChild($titleLink);
                    $titleLink.href = '#'; // 링크 대상 지정
                    $titleLink.addEventListener('click', function() {
                        window.location.href = 'http://www.naver.com';
                    });

                    // row를 tbody의 자식으로 추가
                    // 셀(td)을 row에 추가
                    $row.appendChild($seq);
                    $row.appendChild($title);
                    $row.appendChild($userId);
                    $row.appendChild($regdate);

                    // row를 tbody에 추가
                    $tbody.appendChild($row);
                }

            }

            // 4. 서버에서 전달된 게시판 데이터를 수신한다.
            // 5. 수신된 데이터를 가지고 tbody를 만든다.

        })();

    </script>

</body>
</html>