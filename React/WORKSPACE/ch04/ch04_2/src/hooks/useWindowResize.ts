import { useEffect, useState } from "react";
import { useEventListener } from "./useEventListener";

export const useWindowResize = () => {
  const [widthHeight, setWidthHeight] = useState<number[]>([0, 0]);

  useEffect(() => {
    // 컴포넌트 생성시 현재 창의 가로세로 크기를 state로 저장
    setWidthHeight((notUsed) => [window.innerWidth, window.innerHeight]);
  }, []);

  useEventListener(window, "resize", () => {
    // 창 크기 변경시 state에 가로세로크를 저장
    setWidthHeight((notUsed) => [window.innerWidth, window.innerHeight]);
  });

  return widthHeight;
};
