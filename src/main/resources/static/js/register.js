let 이메일인증완료 = false;    // 회원가입 창 들어오자마자 인증완료 되는 건 이상하다!! -> 인증한 적이 없기 때문에 초기에는 false

async function 인증번호발송() {
    const email = document.getElementById("email").value.trim();

    if (!email) {
        alert("이메일을 입력하세요.");
        return;
    }

    const res = await fetch("/api/send-code", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ email }), // 여기 이메일로 인증번호 발송은 자바가 하도록 해~
    });

    if (res.ok) {
        document.getElementById("code-area").style.display = "block";
        showAlert("info", "인증번호가 발송되었습니다.(5분 유효)");
    } else {
        showAlert("danger", "발송에 실패했습니다.");
    }
}

async function 인증번호확인() {
    const email = document.getElementById("email").value.trim();  // TODO 5-1
    const code  = document.getElementById("code").value.trim();  // TODO 5-2
    const 결과  = document.getElementById("verify-result");

    const res = await fetch("/api/verify-code", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ email, code }),                   // TODO 5-3
    });

    if (res.ok) {
        이메일인증완료 = true;                                       // TODO 5-4: 인증 완료 값
        결과.innerHTML = '<span class="text-success fw-bold">인증 완료</span>';
        document.getElementById("code").disabled = true;
    } else {
        결과.innerHTML = '<span class="text-danger">인증번호가 올바르지 않습니다.</span>';
    }
}

async function 가입하기() {
    if (!이메일인증완료) {
        alert("이메일 인증을 먼저 완료해주세요.");
        return;
    }

    const name     = document.getElementById("name").value.trim();
    const email    = document.getElementById("email").value.trim();
    const password = document.getElementById("password").value.trim();

    if (!name || !email || !password) {
        alert("모든 항목을 입력하세요.");
        return;
    }

    const res = await fetch("/api/register", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ name, email, password }),
        // 인텔리제이서 email 이라고 하는 변수가 어디서 왔고, 어떤 타입인지에 대하여 ai로 보여주는 것
    });

    const data = await res.json();

    if (res.ok) {
        window.location.href = "/login";
    } else {
        showAlert("danger", data.message);
    }
}


function showAlert(type, msg) {
    const el = document.getElementById("alert-box");
    el.className   = "alert alert-" + type;
    el.textContent = msg;                        // message -> msg   string -> str   button-> btn
}