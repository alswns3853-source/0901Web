import * as D from "./data";
import Book from "./Book";

function App() {
  // JSX문법 : return() 안에 적는 html문법을 뜻함
  console.log("Test ");
  return (
    <>
      <Book />
      <div>
        <p>
          {/* JSX 문법 안에서 자바스크립트 코드를 사용할 때 사용함 */}
          {/* {}안에 반환할 값이 없는 경우에는 사용시 에러 발생 */}
          {D.randomName()}, {D.randomJobiTitle()}, {D.randomDayMonthYear()}
          {/* {console.log("asd")} 반환값이 없어 에러 발생 */}
        </p>
        {/* 속성 = {자바스크립트변수} : 속성에 값을 설정 */}
        <img src={D.randomAvatar()} height="50" />
        <img src={D.randomImage()} height="300" />
      </div>
    </>
  );
}

export default App;
