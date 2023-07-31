<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<title>BS TEST</title>


</head>
<body>

    <div class="mb-3">
        <label for="exampleFormControlInput1" class="form-label">Email address</label>
        <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
    </div>
    <button type="button" id="btnPopup">이메일 메시지박스 출력</button>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
    (()=>{

        const btnPopup = document.querySelector('#btnPopup');
        const exampleFormControlInput1 = document.querySelector('#exampleFormControlInput1');


        btnPopup.addEventListener('click', ()=>{
            alert(exampleFormControlInput1.value);
        });
        
    })();
    </script>
</body>
</html>