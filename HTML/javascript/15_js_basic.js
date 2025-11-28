// 변수 : 프로그램에서 데이터를 담아두는 공간
// 변수 사용 -> let 변수명
let width;
let height;
width = 200;
height = 50;
let area = width * height;
console.log("넓이 : " + area);

// 상수 : 변수 중 하나로서, 한 번 값을 할당하면 값이 바뀌지 않는다. ( 바꾸면 안된다. )
// 상수 사용 -> const 변수명
const PI = 3.14;
let radius = 10;
let area2 = PI * radius * radius;
console.log("원의 넓이 : " + area2);

// 자료형 - 컴퓨터가 처리할 수 있는 데이터의 형태
// 자료형을 확인할 수 있는 함수 : typeof(데이터)

// 숫자 ( number )
console.log(typeof(12345));
console.log(typeof(0.1));
console.log(0.1 + 0.2); // 자바스크립트는 실수 계산을 정밀하게 하지 못한다.

// 문자열 ( string ) - 작은따옴표('') 또는 큰따옴표("") 사이에 데이터가 적히면 모두 문자열로 인식
console.log(typeof("글자문자"));
console.log(typeof("12345"));

// 템플릿 리터럴 - 한 문자열에 변수랑 텍스트랑 같이 사용한다.
//              변수를 사용할 때는 ${변수명} 의 형식으로 사용한다.
let name = "홍길동";
let age = 25;
console.log(`이름은 ${name}이고, 나이는 ${age}입니다.`);

// 논리형 ( boolean ) - 참(true) 또는 거짓(false) 두 가지 값만 가진 자료형.
console.log(typeof(true));
console.log(typeof(false));

// undefined - 변수 선언만하고 값이 할당되지 않은 상태
// null - 변수에 할당된 값이 유효하지 않은 상태

// 배열 - 하나의 변수에 여러 값을 저장할 수 있는 복합 유형
//      배열 사용법 -> let 변수명 = [ 값1, 값2, 값3, ... ]
let spring = "봄";
let summer = "여름";
let fall = "가을";
let winter = "겨울";
let season = ["봄", "여름", "가을", "겨울"];
console.log(season);
console.log(season[0]);
console.log(season[2]);

// 자동 형변환 - 따로 지정하지 않아도 자동으로 자료형을 변경해준다.
// 문자열 * 숫자 -> 문자열을 숫자로 변경해준다.
// 문자열 + 숫자 -> 숫자를 문자열로 변경해준다.
let text = '50';
let num = 5;
console.log(text * num); // 숫자형으로 변환
console.log(text + num); // 문자열형으로 변환

// 문자열 + 숫자 -> 숫자형으로 만들고 싶으면 자료형 변환 함수를 사용해야한다.
console.log(Number(text) + num);

// 형변환 함수
// Number(문자열 또는 논리형) - 문자열 또는 논리형을 숫자로 변경해준다.
// parseInt(문자열) - 문자열을 숫자 정수 변경해준다.
// parseFloat(문자열) - 문자열을 숫자 실수 변경해준다.
// String(숫자나 논리형) - 숫자나 논리형 값을 문자열로 변경해준다.
// Boolean(값) - 괄호 안의 값을 논리형으로 변환한다. ( 문자열 "" , 숫자 0 을 제외한 모든 값은 True )
console.log(Number('123')); // 123
console.log(Number("123ABC")); // NaN - 알수없다.
console.log(parseInt('123')); //123
console.log(parseInt("123.45")); // 123
console.log(parseInt("123ABC")); // 123 (문자가 입력되기 전까지의 숫자를 뽑아낸다.)
console.log(parseFloat("123")); // 123
console.log(parseFloat("123.45")); // 123.45
console.log(parseFloat("123.45ABC")); // 123.45 (문자가 입력되기 전까지의 숫자를 뽑아낸다.)
console.log(String(true)); // 'true' 문자열로 출력
console.log(Boolean(1)); // true 논리형 자료 
console.log(Boolean("")); // false 논리형 자료 (문자열 빈칸)
console.log(Boolean(0)); // false 논리형 자료 (숫자 0)
console.log(Boolean(-1)); // true 논리형 자료

// 연산자 - 데이터끼리 연산할 때 사용하는 부호

// 산술 연산자 : + , - , * , /(나눈값) , %(나머지) , ++(1증가) , --(1감소)
console.log( 10 / 3 ); 
console.log( 10 % 3 );
let num2 = 1;
console.log(num2++);
console.log(num2);
console.log(++num2);
console.log(num2);

// 할당 연산자 : 내 자신을 산술 연산할 때 사용
//     =(값할당) , += , -= , *= , /= , %=
let num3 = 10;
let num4 = 2;
num3 += num4; // num3 = num3 + num4;
console.log(num3);

// 비교 연산자 : 피연산자 2개의 값을 비교해서 boolean 형태로 나타낸다.
//      < , <= , > , >= , ==(같다) , ===(같다) , !=(다르다) , !==(다르다)
let test1 = "3";
let test2 = 3;
console.log(test1 == test2);    // 값만 비교
console.log(test1 === test2);   // 값과 자료형까지 비교

