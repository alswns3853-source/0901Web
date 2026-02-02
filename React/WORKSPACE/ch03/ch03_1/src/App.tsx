import Bootstrap from "./pages/Bootstrap";
import Icon from "./pages/Icon";
import Style from "./pages/Style";
import UsingIcon from "./pages/UsingIcon";
import UsingIconWithCSSClass from "./pages/UsingIconWithCSSClass";
import "./App.css";
import { BrowserRouter, Link, Route, Routes } from "react-router-dom";

export default function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="*" element={<Bootstrap />} />
        <Route path="/1" element={<UsingIconWithCSSClass />} />
        <Route path="/2" element={<UsingIcon />} />
        <Route path="/3" element={<Style />} />
        <Route path="/4" element={<Icon />} />
      </Routes>
      <div>
        <Link to="*">Bootstrap</Link>,<Link to="/1">UsingIconWithCSSClass</Link>
        ,<Link to="/2">UsingIcon</Link>,<Link to="/3">Style</Link>,
        <Link to="/4">Icon</Link>
      </div>
    </BrowserRouter>
  );
}
