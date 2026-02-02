import "./App.css";
import { BrowserRouter, Link, Route, Routes } from "react-router-dom";
import AvatarTest from "./pages/AvatarTest";
import BackgroundTest from "./pages/BackgroundTest";
import DisplayNoneTest from "./pages/DisplayNoneTest";
import DisplayTest from "./pages/DisplayTest";
import DivTest from "./pages/DivTest";
import HeightTest from "./pages/HeightTest";
import ImageTest from "./pages/ImageTest";
import MarginTest from "./pages/MarginTest";
import OverlayTest from "./pages/OverlayTest";
import PaddingTest from "./pages/PaddingTest";
import PositionTest from "./pages/PositionTest";
import ViewportTest from "./pages/ViewportTest";

export default function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="*" element={<AvatarTest />} />
        <Route path="/1" element={<BackgroundTest />} />
        <Route path="/2" element={<DisplayNoneTest />} />
        <Route path="/3" element={<DisplayTest />} />
        <Route path="/4" element={<DivTest />} />
        <Route path="/5" element={<HeightTest />} />
        <Route path="/6" element={<ImageTest />} />
        <Route path="/7" element={<MarginTest />} />
        <Route path="/8" element={<OverlayTest />} />
        <Route path="/9" element={<PaddingTest />} />
        <Route path="/10" element={<PositionTest />} />
        <Route path="/11" element={<ViewportTest />} />
      </Routes>
      <div>
        <Link to="*">AvatarTest</Link>,<Link to="/1">BackgroundTest</Link>,
        <Link to="/2">DisplayNoneTest</Link>,<Link to="/3">DisplayTest</Link>,
        <Link to="/4">DivTest</Link>,<Link to="/5">HeightTest</Link>,
        <Link to="/6">ImageTest</Link>,<Link to="/7">MarginTest</Link>,
        <Link to="/8">OverlayTest</Link>,<Link to="/9">PaddingTest</Link>,
        <Link to="/10">PositionTest</Link>,<Link to="/11">ViewportTest</Link>
      </div>
    </BrowserRouter>
  );
}