// 논리 연산자 : 여러 가지 조건을 같이 확인할 때 사용하는 연산자
//      OR 연산자 ( || ) , AND 연산자 ( && ) , NOT 연산자 ( ! )
console.log(1 > 2 || 1 < 2);
console.log(1 > 2 && 1 < 2);
console.log(!(1 > 2));

// 조건문 if-else : 조건이 true 라면 실행문을 if문을 실행 false라면 else문을 실행한다.

// let userNumber = prompt("숫자를 입력하세요");

// if(userNumber !== null){
//     if(parseInt(userNumber) % 3 === 0){
//         alert("3의 배수입니다.");
//     }
//     else if(parseInt(userNumber) % 5 === 0){
//         alert("5의 배수입니다.");
//     }
//     else {
//         alert("3의 배수가 아닙니다.");
//     }
// }
// else {
//     alert("숫자를 입력해주세요.");
// }

// 조건 연산자 ( 삼항 연산자 ) : 조건이 1개이고, 실행할 명령이 1개일때 사용가능하다.
//      (조건) ? true일때실행문 : false일때실행문

// let userNumber = prompt('숫자를 입력하세요.');

// if(userNumber !== null){
//     (parseInt(userNumber) % 3 === 0) ? alert("3의 배수 입니다.") : alert("3의 배수가 아닙니다.");
// }
// else {
//     alert("입력이 취소됐습니다.")
// }

// 조건문 ( switch ) - 조건에 따라 case문을 실행한다.
let session = prompt("관심 세션을 선택해주세요. 1-마케팅 2-개발 3-디자인");

switch(session){
    case "1": console.log("마케팅 세션은 201호에서 진행합니다.");
        break;
    case "2": console.log("개발 세션은 203호에서 진행합니다.");
        break;
    case "3": console.log("디자인 세션은 205호에서 진행합니다.");
        break;
    default: alert("잘 못 입력했습니다.");
}

// 반복문(for문)
//      > for( 초기값 ; 조건 ; 증가값 ){ 실행문 }
let sum = 0;
for(let i = 1 ; i < 11 ; i++){
    sum += i; // sum = sum + i; 와 똑같다.
}
console.log(`1~10까지 더한 값은 ${sum} 입니다.`);

// 중첩된 for문을 사용해서 구구단 만들기
// for(let i = 1; i <= 9 ; i++){
//     document.write(`<h3>${i}단</h3>`);
//     for(let j = 1 ; j <= 9 ; j++){
//         document.write(`${i} * ${j} = ${i * j} <br>`);
//     }
// }

// 1 ~ 100 까지의 숫자들 중에서 3의 배수만 document.write 로 출력하여라.
// for(let i = 1; i <= 100; i++){
//     if( i % 3 === 0){
//         document.write(`${i} <br>`);
//     }
// }

// 반복문 ( while ) - 조건이 false 될 때까지 실행문을 반복한다.
//      > while(조건){ 실행문 }
// let stars = parseInt(prompt("몇 개의 별을 표시할까요?"));
// while(stars > 0){
//     document.write('*');
//     stars--;
// }

// 반복문 ( do ~ while ) - 무조건 한 번 실행하고, 조건을 확인하여 참이면 실행문을 반복한다.
// let stars = parseInt(prompt("몇 개의 별을 표시할까요?"));
// do {
//     document.write('*');
//     stars--;
// } while ( stars > 0);

// break 문 - 현재 진행되고 있는 구문을 중단하고 빠져나올 때 사용
// continue 문 - 현재 진행되고 있는 반복문 다음 단계를 진행한다.

// for( let i = 1 ; i < 10 ; i++ ){
    
//     if( i % 2 === 0) { continue; }

//     for( let j = 1 ; j < 10 ; j++ ){
//         document.write(`${i} * ${j} = ${i * j} <br>`);
//     }
    
//     if( i === 7 ){ break; }
// }

// 문제 1. 월드컵은 4년에 한 번 개최된다. 2002년부터 2050년까지의 월드컵이 개최되는 년도를 출력.
//          출력은 document.write 로 출력한다.
// let year = 2002;
// while(year <= 2050){
//     document.write(`while : ${year} <br>`);
//     year += 4;
// }

// for(let i = 2002 ; i <= 2050 ; i = i+4){
//     document.write(`for : ${i} <br>`);
// }

// for(let i = 2002 ; i <= 2050 ; i++){
//     if(i % 4 === 2){
//         document.write(`for2 : ${i} <br>`);
//     }
// }

// 문제 2 . 아래의 별 그림을 완성하시오. ( 중첩 for문 )
// *****
// ****
// ***
// **
// *
for ( let i = 5 ; i > 0 ; i-- ){
    for( let j = 1; j <= i ; j++) {
        document.write(`*`);
    }
    document.write(`<br>`);
}