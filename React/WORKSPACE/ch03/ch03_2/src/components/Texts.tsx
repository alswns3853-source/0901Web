import type { FC, DetailedHTMLProps, HTMLAttributes } from "react";
import { makeClassName } from "./textUtil";

// Texts.tsx 사용시 필요한 매개변수 타입 설정
type TextProps = DetailedHTMLProps<
  HTMLAttributes<HTMLParagraphElement>,
  HTMLParagraphElement
>;

// 타이틀 설정시 필요한 매개변수
export type TitleProps = TextProps & {
  numberOfLines?: number; // 출력할 줄 수
};
// 제목 생성 컴포넌트
export const Title: FC<TitleProps> = ({
  className: _className,
  numberOfLines,
  ...props
}) => {
    // className 설정 
  const className = makeClassName(
    "font-bold text-5xl text-center whitespace-pre-line", // 타이틀의 기본 CSS
    _className, // 추가 CSS
    numberOfLines, // 출력줄수
  );
  return <p {...props} className={className} />; // 타이틀을 p태그로 작성하여 반환
};

// 부제목 설정
export type SubtitleProps = TitleProps & {};
export const Subtitle: FC<SubtitleProps> = ({
  className: _className,
  numberOfLines,
  ...props
}) => {
  const className = makeClassName(
    "font-semibold text-3xl text-center whitespace-pre-line",
    _className,
    numberOfLines,
  );
  return <p {...props} className={className} />;
};
// 요약 설정
export type SummaryProps = SubtitleProps & {};
export const Summary: FC<SummaryProps> = ({
  className: _className,
  numberOfLines,
  ...props
}) => {
  const className = makeClassName(
    "text-sm whitespace-pre-line",
    _className,
    numberOfLines,
  );
  return <p {...props} className={className} />;
};
// 문단 설정
export type ParagraphProps = SummaryProps & {};
export const Paragraph: FC<ParagraphProps> = ({
  className: _className,
  numberOfLines,
  ...props
}) => {
  const className = makeClassName(
    "font-normal text-base whitespace-pre-line",
    _className,
    numberOfLines,
  );
  return <p {...props} className={className} />;
};
