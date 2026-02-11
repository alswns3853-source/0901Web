import { useRef } from "react";
import "../assets/member.css";
import axios from "axios";
import { useNavigate } from "react-router-dom";

export default function Signup() {
  const emailRef = useRef<HTMLInputElement>(null);
  const passwordRef = useRef<HTMLInputElement>(null);
  const navigate = useNavigate();
  const onSubmit = async (e: MouseEvent) => {
    e.preventDefault();
    if (!emailRef.current && !passwordRef.current) {
      return;
    }
    const data = {
      email: emailRef.current?.value || "",
      password: passwordRef.current?.value || "",
    };
    try {
      await axios.post("http://localhost:8080/api/user", data);
      alert("회원가입을 완료했습니다.");
      navigate("/login");
    } catch (e) {
      console.log(e);
    }
  };
  return (
    <section className="d-flex vh-100">
      <div className="container-fluid row justify-content-center align-content-center">
        <div className="card bg-dark" style={{ borderRadius: "1rem;" }}>
          <div className="p-5 text-center card-body">
            <h2 className="text-white">SIGN UP</h2>
            <p className="mt-2 mb-5 text-white-50">
              서비스 사용을 위한 회원 가입
            </p>

            <div className="mb-2">
              <form onSubmit={onSubmit}>
                <div className="mb-3">
                  <label className="text-white form-label">Email address</label>
                  <input
                    type="email"
                    ref={emailRef}
                    className="form-control"
                    name="email"
                  />
                </div>
                <div className="mb-3">
                  <label className="text-white form-label">Password</label>
                  <input
                    type="password"
                    ref={passwordRef}
                    className="form-control"
                    name="password"
                  />
                </div>

                <button type="submit" className="btn btn-primary">
                  Submit
                </button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
