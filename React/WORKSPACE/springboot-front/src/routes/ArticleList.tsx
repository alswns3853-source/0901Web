import { useEffect, useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import auth from "../auth";


export type articleType = {
  id: number;
  userId: string;
  title: string;
  content: string;
};

export default function ArticleList() {
    const navigate = useNavigate();
    const [articleList, setArticleList] = useState<articleType[]>([]);
  useEffect(() => {
    init();
  }, []);
  const init = async () => {
    try {
      const response = await auth.get(`/articles`);
      setArticleList(response.data);
    } catch (e) {
      console.log(e);
    }
  };
  const logout = () => {
    localStorage.removeItem("access_token");
    navigate("/articles");
  };
  return (
    <div className="container bg-white">
      {localStorage.getItem("access_token") && (
        <>
          <button type="button" className="mb-3 btn btn-secondary btn-sm" onClick={logout}>
            로그아웃
          </button>

          <Link to="/new-article" className="mb-3 btn btn-secondary btn-sm">
            글 등록
          </Link>
        </>
      )}
      {!localStorage.getItem("access_token") && (
        <Link className="mb-3 btn btn-secondary btn-sm" to="/login">
          로그인
        </Link>
      )}
      <form action="/articles" method="get">
        <input type="hidden" name="size" value="${pageRequestDTO.size}" />
        <div className="mb-3">
          <select name="types" value="${pageRequestDTO.types}">
            <option value="t">제목</option>
            <option value="c">내용</option>
            <option value="tc">제목+내용</option>
          </select>
          <input type="text" name="keyword" value="${pageRequestDTO.keyword}" />
          <input type="submit" value="검색" />
        </div>
      </form>
      {articleList.map((item)=> (
           <div className="row-6">
        <div className="card">
          <div className="card-header">{item.id}</div>
          <div className="card-body">
            <h5 className="card-title">{item.title}</h5>
            <p className="card-text">{item.content}</p>
            <Link
              to={"/article/"+item.id}
              className="btn btn-primary"
            >
              보러가기
            </Link>
          </div>
        </div>
        <br />
      </div> 
      ))}
     
      {/* <div className="float-end">
        <ul className="flex-wrap pagination" if="${articles.totalElements>0}">
          <li if="${articles.prev}" class="page-item">
            <a className="page-link" th:data-num="${articles.start -1}">
              이전
            </a>
          </li>
          <li
            each="num : ${#numbers.sequence(articles.start,articles.end)}"
            th:className="page-item"
            th:classappend="${num == articles.page} ? 'active'"
          >
            <a className="page-link" th:data-num="${num}">
              [[${num}]]
            </a>
          </li>
          <li if="${articles.next}" class="page-item">
            <a className="page-link" th:data-num="${articles.end+1}">
              다음
            </a>
          </li>
        </ul>
      </div> */}
    </div> 
  );
}
