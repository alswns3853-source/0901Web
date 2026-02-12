import { useEffect, useState } from "react";
import { Link, useNavigate, useParams } from "react-router-dom";
import auth from "../auth";
import dayjs from "dayjs";
export type articleType = {
  id: number;
  userId: string;
  title: string;
  content: string;
  createdAt: string;
  author: string;
};

export default function Article() {
  const navigate = useNavigate();
  const { id } = useParams();
  const [article, setArticle] = useState<articleType | null>(null);

  useEffect(() => {
    init();
  }, []);

  const init = async () => {
    try {
      if (!id) {
        return;
      }
      const response = await auth.get(`/articles/${id}`);
      setArticle(response.data);
    } catch (e) {
      console.log(e);
    }
  };
  const removeArticle = async () => {
    try {
      await auth.delete(`/articles/${id}`);
      navigate("/articles");
    } catch (e) {
      console.log(e);
    }
  };
  return (
    <div className="row">
      <div className="m-0 bg-white col">
        <article>
          <header className="mb-4">
            <h1 className="mb-1 fw-bolder">{article?.title}</h1>
            <div className="mb-2 text-muted fst-italic">
              Posted on{" "}
              {dayjs(article?.createdAt).format("YYYY-MM-DD HH:mm:ss")} By{" "}
              {article?.author}
            </div>
          </header>
          <section className="mb-5">
            <p className="mb-4 fs-5">{article?.content}</p>
          </section>
          {/* <section className="mb-5">
            <p className="mb-4 fs-5" each="image : ${article.images}">
              <img
                src="|@{/file/{fileName}(fileName=${image.uuid})}|"
                alt="${image.fileName}"
                className="img-fluid"
              />
            </p>
          </section> */}
          {id && localStorage.getItem("user_id") === article?.userId && (
            <>
          <Link
            id="modify-btn"
            to={"/edit-article/" + id}
            className="btn btn-primary btn-sm"
          >
            수정
          </Link>
      
          <button
            type="button"
            id="delete-btn"
            className="btn btn-secondary btn-sm"
            onClick={removeArticle}
          >
            삭제
          </button>
          </>
            )
        }
          <Link to="/articles" className="btn btn-secondary btn-sm">
            목록보기
          </Link>
        </article>
      </div>
    </div>
  );
}
