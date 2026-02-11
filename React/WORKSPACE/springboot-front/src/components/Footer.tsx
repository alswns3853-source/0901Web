import { Link } from "react-router-dom";

export default function Footer() {
  return (
    <div className="p-5 mb-5 text-center</> bg-light">
      <h1 className="mb-3">
        <Link to="/">Footer</Link>
      </h1>
      <h4 className="mb-3">부산광역시 부산진구</h4>
    </div>
  );
}
