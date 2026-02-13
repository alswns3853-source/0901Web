import { useEffect } from "react";
import { useNavigate, useSearchParams } from "react-router-dom";

export default function Social() {
  const [searchParams] = useSearchParams();
  const navigate = useNavigate();
  useEffect(() => {
    const accessToken = searchParams.get("token");
    const userId = searchParams.get("userId");
    if (accessToken && userId) {
      localStorage.setItem("access_token", accessToken);
      localStorage.setItem("user_id", userId);
    }
    navigate("/articles");
  }, []);
  return <div>로그인중 입니다.</div>;
}
