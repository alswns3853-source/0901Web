import { useCallback } from "react";
import { useNavigate } from "react-router-dom";

export default function NoMatch() {
  const navigate = useNavigate();
  const goBack = useCallback(() => {
    // navigate의 값에 따라 이동하는 페이지가 달라짐
    // 마이너스값 : -1 = 뒤로가기, -2 = 두번째 뒤로가기
    // 플러스값 : 1 = 앞으로가기, 2 = 두번째 앞으로가기
    navigate(-1);
  }, [navigate]);
  const goHome = useCallback(() => {
    // navigate의 값에 따라 이동하는 페이지가 달라짐
    // 링크 주소 : 해당 링크로 이동
    navigate("/");
  }, [navigate]);
  return (
    <div className="flex flex-col p-4">
      <p className="text-xl text-center p-4 alert alert-error">
        Oops! No page found!
      </p>
      <div className="flex justify-center mt-4">
        <button className="ml-4 btn-primary btn-xs" onClick={goBack}>
          GO BACK
        </button>
        <button className="ml-4 btn-primary btn-xs" onClick={goHome}>
          GO HOME
        </button>
      </div>
    </div>
  );
}
