import { StrictMode } from "react";
import { createRoot } from "react-dom/client";
import "./index.css";
import App from "./App.tsx";

// createRoot : index.html 파일의 root 태그를 찾아서 화면을 그리는 함수
createRoot(document.getElementById("root")!).render(
  // StrictMode 개발 모드로 실행시 오류 검증을 하는 컴포넌트
  <StrictMode>
    {/* App : root태그 안에 출력할 내용을 작성하는 컴포넌트 */}
    <App />
  </StrictMode>,
);
