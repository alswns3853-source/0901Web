// 타입스크립트 변수 선언
// let 변수이름 : 자료형 = 값;
// makeArray함수 : length개의 공간을 가진 Array 객체를 생성
export const makeArray = (length: number) => new Array(length).fill(null);
// range함수 : min부터 max까지의 값을 하나씩 저장하는 배열 생성 
export const range = (min: number, max: number): number[] => 
  makeArray(max - min).map((notUsed, index) => index + min);
// random함수 : min부터 max까지의 랜덤한 숫자를 반환
export const random = (min: number, max: number): number =>
  Math.floor(Math.random() * (max - min)) + min;
