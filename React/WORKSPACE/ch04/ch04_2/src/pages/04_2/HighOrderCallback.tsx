import { useCallback, useMemo, useState } from "react";
import * as D from "../../data";
import { Button } from "../../theme/daisyui";
import { Title } from "../../components";

export default function HighOrderCallback() {
  // 고차함수 : onClick 생성시 필요한 함수와 매개변수를 동시에 설정하는 방식
  const onClick = useCallback(
    (name: string) => () => alert(`${name} clicked`),
    [],
  );
  const buttons = useMemo(
    () =>
      D.makeArray(3)
        .map(D.randomName)
        .map((name, index) => (
          <Button
            key={index}
            onClick={onClick(name)}
            className="btn-primary btn-wide btn-xs"
          >
            {name}
          </Button>
        )),
    [onClick],
  );
  const [count, setCount] = useState(0);
  const handlePlus = useCallback(() => {
    // set함수의 값을 함수형식으로 변경하면 useEffect, useCallback 같은 콜백 함수 안에서도 사용할 수 있음
    setCount((count) => count + 1);
  }, []);
  return (
    <section className="mt-4">
      <Title>HigtOrderCallback</Title>
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
