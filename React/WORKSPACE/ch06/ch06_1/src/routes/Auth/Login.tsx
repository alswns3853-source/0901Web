import { Route, Routes } from "react-router-dom";
import NoMatch from "../NoMatch";



export default function Login() {
  return (
    <Routes>
      <Route path="*" element={<NoMatch />} />
    </Routes>
  );
}
