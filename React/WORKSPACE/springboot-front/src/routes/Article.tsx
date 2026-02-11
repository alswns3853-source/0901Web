// import { Link } from "react-router-dom";

// export default function ArticleList(){
//     return(
//         <body>
//         <div className="row">
//             <div className="col-lg-8">
//                 <article>
//                     {/* <!--hidden데이터에 PK를 저장--> */}
//                     <input type="hidden" id="article-id" value="${article.id}" />
//                     <header className="mb-4">
//                         <h1 className="mb-1 fw-bolder" text="${article.title}"></h1>
//                         <div className="mb-2 text-muted fst-italic" text="|Posted on ${#temporals.format(article.createdAt, 'yyyy-MM-dd HH:mm')} By ${article.author}|"></div>
//                     </header>
//                     <section className="mb-5">
//                         <p className="mb-4 fs-5" text="${article.content}"></p>
//                     </section>
//                     <section className="mb-5">
//                         <p className="mb-4 fs-5" each="image : ${article.images}">
//                             <img src="|@{/file/{fileName}(fileName=${image.uuid})}|"
//                                  alt="${image.fileName}"
//                                 className="img-fluid"/>
//                         </p>
//                     </section>
                    
//                         <Link id="modify-btn"
//                                 to="/new-article(id=${article.id})}&${pageRequestDTO.link}"
//                                 className="btn btn-primary btn-sm">수정</Link>
//                         <button type="button" id="delete-btn" className="btn btn-secondary btn-sm">삭제</button>
//                         <button type="button" id="axios-delete-btn" className="btn btn-secondary btn-sm">Axios삭제</button>
//                         <button type="button" id="axios-delete-btn2" className="btn btn-secondary btn-sm">Axios삭제2</button>
//                     <Link to="/articles?${pageRequestDTO.link}" className="btn btn-secondary btn-sm">목록보기</Link>
//                 </article>
//             </div>
//         </div>
// </body>
//     )
// }