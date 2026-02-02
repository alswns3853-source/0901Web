import "./App.css";
import { BrowserRouter, Link, Route, Routes } from "react-router-dom";
import TextsTest from "./pages/TextsTest";
import Color from "./pages/Color";
import Tailwindcss from "./pages/Tailwindcss";

export default function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="*" element={<TextsTest />} />
        <Route path="/1" element={<Color />} />
        <Route path="/2" element={<Tailwindcss />} />
      </Routes>
      <div>
        <Link to="*">TextsTest</Link>,<Link to="/1">Color</Link>,
        <Link to="/2">Tailwindcss</Link>
      </div>
    </BrowserRouter>
  );
}
