<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>By Eomong</title>
</head>

<body>
    <!-- 수정을 해야한다는 것은 서버로 보내야한다는 의미이므로 form 태그가 필요하다. -->
    <form action="" method="post"> 
        <input class="title" type="text" value="${vo.title}">
        <hr>
        <textarea name="content" cols="30" rows="10">${vo.content}</textarea><br>
    </form>
    <button id="bbsList">목록으로</button>
    <button id="btnModify">수정하기</button>

    <script>
        (() =>{

            // '목록으로' 버튼의 클릭이벤트
            const $btnBbsList = document.querySelector('#bbsList');
            $btnBbsList.addEventListener('click', () => {                
                history.back(); // location.href = '/index';
            });

            // '수정하기' 버튼의 클릭이벤트
            const $btnModify = document.querySelector('#btnModify');
            $btnModify.addEventListener('click', () => {
                if (confirm('수정하시겠습니까?')) { // 수정하겠습니까? 저장하겠습니까?를 처리하는 대표적인 구문
                    // 수정해달라는 요청
                }
            });
        })();
    </script>
</body>
</html>