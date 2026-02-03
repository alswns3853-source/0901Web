import DirectionTest from "./pages/DirectionTest";
import WrapTest from "./pages/WrapTest";
import MinMaxTest from "./pages/MinMaxTest";
import JustifyCenterTest from "./pages/JustifyCenterTest";
import AlignTest from "./pages/AlignTest";
import UserContainer from "./pages/UserContainer";
import CardContainer from "./pages/CardContainer";
import { BrowserRouter, Link, Route, Routes } from "react-router-dom";

export default function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="*" element={<CardContainer />} />
        <Route path="/1" element={<AlignTest />} />
        <Route path="/2" element={<JustifyCenterTest />} />
        <Route path="/3" element={<MinMaxTest />} />
        <Route path="/4" element={<WrapTest />} />
        <Route path="/5" element={<DirectionTest />} />
        <Route path="/6" element={<UserContainer />} />
      </Routes>
      <div>
        <Link to="*">CardContainer</Link>/<Link to="/1">AlignTest</Link>/
        <Link to="/2">JustifyCenterTest</Link>/<Link to="/3">MinMaxTest</Link>/
        <Link to="/4">WrapTest</Link>/<Link to="/5">DirectionTest</Link>/
        <Link to="/6">UserContainer</Link>
      </div>
    </BrowserRouter>
  );
}
