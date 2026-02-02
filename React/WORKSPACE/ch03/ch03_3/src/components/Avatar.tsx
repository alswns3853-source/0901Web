import type { FC } from "react";
import { Div } from "./Div";
import type { DivProps } from "./Div";

export type AvatarProps = DivProps & {
  size?: string;
};

// prettier-ignore
// 프로필 사진 컴포넌트
export const Avatar: FC<AvatarProps> = ({
  className: _className, style, src, size, ...props
}) => {
  // 가로세로크기 = size ?? size변수가 없는 경우 3rem설정
  const w_or_h = size ?? '3rem'
  // rounded-full : 크기에 맞춰서 완전한 원형으로 설정
  const className = ['rounded-full bg-cover bg-gray-300', _className].join(' ')
  return (
    <Div {...props} src={src} width={w_or_h} height={w_or_h} className={className} style={style} />
  )
}
