// 전역 변수
const cache: Record<string, any> = {};

export const useOrCreate = <T>(key: string, callback: () => T): T => {
  // cache[키] 가 없는 경우 cache[키]와 callback함수를 저장
  if (!cache[key]) cache[key] = callback();
  return cache[key] as T;
};
