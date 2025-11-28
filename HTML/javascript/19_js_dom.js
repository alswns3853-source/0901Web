// 문서객체모델(DOM) : 문서에 있는 HTML 요소를 객체로 받아와서 사용할 수 있다.

// 요소에 접근하기
// 1. getElementById('아이디명') : 아이디를 이용해서 요소에 접근 ( 1개 )
// 2. getElementsByClassName('클래스명') : 클래스명을 이용해서 요소들에게 접근 ( 여러개 )
// 3. getElementsByTagName('태그명') : 태그명을 이용해서 요소들에게 접근 ( 여러개 )
// 4. querySeletor('선택자') : 선택자를 이용해서 요소에 접근 ( 1개, 만약 여러개라면 첫번째가 선택 )
// 5. querySeletorAll('선택자') : 선택자를 이용해서 요소들에게 접근 ( 여러개 )
//    ** 여러개에 접근하는 함수를 사용했다면, 인덱스를 이용해서 하나씩 접근 가능

// querySelector를 이용해서 요소에 접근
let heading = document.querySelector('#heading');
console.log(heading);

// querySelectorAll 을 이용해서 요소에 접근
let list = document.querySelectorAll('li');
console.log(list);
console.log(list[0]);
console.log(list[1]);

// 가져온 요소의 텍스트에 접근하기
// innerText : 웹 브라우저 창에 보이는 텍스트 내용에 접근한다.
// innerHTML : 보이는 것과 상관없이 HTML 태그를 포함하여 텍스트 내용에 접근한다.
// textContent : 보이는 것과 상관없이 텍스트 내용에 접근한다.
let detail = document.querySelector("#detail > ul");
console.log(detail.innerText);
console.log(detail.innerHTML);
console.log(detail.textContent);

// detail.innerText = '<h3>변경된 HTML입니다.</h3>';
// detail.innerHTML = '<h3>변경된 HTML입니다.</h3>';
detail.textContent = '<h3>변경된 HTML입니다.</h3>';

// 이벤트를 이용해서 텍스트 변경 및 이미지 변경
let heading2 = document.getElementById('heading2');
let cup = document.querySelector('#cup');

heading2.onclick = function(){
    heading2.innerText = "오늘의 커피"
}
cup.onclick = function(){
    cup.src = "./images/19_images/coffee-blue.jpg";
}
// 선언한 함수 이름으로 이벤트 처리하기.
let cat = document.querySelector('#cat');
cat.onclick = changePic;

function changePic(){
    cat.src = "./images/19_images/kitty-2.png";
}

// DOM의 event 객체 : 웹 문서에서 이벤트 발생한 요소가 무엇인지, 
//                    어떤 이벤트가 발생했는지 등의 정보가 담겨있다.

// event객체의 프로퍼티 중 pageX, pageY, screenX, screenY 를 통해서 이벤트 발생 위치 알아보기
let clickArea = document.querySelector("#clickArea");
clickArea.onclick = function(event){
    console.log(`이벤트 발생 위치(문서기준) : ${event.pageX}, ${event.pageY}`);
    console.log(`이벤트 발생 위치(화면기준) : ${event.screenX}, ${event.screenY}`);
    console.log(`이벤트 발생 대상 : ${event.target}`);
    console.log(`이벤트 발생 시간 : ${event.timeStamp}`);
}
let keyInput = document.querySelector("#keyInput");
keyInput.onkeypress = function(event){
    console.log(`키 이벤트charCode : ${event.charCode}`);
    console.log(`키 이벤트which : ${event.which}`);
    console.log(`키 이벤트key : ${event.key}`);
    console.log(`키 이벤트code : ${event.code}`);
}

// this 예약어 : 이벤트가 발생한 대상에 접근할 때 사용하는 예약어
let cat2 = document.querySelector("#cat2");
cat2.onclick = function(){
    console.log(`이미지파일 : ${this.src}`);
}

// 이벤트 처리하는 방법
// 1. 태그에 on+이벤트명 의 속성으로 처리 가능
// 2. 자바스크립트로 요소를 불러와서 요소.on+이벤트명 = 함수 로 처리 가능
// 3. 자바스크립트로 요소를 불러와서 요소.addEventListener(이벤트, 함수, 캡처여부) 를 사용해서 처리 가능
//      - 이벤트 : 1번과 2번처럼 on을 붙이지 않고 이벤트명을 작성
//      - 함수 : 내가 지정한 함수명을 작성한다.
//      - 캡처 여부 : 이벤트를 캡처하는지 여부 지정, true면 캡처링, false면 버블링(기본값)

// addEventListener 를 가지고 사진에 마우스를 올리면 이미지 바꾸기
let coffee1 = document.querySelector("#coffee1");
coffee1.addEventListener("mouseover", changePic);
coffee1.addEventListener("mouseout", originPic);

// 사진을 변경하는 함수
function changePic(){
    coffee1.src = "./images/19_images/coffee-blue.jpg";
}
// 사진을 원복하는 함수
function originPic(){
    coffee1.src = "./images/19_images/coffee-gray.jpg";
}

