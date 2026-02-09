import { Route, Routes } from "react-router-dom";
import Home from "./Home";
import Board from "../pages/Board";
import Card from "./Card";
import Layout from "./Layout";
import NoMatch from "./NoMatch";
import LandingPage from "./LandingPage";
import Signup from "./Auth/Signup";
import Login from "./Auth/Login";
import Logout from "./Auth/Logout";
import RequireAuth from "./Auth/RequireAuth";

export default function RoutesSetup() {
  return (
    <Routes>
      <Route path="/" element={<Layout />}>
        <Route index element={<LandingPage />} />
        <Route path="/welcome" element={<Home title="Welcome to our site" />} />
        <Route
          path="/board"
          element={
            <RequireAuth>
              <Board />
            </RequireAuth>
          }
        />
        <Route path="/board/card/:cardid" element={<Card />} />
        <Route path="*" element={<NoMatch />} />
      </Route>
      <Route path="/signup" element={<Signup />} />
      <Route path="/login" element={<Login />} />
      <Route
        path="/logout"
        element={
          <RequireAuth>
            <Logout />
          </RequireAuth>
        }
      />
      <Route path="*" element={<NoMatch />} />
    </Routes>
  );
}
