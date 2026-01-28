import * as U from "./util";
// 랜덤 이미지의 URL을 출력하는 함수
export const picsumUrl = (width: number, height: number): string =>
  `https://picsum.photos/${width}/${height}`;

// 이미지의 가로 세로 크기를 랜덤으로 설정하여 랜덤 이미지를 돌려주는 함수
export const randomImage = (
  w: number = 1000, // 가로 기본값 = 1000
  h: number = 800, // 세로 기본값 = 800
  delta: number = 200, // 범위 기본값 = 200
): string => picsumUrl(U.random(w, w + delta), U.random(h, h + delta));
// 200 ~ 400 사이의 크기를 가진 랜덤 이미지를 돌려주는 함수
export const randomAvatar = () => {
  const size = U.random(200, 400);
  return picsumUrl(size, size);
};
