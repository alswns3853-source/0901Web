import { BrowserRouter, Link, Route, Routes } from "react-router-dom";
import Clock from "./pages/Clock";

export default function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="*" element={<Clock />} />
      </Routes>
      <Link to="*">Clock</Link>
    </BrowserRouter>
  );
}
