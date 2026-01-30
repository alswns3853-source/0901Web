import "./App.css";
import { BrowserRouter, Link, Route, Routes } from "react-router-dom";
import Tailwindcss from "./pages/Tailwindcss";
import Color from "./pages/Color";
import TextsTest from "./pages/TextsTest";

export default function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="*" element={<Tailwindcss />} />
        <Route path="/1" element={<Color />} />
        <Route path="/2" element={<TextsTest />} />
      </Routes>
      <div>
        <Link to="*">Tailwindcss</Link>,
        <Link to="/1">Color</Link>
        ,<Link to="/2">TextsTest</Link>
      </div>
    </BrowserRouter>
  );
}
