import { useState, type ChangeEvent } from "react";

export default function OnChange() {
  const [text, setText] = useState("Hello");
  const onChangeValue = (e: ChangeEvent<HTMLInputElement>) => {
    e.stopPropagation();
    e.preventDefault();
    console.log("onChangeValue", e.target.value);
    setText(e.target.value);
  };
  const onChangeChecked = (e: ChangeEvent<HTMLInputElement>) => {
    e.stopPropagation();
    e.preventDefault();
    console.log("onChangeChecked", e.target.checked);
  };
  const onChangeFiles = (e: ChangeEvent<HTMLInputElement>) => {
    e.stopPropagation();
    e.preventDefault();
    console.log("onChangeFiles", e.target.files);
  };
  // prettier-ignore
  return (
    <div>
      <p>OnChange</p>
      <p>{text}</p>
      <input type="text" onChange={onChangeValue}
        placeholder="type some text" defaultValue="Hello" />
      <input type="checkbox" onChange={onChangeChecked} defaultChecked/>
      <input type="file" onChange={onChangeFiles} multiple accept="image/*"/>
    </div>
  );
}
