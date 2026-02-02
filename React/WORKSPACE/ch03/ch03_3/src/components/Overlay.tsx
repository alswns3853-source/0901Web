import type { FC } from "react";
import type { ReactDivProps } from "./Div";
import { Div } from "./Div";

export type OverlayProps = ReactDivProps & {
  opacityClass?: string;
};

export const Overlay: FC<OverlayProps> = ({
  className: _className, // 외부에서 설정하는 tailwindcss문법
  opacityClass, // 투명도
  children, // 자식 태그
  ...props // 그 외의 속성들
}) => {
  const className = [
    _className,
    // modal 창에서 사용하는 공통 CSS 설정
    "absolute z-50 w-screen h-screen",
    // 투명도를 설정하지 않으면 기본 검정색에 70퍼센트 불투명도 설정
    opacityClass ?? "bg-black/70",
    // flex 레이아웃에 가로세로 중앙 정렬
    "flex items-center justify-center",
  ].join(" ");

  // prettier-ignore
  return (
    <Div {...props} className={className} top="0" left="0">{children}</Div>
  )
};
