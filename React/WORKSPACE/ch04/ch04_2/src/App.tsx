import { BrowserRouter, Link, Route, Routes } from "react-router-dom";
import Callback from "./pages/Callback";
import HighOrderCallback from "./pages/HighOrderCallback";
import Memo from "./pages/Memo";
import UseOrCreateTest from "./pages/UseOrCreateTest";

export default function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="*" element={<Callback />} />
        <Route path="/1" element={<HighOrderCallback />} />
        <Route path="/2" element={<Memo />} />
        <Route path="/3" element={<UseOrCreateTest />} />
      </Routes>
      <Link to="*">Callback</Link>/<Link to="/1">HighOrderCallback</Link>/
      <Link to="/2">Memo</Link>/<Link to="/3">UseOrCreateTest</Link>
    </BrowserRouter>
  );
}
