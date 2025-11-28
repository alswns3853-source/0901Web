//  객체란 ? 데이터를 저장하고 처리하는 기본 단위
// 인스턴스 ? 객체를 복사해서 변수에 저장하는 것( new 키워드를 사용한다. )
// 프로퍼티란 ? 객체의 특징이나 속성
// 매서드란 ? 객체에서 할 수 있는 동작(함수)

// 인스턴스는 객체의 프로퍼티와 매서드를 그대로 물려받는다.
// 프로퍼티와 매서드를 사용할 때는 인스턴스명.프로퍼티명 또는 매서드명을 작성한다.

// 인스턴스 사용 예시 ( Date 객체 사용 )
let now = new Date();
console.log(`현재 시각은 ${now.toLocaleString()}`);

// 내장 객체 - Array 객체 ( 배열 ) 

// 1. 배열 만들기
let arr1 = new Array(); // 배열의 크기를 따로 지정하지 않는다.
let arr2 = new Array(4); // 배열의 크기를 4개로 지정함.
let arr3 = ["one", "two", "three", "four"]; // 배열에 넣을 값이 존재할 때 배열 생성
let arr4 = Array("one", "two", "three", "four"); // 배열에 넣을 값이 존재할 때 Array 함수를 사용해서 생성

// 2. Array 객체의 프로퍼티 length : 배열 안의 데이터의 갯수를 나타낸다.
let numbers = ["one", "two", "three", "four"];
for( let i = 0 ; i < numbers.length ; i++ ){
    console.log(`${numbers[i]}`);
}

// 3. Array 객체의 메서드들 
//      concat() 메서드 : 서로 다른 2개의 배열을 합쳐서 새로운 배열을 만든다.
let nums = [1, 2, 3];
let chars = ['a', 'b', 'c', 'd'];

let numsChars = nums.concat(chars); // nums와 chars 를 순서대로 합친다.
let charsNums = chars.concat(nums); // chars와 nums 를 순서대로 합친다.

console.log(`concat() 메서드 : ${numsChars}`);
console.log(`concat() 매서드 : ${charsNums}`);

//      jon() 메서드 : 배열 요소들을 연결해서 하나의 문자열로 만든다. ( 구분자 지정 가능 )
let string1 = nums.join(); // join 메서드에 인수가 없으면 ','를 구분자로 사용한다.
console.log(`join() 메서드 : ${string1}`);
let string2 = chars.join('/'); // join 매서드에 인수가 있으면 그 인수를 구분자로 사용한다.
console.log(`join() 메서드 : ${string2}`);

//      push(), unshift() 메서드 : 기본 배열에 맨 끝(앞)에 요소를 추가하는 메서드
let push1 = nums.push(4,5);
console.log(`push() 메서드 : length - ${nums.length} / 배열 - ${nums}`);

let unshift1 = nums.unshift(0)
console.log(`unshift() 메서드 : length - ${nums.length} / 배열 - ${nums}`);

//      pop(), shift() 메서드 : 기존 배열에 맨 끝(앞)에 요소를  1개씩 꺼내는 메서드
let pop1 = chars.pop();
console.log(`pop() 메서드의 반환값 : ${pop1}`);
console.log(`pop() 메서드 : length - ${chars.length} / 배열 - ${chars}`);

let shift1 = chars.shift();
console.log(`shift() 메서드의 반환값 : ${shift1}`);
console.log(`shift() 메서드 : length - ${chars.length} / 배열 - ${chars}`);

//     splice() 메서드 : 중간에 요소를 추가하거나 삭제하는 메서드
let study = ['html', 'css', 'javascript', 'jquery', 'react', 'nodejs'];
//         인수가 1개일 경우 : 지정한 인덱스부터 맨 끝까지 요소를 삭제하고 배열을 반환한다.
let js = study.splice(2);
console.log(`반환된 배열 : ${js}`);
console.log(`원래의 배열 : ${study}`);

