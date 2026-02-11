import { Link } from "react-router-dom";

export default function Header() {
  return (
    <div className="p-5 mb-5 text-center</> bg-light">
      <h1 className="mb-3">
        <Link to="/">My Blog</Link>
      </h1>
      <h4 className="mb-3">블로그에 오신 것을 환영합니다.</h4>
    </div>
  );
}
