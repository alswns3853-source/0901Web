import { BrowserRouter, Route, Routes } from "react-router-dom";
import "./App.css";
import Login from "./routes/Login";
import Signup from "./routes/Signup";
import NewArticle from "./routes/NewArticle";
import Article from "./routes/Article";
import Layout from "./routes/Layout";
import ArticleList from "./routes/ArticleList";
import Social from "./routes/Social";

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/login" element={<Login />} />
        <Route path="/signup" element={<Signup />} />
        <Route path="/social" element={<Social />} />
        <Route path="/" element={<Layout />}>
        <Route path="/new-article" element={<NewArticle />} />
        <Route path="/edit-article/:id" element={<NewArticle />} />
        <Route path="/article/:id" element={<Article />} />
        <Route path="/articles" element={<ArticleList />} />    
        </Route>
      </Routes>
    </BrowserRouter>
  );
}

export default App;
