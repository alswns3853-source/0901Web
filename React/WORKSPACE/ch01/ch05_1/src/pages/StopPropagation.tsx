import type { SyntheticEvent } from "react";

export default function StopPropagation() {
  const onDivClick = (e: SyntheticEvent) =>
    console.log("click event bublles on <div>");
  const onButtonClick = (e: SyntheticEvent) => {
    console.log("mouse click occurs on <button> and class stopPropagation");
    e.stopPropagation();
  };
  return (
    <div onClick={onDivClick}>
      <p>StopPropagation</p>
      <button onClick={onButtonClick}>Click Me stop event propagation</button>
    </div>
  );
}
