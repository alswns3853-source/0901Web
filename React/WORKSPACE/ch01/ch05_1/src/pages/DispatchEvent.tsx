export default function DispatchEvent() {
  const onCallDispatchEvent = () => {
    console.log("onCallDispatchEvent");
    // dispatchEvent() : 코드를 이용하여 버튼을 클릭할 때 사용
    // isTrusted 값
    // 사람이 클릭 : true
    // dispatchEvent로 클릭 : false
    // 클릭 실행 후 코드를 이용하여 root를 한번 더 실행
    document
      .getElementById("root")
      ?.dispatchEvent(new Event("click", { bubbles: true }));
  };
  const onCallClick = () => {
    console.log("onCallClick");
    document.getElementById("root")?.click; // 클릭이 안됨
  };
  return (
    <div>
      <p>DispatchEvent</p>
      <button onClick={onCallDispatchEvent}>call dispatchEvent</button>
      <button onClick={onCallClick}>call click</button>
    </div>
  );
}
