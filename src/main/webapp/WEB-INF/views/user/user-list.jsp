<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>유저 목록</title>
</head>
<body>
<h1>유저 목록</h1>
<ul id="userList"></ul>

<script>
    function 유저목록그리기(users) {
        const list = document.getElementById("userList"); // <ul id="userList"></ul>

        // 즉시 바로 백엔드에서 넘어온 데이터를 users 로 받아서 순회하여 화면에 그리기
        users.forEach(function(user) {
            const li = document.createElement("li"); // li 태그 생성
            li.textContent = user.name + " / " + user.email; // li 태그안에 요소 유저이름 이메일
            list.appendChild(li); // ul 에다가 li를 추가한다
        });
    }



    // 1. async await 교체
    // 2. const 교체
    function 유저목록불러오기() {
        fetch("/api/users")
            .then(function(response) {
                return response.json();
            })
            .then(function(users) {
                유저목록그리기(users);
            })
            .catch(function(error) {
                console.log("에러 발생", error);
            });
    }


    유저목록불러오기();
</script>
</body>
</html>