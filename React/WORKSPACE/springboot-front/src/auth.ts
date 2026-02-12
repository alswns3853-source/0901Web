import axios from "axios";

function getCookie(key: string) {
  var result = null;
  var cookie = document.cookie.split(";");
  cookie.some(function (item) {
    item = item.replace(" ", "");

    var dic = item.split("=");

    if (key === dic[0]) {
      result = dic[1];
      return true;
    }
  });

  return result;
}

// axios 객체 생성
// axios.get(url)이 아닌 auth.get(url)방식으로 사용 가능하도록 객체를 생성함
const auth = axios.create({
  baseURL: "http://localhost:8080/api",
  headers: {
    "Content-Type": "application/json",
  },
});
auth.interceptors.request.use((config) => {
  const accessToken = localStorage.getItem("access_token");
  if (accessToken) {
    config.headers.Authorization = `Bearer ${accessToken}`;
  }
  return config;
});
auth.interceptors.response.use(
  (response) => response,
  async (error) => {
    const originalRequest = error.config;
    const refresh_token = getCookie("refresh_token");

    // 통신이 실패하고 리프레시 토큰이 존재하는 경우의 if문
    if (error.status === 401 && refresh_token && !originalRequest) {
      originalRequest._retry = true; // 무한 루프 방지용 플래그
      try {
        // 리프레시 토큰으로 새로운 액세스 토큰 발급 
        const resp = await axios.post("http://localhost:8080/api/token", {
          refreshToken: refresh_token});
        const newAccessToken = resp.data.accessToken;
        // 로컬 스토리지에 액세스 토큰저장
        localStorage.setItem("access_token", newAccessToken);
        // 실패했던 요청에 새로운 엑세스 토큰을 설정
        originalRequest.headers["Authorization"] = "Bearer " + newAccessToken;
        // 실패했던 요청 재시도
        return auth(originalRequest);
      } catch (e) {
        localStorage.removeItem("access_token");
        console.log(e);
        return Promise.reject(error);
      }
    }
    return Promise.reject(error);
  },
);
export default auth;