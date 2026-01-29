import { useState, type SyntheticEvent } from "react";

export default function ReactOnClick() {
  // useState : 화면의 상태를 변경하고 싶을때 사용하는 Hook(리액트 기능)을 사용
  //const  변수,   변수를 변경할 함수 = useState(초기값);
  const [text, setText] = useState("off");
  const toogle = () => {
    if (text === "on") {
      setText("off");
    } else {
      setText("on");
    }
  };
  return (
    <div>
      <p>ReactOnClick</p>
      <button onClick={toogle}>{text}</button>
    </div>
  );
}
