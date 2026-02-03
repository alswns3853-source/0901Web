import { useEffect, useRef, useState, type FC } from "react";
import { Div, Title, Subtitle } from "../components";

const Clock = () => {
  // 화면갱신을 위한 useState 선언
  const [today, setToday] = useState(new Date());
  const [count, setCount] = useState(0);
  // useRef 사용 이유
  // 1. DOM을 직접 조작해야하는 경우
  // 2. 화면 갱신과 상관없이 변수를 저장해야하는 경우
  //     => 일반적인 변수의 경우 리렌더링시 매번 초기화됨
  const text = useRef<HTMLInputElement>(null);
  let count2 = 0; // 일반 변수는 제대로 작동하지 않음
  //   useEffect(()=>{ 실행 코드},[]) 컴포넌트 생성시 실행
  //   useEffect(()=>{ 실행 코드},[변수]) 변수가 변경될때 실행
  //   useEffect(()=>{ return () => 실행 코드 },[]) 컴포넌트 삭제시 실행
  useEffect(() => {
    setInterval(() => {
      let next = new Date();
      setToday(next);
    }, 1000);
    console.log("컴포넌트 생성시 실행");
    return () => console.log("컴포넌트 삭제시 실행");
  }, []);
  useEffect(() => {
    console.log("의존성 배열에 있는 state가 변경될때 실행");
  }, [count]);
  //   useEffect(() => {
  //     console.log("컴포넌트 변경시 실행");
  //   }); // 컴포넌트에 어떤 state가 변경되던 실행, 사용 안함
  //   useEffect(() => {
  //     return () => console.log("컴포넌트 삭제시 실행");
  //   }, []);
  const handlePlus = () => {
    count2 = count2 + 1;
    setCount(count + 1);
  };
  const handleChangeText = () => {
    console.log(text.current.value);
  };
  return (
    <Div className="flex flex-col items-center justify-center h-screen text-white bg-primary">
      <Title className="text-5xl">{today.toLocaleTimeString()}</Title>
      <Subtitle className="mt-4 text-2xl">
        {today.toLocaleDateString()}
      </Subtitle>
      <p>{count}</p>
      <button className="btn btn-primary" onClick={handlePlus}>
        더하기
      </button>
      <p></p>
      <input
        ref={text}
        onChange={handleChangeText}
        type="text"
        className="text-black input input-primary"
      />
    </Div>
  );
};
export default Clock;
