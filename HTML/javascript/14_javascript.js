let alertBtn= document.getElementById("alertBtn");
alertBtn.onclick = function(){
    alert("알림창을 클릭하셨습니다.");
}

let confirmBtn = document.getElementById("confirmBtn");
confirmBtn.onclick = function(){
    confirm("확인창을 클릭하셨습니다.");
}
let promptBtn = document.getElementById("promptBtn");
promptBtn.onclick = function(){
    prompt("프롬프트창을 클릭하셨습니다.","기본값");

}

// let name = prompt("이름을 입력하세요");
// document.write("<br><b>"+name+"</b>님, 환영합니다.");

//console.log() - 개발자도구의 콘솔이라는 탭에서 확인 가능하다.
//         개발자들이 입력값 테스트할 때 많이 사용한다.
console.log("console.lag 로 입력했습니다.");