//         인수가 2개일 경우 : 지정한 인덱스(첫번째인수)부터 삭제할 요소의 개수(두번째인수)만큼 
//                           삭제하고 배열을 반환한다.
let jquery = js.splice(1 , 1);
console.log(`반환된 배열 : ${jquery}`);
console.log(`원래의 배열 : ${js}`);

//         인수가 3개 이상일 경우 : 지정한 인덱스(첫번째인수)부터 삭제할 요소의 개수(두번째인수)만큼

//                                삭제하고 배열 반환한 다음, 요소를 추가한다.
let modernJs = js.splice(1, 0, 'typescript', 'java', 'c');
console.log(`반환된 배열 : ${modernJs}`);
console.log(`원래의 배열 : ${js}`);


//        slice() 메서드 : 기존 배열을 바꾸지 않으면서 요소를 추출하는 메서드
let colors = ["red", "green", "blue", "white", "black"];

//           인수가 1개일 때 : 지정한 인덱스(첫번쨰인수) 부터 마지막 요소까지 추출한다.
let slice1 = colors.slice(2);
console.log(`slice() 메서드 : ${slice1}`);
console.log(`원래의 배열 : ${colors}`);

//           인수가 2개일 때 : 지정한 인덱스(첫번쨰인수)부터 지정한 인덕세(두번쨰인수) 직전 인덕스까지 주출한다.
let slice2 = colors.slice(2, 4);
console.log(`slice() 메서드 : ${slice2}`);
console.log(`원래의 배열 : ${colors}`);
//----------------------------------------------------------------------------------------------------------------------------------------
// 내장 객체 - Date 객체

// Date 객체 만들기
let today = new Date(); // 객체 만들 때 인수를 지정하지 않으면 오늘 날짜로 지정이된다.

let date1 = new Date("2024-02-25"); // 특정 날짜를 지정해서 date 값을 만들 수 있다.
let date2 = new Date("2024-02-25T12:00:00"); // 특정 날짜에 더해서 시간까찌 지정할 수 있다.

// Date의 메서드들
// Date의 날짜/시간 정보를 가져오는 메서드들
console.log(today.getFullYear()); // 4자리 년도
console.log(today.getMonth()); // 0~11까지 월(사용자에게 보여줄때는 +1 을 해줘야한다.)
console.log(today.getDate()); // 일
console.log(today.getDay()); // 0(일요일) ~ 6(토요일) 요일 까지
console.log(today.getTime()); // 1970년 1월 1일 0시 0분 기준으로 지정한 날짜까지의 밀리초
console.log(today.getHours()); // 0~23까지의 시간
console.log(today.getMinutes()); // 0~59까지의 분
console.log(today.getSeconds()); // 0~59까지의 초
console.log(today.getMilliseconds()); // 0~999까지의 밀리초
console.log(today);

// Date의 날짜/시간 정보를 저장하는 메서드들
let setDate1 = new Date();
// setDate1 의 날짜/시간을 2024년 1월 1일 0시 10분 20.500초로 지정
setDate1.setFullYear(2024);
setDate1.setMonth(0);
setDate1.setDate(1);
setDate1.setHours(0);
setDate1.setMinutes(10);
setDate1.setSeconds(20);
setDate1.setMilliseconds(500);
console.log(setDate1);

// Date 날짜/시간 형식을 바꿔서 보기
console.log(today.toLocaleString()); // 지정한 날짜와 시간을 현지 시간 기준으로 표시
console.log(today.toString()); // 지정한 날짜와 시간을 문자열로 변경해서 표시

// 실습 - D-day 계산
let nowDate = new Date(); // 오늘 날짜를 인스턴스로 지정
let firstDay = new Date("2025-02-28"); // 시작 날짜를 인스턴스로 지정

let toNow = now.getTime(); // 오늘까지 지난 시간(밀리초)
let toFirst = firstDay.getTime(); // 시작 날짜까지 지난 시간(밀리초)
let passedTIme = toNow - toFirst; // 첫날부터 오늘까지 지난 시간(밀리초)

passedTime = Math.round(passedTIme/(1000*60*60*24)); // 밀리초를 일 수로 변경하여 반올림함

