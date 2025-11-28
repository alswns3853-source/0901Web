function changeBg(color){
    let result = document.getElementById("result");
    result.style.backgroundColor = color;
}

function input_check(){
    let input1 = document.getElementById("input1");
    let input2 = document.getElementById("input2");
    let result = document.getElementById("result2");

    // 만약 input1 의 값과 input2 의 값이 같으면 result 칸에 "값이 같습니다."를 입력
    if(input1.value === input2.value){
        result.innerHTML = "값이 같습니다."
    }
    else{
        result.innerHTML = "값이 다릅니다."
    }
}