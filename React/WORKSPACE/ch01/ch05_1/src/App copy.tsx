import * as D from "./data";
import Book from "./Book";
import ArrowComponent from "./ArrowComponent";
import P from "./p";

function App() {
  // JSX문법 : return() 안에 적는 html문법을 뜻함
  console.log("Test ");
  return (
    <>
      <Book />
      <ArrowComponent
        key="1"
        href="https://google.com"
        text="go to Google"
        children={<P key="1" children={"구글"} />}
      />
      <ArrowComponent
        key="2"
        href="https://twitter.com"
        text="go to Twitter"
        children={<P key="2" children={"트위터"} />}
      />
      <ArrowComponent
        key="3"
        href="https://naver.com"
        text="go to naver"
        children={<P key="3" children={"네이버"} />}
      />
      <div>
        <p>
          {/* {} : JSX 문법 안에서 자바스크립트 코드를 사용할때 사용함 */}
          {/* {}안에 반환할 값이 없는 경우에는 사용시 에러 발생 */}
          {D.randomName()},{D.randomJobTitle()}, {D.randomDayMonthYear()}
          {/* {console.log("asd")} 반환값이 없어 에러 발생 */}
        </p>
        {/*  속성={자바스크립트변수} : 속성에 값을 설정 */}
        <img src={D.randomAvatar()} height="50" />
        <img src={D.randomImage()} height="300" />
      </div>
    </>
  );
}

export default App;