document.getElementById("result").innerText = passedTime;

// 내장 객체 - Math 객체

//전체 응모자 중에서 당첨되는 사람(번호)을 뽑기
// let seed = prompt("전체 응모자 수 : ");
// let winner = prompt("당첨자 수 : ")
// random() 메서드 : 0 ~ 1 사이의 랜덤한 수를 반환하는 매서드
//      random() * seed : 0 ~ seed 사이의 랜덤한 수를 변환
//      random() * seed + 1 : 1 ~ seed+1 사이의 랜덤한 수를 변환
// floor() 매서드 : 소수점 이하의 부분을 버린다.

// let all = document.getElementById("all");
// let sel = document.getElementById("sel");

// all.innerText = `전체 응시자 수 : ${seed}`;
// let winnerArr = new Array();
// for( let i = 0 ; i < winner ; i++){
//      let picked = Math.floor ((Math.random() * seed) + 1);
//      if(winnerArr.indexOf(picked) !== -1){
//          i -= 1;
//          continue;
//      }
//      else {
//         winnerArr.push(picked);
//         sel.innerHTML += `당첨자 : ${picked} <br>`; 
//      }
// }

// ceil() 메서드 : 소수점 이하 부분을 올립니다.
// max() 메서드 : 인수 중에서 최대 값을 반환한다.
// min() 매서드 : 인수 중에서 최소 값을 반환한다.
// round() 매서드 : 소수점 이하 부분을 반올림한다.

//window 객체 - open 메서드
//  open(경로, 창 이름, 창 옵션) : 팝업 창을 띄울 때 사용하는 메서드
//          경로 : 팝업 창에 표시할 문서 파일 경로 또는 사이트 주소
//          창 이름 : 팝업 창의 이름 ( 중복해서 띄우지 않게 지정하는 이름 )
//          창 옵션 : left, top 을 통해서 띄울 창의 위치 지정, width, height 를 통해서 띄울 창의 크기 지정

// window.open('./notice.html', 'pop' , 'width=500, height=400, left= 100, top = 100');

(function(){
    // window.open() 메소드는 팝업차단 등의 이유로 창을 띄우지 못할 시에 null 을 반환한다.
    let newWin = window.open('./notice.html', 'pop' , 'width=500, height=400, left= 100, top = 100');
    if ( newWin == null){
        alert("팝업이 차단되었습니다. 해제해주세요.");
    }
}());

// window.close() 메서드 : 띄운 팝업창을 닫을 때 사용하는 메서드
let myWin;

function openWin(){
    let opt = 'width=400, height=350, left=300, top=200';
    myWin = window.open("./notice.html", "pop1", opt);
}
function closeWin(){
    myWin.close();
}

// 브라우저 객체 - Location 객체
//      location 객체의 프로퍼티 알아보기
console.log(`location.href : ${location.href}`);
console.log(`location.host : ${location.host}`);
console.log(`location.protocol : ${location.protocol}`);

let assignBtn = document.getElementById('assignBtn');
let replaceBtn = document.getElementById('replaceBtn');
let reloadBtn = document.getElementById('reloadBtn');
assignBtn.onclick = function(){
    // assign() 메서드는 페이지를 이동했기 떄문에 뒤로가기를 통해 돌아오기가 가능
    location.assign('https://www.naver.com');
}
replaceBtn.onclick = function(){
    // replace() 메서드는 페이지를 교체했기 때문에 뒤로가기를 통해 돌아오기가 불가능
    location.replace('https://www.naver.com');
}
reloadBtn.onclick = function(){
    location.reload();
}

//브라우저 객체 - screen 객체 ( 화면 관련하여 저장된 객체 )
console.log(`screen.availWidth : ${screen.availWidth}`); // 사용가능한 가로 넓이
console.log(`screen.width : ${screen.width}`); // 화면 자체의 가로 넓이
console.log(`screen.availHeight : ${screen.availHeight}`); // 사용가능한 세로 높이
console.log(`screen.height : ${screen.height}`); // 화면 자체의 세로 높이