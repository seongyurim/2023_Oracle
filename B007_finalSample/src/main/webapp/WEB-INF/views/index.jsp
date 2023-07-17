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

    <table border="1" id="tblBBS">
        <thead>
            <th>순번</th>
            <th>제목</th>
            <th>아이디</th>
            <th>날짜</th>
        </thead>
        <tbody>            
        </tbody>
    </table>
    <p>
        <button type="button" id="btnPrev">이전</button>
        <button type="button" id="btn1" class="btns">1</button>
        <button type="button" id="btn2" class="btns">2</button>
        <button type="button" id="btn3" class="btns">3</button>
        <button type="button" id="btn4" class="btns">4</button>
        <button type="button" id="btn5" class="btns">5</button>
        <button type="button" id="btnNext">다음</button>
    </p>

    <script src="/JS/jquery-3.7.0.min.js"></script>
    
    <script>
    (()=>{

        let sessionState = false;

        // row 정보
        let rowCount = 0;        // 전체 건수

        // page 정보
        let rowsPerPage = 5;     // 페이지 당 건수(테이블에서 보여지는 최대 건수)
        let curPage = 0;         // 현재 페이지 위치

        // section 정보
        let curSection = 0;      // 현재 섹션
        let pagesPerSection = 5; // 섹션당 페이지 수(버튼 수와 동일)

        const spnWelcome = document.querySelector('#spnWelcome');
        const btnLogin = document.querySelector('#btnLogin');
        const btnPrev = document.querySelector('#btnPrev');
        const btnNext = document.querySelector('#btnNext');
        const btn1 = document.querySelector('#btn1');
        const btn2 = document.querySelector('#btn2');
        const btn3 = document.querySelector('#btn3');
        const btn4 = document.querySelector('#btn4');
        const btn5 = document.querySelector('#btn5');

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


        const setBBS = function(page) {
            // BBS 세팅을 위한 데이터를 오브젝트에 담기
            let requestData = {
                divi : 'C',
                page : page,
                rowsPerPage : rowsPerPage // 현재 전역변수에 5로 설정되어 있음
            };

            // 오브젝트를 DB로 전달하기
            $.ajax({
                url : 'bbs/list',
                type : 'post',
                data : requestData,
                success : function(data) { // 여기서 받는 데이터: rowCount, bbsList
                    
                    let bstr = '';
                    const tblBody = document.querySelector('#tblBBS > tbody')

                    // 전체 카운트를 저장한다.
                    rowCount = data.rowCount;

                    // 테이블 body를 채워준다.
                    tblBody.innerHTML = '';

                    for (let i = 0; i < data.bbsList.length; i++) {
                        bstr = '';
                        bstr += '<tr>';
                            bstr += '<td>' + data.bbsList[i].rowNum + '</td>';
                            bstr += '<td>' + data.bbsList[i].title + '</td>';
                            bstr += '<td>' + data.bbsList[i].userId + '</td>';
                            bstr += '<td>' + data.bbsList[i].regdate + '</td>';
                        bstr += '</tr>';

                    tblBody.innerHTML += bstr;
                    }
                }
            });
            console.log(requestData);
        }


        // let num = 0;
        // const setBtnSeq = function(num) {
        //     const btns = document.querySelectorAll('.btns');
        //     btns[num].addEventListener('click', ()=> {
        //         setBBS(num);
        //     });
        // }



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

        btnPrev.addEventListener('click', ()=> {
            console.log('btnPrev');

            totalSectionNum = Math.ceil((rowCount / rowsPerPage) / pagesPerSection) - 1;

            if (curSection == 0) {
                return;
            }
            else {
                const startPage = pagesPerSection * (curSection - 1);
                setBBS(startPage);
                curSection--;

                btn1.textContent = startPage + 1;
                btn2.textContent = startPage + 2;
                btn3.textContent = startPage + 3;
                btn4.textContent = startPage + 4;
                btn5.textContent = startPage + 5;
                curPage = startPage;                
}
        });

        btnNext.addEventListener('click', ()=> {
            console.log('btnNext');

            totalSectionNum = Math.ceil((rowCount / rowsPerPage) / pagesPerSection) - 1;

            if (curSection == totalSectionNum) {
                return;
            }
            else {
                const startPage = pagesPerSection * (curSection + 1);
                setBBS(startPage);
                curSection++;
    
                btn1.textContent = startPage + 1;
                btn2.textContent = startPage + 2;
                btn3.textContent = startPage + 3;
                btn4.textContent = startPage + 4;
                btn5.textContent = startPage + 5;
                curPage = startPage;                
            }



            // // 전체건수 - 현재섹션의건수 > 0 이라면 넘어갈 수 있
            // if (전체건수 - 현재섹션의건수 > 0) {
            //     // 다음으로 넘어갈 수 있다.
            //     curSection++;
            // }





        });

        btn1.addEventListener('click', ()=> {
            // setBBS(0);
            setBBS(curPage);
        });

        btn2.addEventListener('click', ()=> {
            // setBBS(1);
            setBBS(curPage + 1);
        });

        btn3.addEventListener('click', ()=> {
            // setBBS(2);
            setBBS(curPage + 2);
        });

        btn4.addEventListener('click', ()=> {
            // setBBS(3);
            setBBS(curPage + 3);
        });

        btn5.addEventListener('click', ()=> {
            // setBBS(4);
            setBBS(curPage + 4);
        });



        ////// 호출부 //////////////////////////////////////////////////////////////////
        setSessionState(); // 세션이 있는지 없는지 상태값을 저장한다.
        setWelcomeMsg();   // 로그인한 사용자에게 웰컴 메세지를 설정한다.
        setLoginButton();  // 로그인 여부에 따라 버튼을 로그인/로그오프로 설정한다.

        curPage = 0;
        setBBS(0);
        // setBtnSeq(num);

    })();
    </script>
</body>
</html>