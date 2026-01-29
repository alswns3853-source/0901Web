import { Route, Routes } from "react-router-dom";
import NoMatch from "./NoMatch";
import Home from "./Home";
import Board from "./Board";

export default function RouterSetup() {
  return (
    <Routes>
      <Route path="*" element={<NoMatch />} />
      <Route path="/" element={<Home />} />
      <Route path="/welcome" element={<Home title="Welcome to our site" />} />
      <Route path="/board/:boardid" element={<Board />} />
    </Routes>
  );
}
