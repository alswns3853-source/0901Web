// 함수란 ? 일련의 동작(실행문)을 모아서 적은 것.
// 함수를 정의하고 호출하여 정의한 함수를 실행시킨다.
// 함수 정의 > function 함수명() { 실행문 }
// 함수 호출 > 함수명();

// 함수 정의 예제
function addNumber(){
    let num1 = 2;
    let num2 = 3;
    let sum = num1 + num2;
    console.log(`addNumber() 함수호출 sum : ${sum}`);
}

// 함수 호출 예제
addNumber();

//var 변수 : 호이스팅 및 변수 재선언 문제로 지금은 잘 사용하지 않는 변수 예약어
var i = 10;
var i = 20;
i = 30;

// // var 변수 호이스팅
// function displayNumber(){
//     console.log(`i is ${i}`);
//     console.log(`j is ${j}`);
//     var j = 20;
// }
// displayNumber();

// function displayNumber2(){
//     let i;
//     console.log(`i is ${i}`);
//     console.log(`j is ${j}`);
//     let j = 10;
// }
// displayNumber2();

// 매개 변수 : 하나의 함수를 여러 번 실행할 수 있도록 실행할 떄마다 바뀌는 값을 변수로 처리한 것
// 인수 : 함수를 실행할 때 매개 변수 자리에 넘겨주는 값
// return 문 : 함수가 종료할 때 반혼하는 값
function addNumber2(num1, num2){
    let sum = num1 + num2;
    return sum;
}
let result = addNumber2(3, 5);

// 매개 변수에 기본값 지정하기 ( 기본값을 지정할 때는 마지막 매개변수부터 지정한다.)
function multipleNumber(a, b , c){
    return a * b * c;
}
let mnrst = multipleNumber(2, 5);
console.log(`multipleNumber 반환값 : ${mnrst}`);
let mnrst2 = multipleNumber(2, 5, 6);
console.log(`multipleNumber 반환값 : ${mnrst2}`);

// 함수 표현식 - 익명 함수 : 함수 이름이 없고, 변수에 함수를 정의하는 표현식
let sum = function(a, b){
    return a + b;
}
console.log(`익명함수 sum 결과 : ${sum(2,5)}`);

// 함수 표현식 - 즉시 실행 함수 : 페이지가 로딩될 때 호출 없이 바로 실행하도록 하는 함수
(function(){
   console.log("즉시 실행하는 함수가 실행 되었습니다.");
}());

//즉시 실행 함수에 매개변수와 인수를 사용할 경우
(function(a, b){
    console.log(`즉시 실행하는 함수 실행하는 함수 : ${a}, ${b}`);
}(100, 200));

// 함수 표현식 - 화살표 함수 ; 익명 함수에서만 사용 가능하며 => 표기를 사용해서 함수를 작성한다.
// 1. 기본 익명 함수
let hi = function(){
    return alert("안녕하세요");
}
// 2. 기본 화살표 함수로 변경
let hi2 = () => { return alert("안녕하세요");}
// 3. 명령문이 return 문 하나만 있을 때 return을 생략 가능하다.
let hi3 = () => alert("안녕하세요");

// 1. 기본 익명 함수 ( 매개변수가 있을 때)
let hello = function(name){
    console.log(`${name}님, 안녕하세요.`);
}
// 2. 기본 화살표 함수로 변경
let hello2 = name => { console.log(`${name}님, 안녕하세요.`);}

// 1. 기본 익명 함수 ( 매개변수가 여러개 있을 때)
let numSum = function(a, b){
    return a + b;
}
// 2. 기본 화살표 함수
let numSum2 = (a,b) => {return a + b; }
// 3. 기본 화살표 함수 명령문에 return문 하나만 있으면 생략 가능
let numSum3 = (a,b) => a + b;