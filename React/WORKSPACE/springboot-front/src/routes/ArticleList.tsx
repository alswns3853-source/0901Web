import { useEffect, useRef, useState } from "react";
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
  const [articleList, setArticleList] = useState({});
  useEffect(() => {
    init();
  }, []);
  const init = async () => {
    try {
      const response = await auth.get(`/articleList`);
      console.log(response.data);
      setArticleList(response.data);
    } catch (e) {
      console.log(e);
    }
  };
  const logout = () => {
    localStorage.removeItem("access_token");
    navigate("/articles");
  };
  const pageClick = async (e) => {
    const num = e.target.getAttribute("data-num");
    try {
      const response = await auth.get(
        `/articleList?page=${num}&${articleList.pageRequestDTO?.link}`
      );
      console.log(response.data);
      setArticleList(response.data);
    } catch (e) {
      console.log(e);
    }
  };
  const typeRef = useRef(null);
  const keywordRef = useRef(null);
  const searchClick = async () => {
    try {
      const response = await auth.get(
        `/articleList?page=1&size=10&types=${typeRef.current.value}&keyword=${keywordRef.current.value}`
      );
      console.log(response.data);
      setArticleList(response.data);
    } catch (e) {
      console.log(e);
    }
  };
  
  return (
    <div className="container bg-white">
      {localStorage.getItem("access_token") && (
        <>
          <button
            type="button"
            className="mb-3 btn btn-secondary btn-sm"
            onClick={logout}
          >
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
      <form>
        <input
          type="hidden"
          name="size"
          defaultValue={articleList.pageRequestDTO?.size}
        />
        <div className="mb-3">
          <select name="types"  ref={typeRef}  defaultValue={articleList.pageRequestDTO?.types}>
            <option value="t">제목</option>
            <option value="c">내용</option>
            <option value="tc">제목+내용</option>
          </select>
          <input
            type="text"
            name="keyword"
            ref={keywordRef}
            defaultValue={articleList.pageRequestDTO?.keyword}
          />
          <input type="button" value="검색" onClick={searchClick} />
        </div>
      </form>
      {articleList.dtoList?.map((item) => (
        <div className="row-6" key={item.id}>
          <div className="card">
            <div className="card-header">{item.id}</div>
            <div className="card-body">
              <h5 className="card-title">{item.title}</h5>
              <p className="card-text">{item.content}</p>
              <Link to={"/article/" + item.id} className="btn btn-primary">
                보러가기
              </Link>
            </div>
          </div>
          <br />
        </div>
      ))}
      <div className="float-end">
        <ul className="flex-wrap pagination">
          {articleList?.prev && (
            <li className="page-item">
              <a
                className="page-link"
                data-num={articleList.start - 1}
                onClick={pageClick}
              >
                이전
              </a>
            </li>
          )}
          {(() => {
            const result = [];
            for (let num = articleList.start; num <= articleList.end; num++) {
              result.push(
                <li
                  key={num}
                  className={
                    "page-item " + num === articleList.page ? "active" : ""
                  }
                >
                  <a className="page-link" data-num={num} onClick={pageClick}>
                    {num}
                  </a>
                </li>,
              );
            }
            return result;
          })()}
          {articleList.next && (
            <li className="page-item">
              <a
                className="page-link"
                data-num={articleList.end + 1}
                onClick={pageClick}
              >
                다음
              </a>
            </li>
          )}
        </ul>
      </div>
    </div>
  );
}
