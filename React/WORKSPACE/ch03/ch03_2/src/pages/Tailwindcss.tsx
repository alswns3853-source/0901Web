import * as D from "../data";
export default function Tailwindcss() {
  return (
    // 테일윈드 색성 설정(불투명도는 생략 가능)
    // 무채색 : 접두사-색상명/불투명도
    // 유채색 : 접두사-색상_이름-채도/불투명도
    <div className="bg-black/70">
      <p className="w-full p-4 text-3xl text-white">Tailwindcss</p>
      <p className="italic text-justify text-gray-50 line-clamp-3">
        {D.randomParagraphs(10)}
      </p>
      <button className="btn btn-primary" style={{ textTransform: "none" }}>
        Button
      </button>
    </div>
  );
}
