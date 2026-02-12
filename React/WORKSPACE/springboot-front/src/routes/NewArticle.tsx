import auth from "../auth";
import { useEffect, useState, type ChangeEvent } from "react";
import { Link, useNavigate, useParams } from "react-router-dom";

export type articleType = {
  userId: string;
  title: string;
  content: string;
};
export default function NewArticle() {
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
  const newArticle = async () => {
    try {
      const articleData = {
        title: article?.title,
        content: article?.content,
      };
      const resp = await auth.post("/articles", articleData);
      console.log(resp.data);
      navigate("/article/" + resp.data.id);
    } catch (e) {
      console.log(e);
    }
  };
  const editArticle = async () => {
    try {
      const articleData = {
        title: article?.title,
        content: article?.content,
      };
      const resp = await auth.put(`/articles/${id}`, articleData);
      console.log(resp.data);
      navigate("/article/" + resp.data.id);
    } catch (e) {
      console.log(e);
    }
  };
  const onChangeArticle = (
    e: ChangeEvent<HTMLInputElement | HTMLTextAreaElement>,
  ) => {
    const data = e.target.value;
    setArticle({ ...article, [e.target.id]: data } as articleType);
  };
  return (
    <div className="bg-white row">
      <div className="col-lg-8">
        <article>
          <input type="hidden" id="article-id" value={id} />
          <header className="mb-4">
            <input
              type="text"
              className="form-control"
              placeholder="제목"
              id="title"
              value={article?.title || ""}
              onChange={onChangeArticle}
            />
          </header>
          <section className="mb-5">
            <textarea
              className="form-control h-25"
              rows={10}
              placeholder="내용"
              id="content"
              value={article?.content || ""}
              onChange={onChangeArticle}
            />
          </section>
          {/* <section className="mb-5">
            <input
              type="file"
              name="files"
              id="files"
              className="form-control"
              multiple
            />
          </section>
          <section className="mb-5">
            <p className="mb-4 fs-5" each="image : ${article.images}">
              <img
                src="|@{/file/{fileName}(fileName=${image.uuid})}|"
                alt="${image.fileName}"
                className="img-fluid"
                th:data-src="${image.uuid}"
              />
            </p>
          </section> */}
          {id && localStorage.getItem("user_id") === article?.userId && (
            <button
              type="button"
              id="modify-btn3"
              className="btn btn-primary btn-sm"
              onClick={editArticle}
            >
              수정(JWT)
            </button>
          )}
          {!id && (
            <button
              type="button"
              id="create-btn-jwt"
              className="btn btn-primary btn-sm"
              onClick={newArticle}
            >
              등록(JWT)
            </button>
          )}
          <Link
            to="/articles?${pageRequestDTO.link}"
            className="btn btn-secondary btn-sm"
          >
            목록보기
          </Link>
        </article>
      </div>
    </div>
  );
}
