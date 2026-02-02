// className을 만드는 함수
export const makeClassName = (
  setting: string, // text-center
  _className?: string, // text-white
  numberOfLines?: number, // 1
  // text-center text-white line-clamp-1
) =>
  [
    setting,
    numberOfLines ? `line-clamp-${numberOfLines}` : "",
    _className,
  ].join(" ");
