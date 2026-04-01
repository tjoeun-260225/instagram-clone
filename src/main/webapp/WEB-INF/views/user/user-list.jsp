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
/*
    function 유저목록그리기(users) {
        const list = document.getElementById("userList"); // <ul id="userList"></ul>

        // 즉시 바로 백엔드에서 넘어온 데이터를 users 로 받아서 순회하여 화면에 그리기
        users.forEach(function(user) {
            const li = document.createElement("li"); // li 태그 생성
            li.textContent = user.name + " / " + user.email; // li 태그안에 요소 유저이름 이메일
            list.appendChild(li); // ul 에다가 li를 추가한다
        });
    }

 */





    // 1. async await 교체
    // 2. const 교체
    /*  ***************** 가장 기본인 기능 코드   *****************
    기능생성    만들기능이름(){
    우리는 현재 http://localhost:8080 으로 이루어진 코드이기 때문에
    /api/users 만 작성해도 http://localhost:8080/api/users 에서 가져오는 데이터임을 사용하는 것
    fetch("/api/users") = 나 어디서 데이터 가져오겠다.

    }
    function 유저목록불러오기() {
        fetch("/api/users")
            .then(function(response) {
                return response.json();  // 가져온 데이터를 json 형태로 반환하여 사용할 것이다.
            })
            public void 기능이름없음(User user) 으로
            function(users)는 현재 {} 안에서만  쓰여질 명칭이고 자바와 다르게 자료형을 작성하지 않는 것!
            .then(function(users) {     // 해당 유저를 users 라는 이름으로 유저목록그리기 전달
                유저목록그리기(users);
            })
            .catch(function(error) {        // 백엔드에서 소통하는데 문제가 발생하여 결과를 받지 못했을 경우
                console.log("에러 발생", error);
            });
    }

     */
    // async
    // 여기에는 백엔드에서 데이터를 가져오기 때문에 한줄씩 바로바로 실행하는게 아니라
    // 백엔드에서 가져온 결과를 기다려야하는 코드가 있어
    /*   ***************** 기본 코드에서 fetch 만 async 로 업데이트된 기능   *****************
    async function 유저목록불러오기() {
        try {
            const response = await fetch("/api/users"); // 백엔드에서 결과를 갖고올 때 까지 56줄 실행하지 말아줘
            const users    = await response.json();     // 백엔드에서 가져온 결과를 json 변환해서 user라는 위치에 넣어놓을게
            유저목록그리기(users);                      // users 라는 주소에 존재하는 데이터를 유저목록그리기라는 기능으로 전달해서 사용할게
        } catch (error) {                               // 백엔드랑 소통하는데 문제가 발생했을 경우 소비자에게 어떤 문제인지 얘기해줄거야
            console.log("에러 발생", error);
        }
    }
     */
    const 유저목록불러오기 = async () => {
        try {
            const response = await fetch("/api/users");
            const users    = await response.json();
            유저목록그리기(users);
        } catch (error) {
            console.log("에러 발생", error);
        }
    };

    const 유저목록그리기 = (users) => {
        const list = document.getElementById("userList");

        users.forEach(user => {
            const li = document.createElement("li");
            li.textContent = user.name + " / " + user.email;
            list.appendChild(li);
        });
    };

    유저목록불러오기();
</script>
</body>
</html>