// DOM을 이용해서 CSS 속성 변경하기
let rect = document.querySelector("#rect");

rect.addEventListener("mouseover", changeRect);
rect.addEventListener("mouseout", originRect);

function changeRect() {
    rect.style.backgroundColor = "green";
    rect.style.borderRadius = "50%";
}
function originRect(){
    rect.style.backgroundColor = "";
    rect.style.borderRadius = "";
}

// DOM 에서 노드를 추가 또는 삭제하기
// 추가할 때 사용되는 순서
//  1. 노드를 만든다. ( createElement() 사용 )
//  2. 텍스트 노드를 만든다. ( createTextNode() 사용 )
//  3. 부모-자식 노드를 연결시킨다. ( appendChild() 사용 )

let newItem = document.createElement("li"); // li 라는 요소(노드)를 만듦
let newText = document.createTextNode("아이템4"); // "아이템4" 라는 텍스트노드를 만듦
newItem.appendChild(newText); // li 요소에 "아이템4" 텍스트노드 연결

let parent = document.querySelector("#itemList");
parent.appendChild(newItem); // 부모 요소에 li 요소를 연결


// 속성을 넣어서 새로운 노드 추가하기
let newImg = document.createElement("img");
newImg.src = "./images/19_images/books.png";
newImg.width = 100;
newImg.height = 100;

parent.appendChild(newImg);

// 노드를 삭제
//      요소.remove() : 노드를 삭제하는 함수
let removeBtn = document.querySelector("#removeBtn");
removeBtn.addEventListener("click", removeImg);

function removeImg(){
    let img = document.querySelector("#itemList > img");
    img.remove();
}

// 버튼을 통해서 노드를 추가 및 삭제하기
let createBtn = document.querySelector("#createBtn");
let deleteBtn = document.querySelector("#deleteBtn");

let nodeNumber = 0; // 노드 텍스트에 붙여줄 번호

createBtn.addEventListener("click", insertNode);
deleteBtn.addEventListener("click", deleteNode);

function insertNode(){
    let nodeList = document.querySelector("#nodeList");

    let newNode = document.createElement("li");
    let newText = document.createTextNode("아이템" + nodeNumber);
    nodeNumber++;

    newNode.appendChild(newText);
    nodeList.appendChild(newNode);
}
function deleteNode(){
    let nodeList = document.querySelectorAll("#nodeList > li");
    let listNode = nodeList[nodeList.length - 1];
    listNode.remove();
    nodeNumber--;
}

// class 를 추가 또는 삭제 ( 디자인 부분 )
//      classList 를 사용해서 추가 또는 삭제한다.
//      classList.add(클래스명) : 클래스명을 추가
//      classList.remove(클래스명) : 클래스명을 제거
//      classList.toggle(클래스명) : 지정한 클래스명이 있으면 제거, 없으면 추가
//      classList.contain(클래스명) : 클래스 속성에 지정한 클래스명이 있는지 없는지 확인

let checkbox = document.querySelector("#agree"); // 체크박스 요소에 접근한다.
let proceedBtn = document.querySelector("#proceed"); // proceed 버튼에 접근한다.

// 체크박스를 체크하면 enabled 클래스 추가 / 체크 해제하면 disabled 클래스 추가
checkbox.addEventListener("change", function(){
    // if(this.checked) {
    //     proceedBtn.classList.add("enabled");
    //     proceedBtn.classList.remove("disabled");
    //     proceedBtn.disabled = false; 
    // }
    // else {
    //     proceedBtn.classList.add("disabled");
    //     proceedBtn.classList.remove("enabled");
    //     proceedBtn.disabled = true;
    // }
    proceedBtn.classList.toggle('enabled', this.checked);
    proceedBtn.classList.toggle('disabled', !this.checked);
    proceedBtn.disabled = !this.checked;
});

// 실습 1. 체크를 클릭하면 체크와 텍스트에 중간 줄 긋기
let checks = document.querySelectorAll(".check");

for(let i = 0 ; i < checks.length ; i++){
    checks[i].addEventListener("click", function(){
        this.style.color = "#ccc";
        // 아래의 parentNode 는 현재 지정된 대상의 부모 노드에 접근한다.
        this.parentNode.style.color = "#ccc";
        this.parentNode.style.textDecoration = "line-through";
    });
}

// 입력한 행과 열로 테이블 만들기

function drawTable(){
    let rCount = document.querySelector("#rCount").value;
    let cCount = document.querySelector("#cCount").value;

    let newTable = document.createElement("table");
    for(let i = 0 ; i < rCount; i++){
        let newRow = document.createElement("tr");
        for(let j = 0 ; j < cCount; j++){
            let newCell = document.createElement("td");
            let newText = document.createTextNode(i + " , " + j);
            newCell.appendChild(newText);
            newRow.appendChild(newCell);
        }
        newTable.appendChild(newRow);
    }
    let contents = document.querySelector("#contents");
    contents.appendChild(newTable);
}