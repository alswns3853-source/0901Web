import { BrowserRouter, Link, Route, Routes } from "react-router-dom";

import BasicForm from "./pages/BasicForm";
import Callback from "./pages/04_2/Callback";
import HighOrderCallback from "./pages/04_2/HighOrderCallback";
import Memo from "./pages/04_2/Memo";
import UseOrCreateTest from "./pages/04_2/UseOrCreateTest";
import Test from "./pages/04_2/Test";
import ObjectState from "./pages/ObjectState";
import WindowResizeTest from "./pages/WindowResizeTest";
import FetchTest from "./pages/FetchTest";
import FileDrop from "./pages/FileDrop";
import ForwardRefTest from "./pages/ForwardRefTest";
import ResponsiveContextTest from "./pages/ResponsiveContextTest";
import { ResponsiveProvider } from "./contexts";

export default function App() {
  return (
    <BrowserRouter>
    <ResponsiveProvider>
      <Routes>
        <Route path="*" element={<Callback />} />
        <Route path="/1" element={<HighOrderCallback />} />
        <Route path="/2" element={<Memo />} />
        <Route path="/3" element={<UseOrCreateTest />} />
        <Route path="/4" element={<Test />} />
        <Route path="/5" element={<BasicForm />} />
        <Route path="/6" element={<ObjectState />} />
        <Route path="/7" element={<WindowResizeTest />} />
        <Route path="/8" element={<FetchTest />} />
        <Route path="/9" element={<FileDrop />} />
        <Route path="/10" element={<ForwardRefTest />} />
        <Route path="/11" element={<ResponsiveContextTest />} />
      </Routes>
      </ResponsiveProvider>
      <p>
        <Link to="/5">BasicForm</Link>/<Link to="/6">ObjectState</Link>/
        <Link to="/7">WindowResizeTest</Link>/<Link to="/8">FetchTest</Link>/
        <Link to="/9">FileDrop</Link>/<Link to="/10">ForwardRefTest</Link>/
        <Link to="/11">ResponsiveContextTest</Link>
      </p>
      <p>
        <Link to="*">Callback</Link>/<Link to="/1">HighOrderCallback</Link>/
        <Link to="/2">Memo</Link>/<Link to="/3">UseOrCreateTest</Link>/
        <Link to="/4">test</Link>
      </p>
    </BrowserRouter>
  );
}
