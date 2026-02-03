import { BrowserRouter, Link, Route, Routes } from "react-router-dom";
import ButtonTest from "./pages/ButtonTest";
import InputTest from "./pages/InputTest";
import ModalTest from "./pages/ModalTest";

export default function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="*" element={<ButtonTest />} />
        <Route path="/1" element={<InputTest />} />
        <Route path="/2" element={<ModalTest />} />
      </Routes>
      <Link to="*">ButtonTest</Link>/<Link to="/1">InputTest</Link>/
      <Link to="/2">ModalTest</Link>/
    </BrowserRouter>
  );
}
