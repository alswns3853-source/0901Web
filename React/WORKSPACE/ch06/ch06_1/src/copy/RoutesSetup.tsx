import { Route, Routes } from "react-router-dom";
import NoMatch from "../routes/NoMatch";


export default function RoutesSetup() {
  return (
    <Routes>
      <Route path="*" element={<NoMatch />} />
    </Routes>
  );
}
