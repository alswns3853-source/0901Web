import { useCallback, useMemo, useState } from "react";
import * as D from "../../data";
import { Button } from "../../theme/daisyui";
import { Title } from "../../components";

export default function Callback() {
  // useCallback(실행할함수, 의존성배열)
  const onClick = useCallback(() => alert("button clicked"), []);
  // const onClick = () => alert("button clicked"), []);
  const buttons = useMemo(
    () =>
      D.makeArray(3)
        .map(D.randomName)
        .map((name, index) => (
          <Button
            key={index}
            onClick={onClick}
            className="btn-primary btn-wide btn-xs"
          >
            {name}
          </Button>
        )),
    [onClick],
  );
  const [count, setCount] = useState(0);
  const handlePlus = () => {
    setCount(count + 1);
  };
  return (
    <section className="mt-4">
      <Title>Callback</Title>
      <p>
        {count}
        <button className="btn btn-primary" onClick={handlePlus}>
          더하기
        </button>
      </p>
      <div className="flex mt-4 justify-evenly">{buttons}</div>
    </section>
  );
}
