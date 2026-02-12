import { Link, useNavigate } from "react-router-dom";
import "../assets/member.css";
import { useRef } from "react";
import axios from "axios";

export default function Login() {
  const emailRef = useRef<HTMLInputElement>(null);
  const passwordRef = useRef<HTMLInputElement>(null);
  const navigate = useNavigate();
  const onSubmit = async (e: MouseEvent) => {
    e.preventDefault();
    if (!emailRef.current && !passwordRef.current) {
      return;
    }
    const data = {
      username: emailRef.current?.value || "",
      password: passwordRef.current?.value || "",
    };
    try {
      const response = await axios.post(
        "http://localhost:8080/api/login",
        data,
      );
      console.log(response.data);
      localStorage.setItem("access_token", response.data["accessToken"]);
      localStorage.setItem("user_id", response.data["userId"]);
      navigate("/articles");
    } catch (e) {
      console.log(e);
    }
  };
  return (
    <div className="gradient-custom">
      <section className="d-flex vh-100">
        <div className="container-fluid row justify-content-center align-content-center">
          <div className="card bg-dark" style={{ borderRadius: "1rem;" }}>
            <div className="p-5 text-center card-body">
              <h2 className="text-white">LOGIN</h2>
              <p className="mt-2 mb-5 text-white-50">
                서비스를 사용하려면 로그인을 해주세요!
              </p>

              <div className="mb-2">
                <form onSubmit={onSubmit}>
                  <input
                    type="hidden"
                    name="${_csrf?.parameterName}"
                    value="${_csrf?.token}"
                  />
                  <div className="mb-3">
                    <label className="text-white form-label">
                      Email address
                    </label>
                    <input
                      type="email"
                      className="form-control"
                      ref={emailRef}
                    />
                  </div>
                  <div className="mb-3">
                    <label className="text-white form-label">Password</label>
                    <input
                      type="password"
                      className="form-control"
                      ref={passwordRef}
                    />
                  </div>
                  {/* <div className="mb-3">
                    <input
                      type="checkbox"
                      className="form-check-input"
                      name="remember-me"
                    />
                    <label className="text-white form-check-label">
                      자동 로그인
                    </label>
                  </div> */}
                  <button type="submit" className="btn btn-primary">
                    Submit
                  </button>
                  <a
                    href="http://localhost:8080/oauth2/authorization/kakao"
                    className="btn btn-primary"
                  >
                    카카오 로그인
                  </a>
                  <a
                    href="http://localhost:8080/oauth2/authorization/google"
                    className="btn btn-primary"
                  >
                    구글 로그인
                  </a>
                </form>

                <Link
                  type="button"
                  className="mt-3 btn btn-secondary"
                  to="/signup"
                >
                  회원가입
                </Link>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
  );
}
