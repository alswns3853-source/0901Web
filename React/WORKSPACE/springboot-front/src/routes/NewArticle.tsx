// import { Link } from "react-router-dom";

// export default function NewArticle() {
//     return(
//         <body>
//     <div className="row">
//         <div className="col-lg-8">
//             <article>
//                 <input type="hidden" id="article-id" value="${article.id}" />
//                 <header className="mb-4">
//                     <input type="text" className="form-control" placeholder="제목" id="title" value="${article.title}" />
//                 </header>
//                 <section className="mb-5">
//                     <textarea class="form-control h-25" rows="10" placeholder="내용" id="content"
//                               th:text="${article.content}"></textarea>
//                 </section>
//                 <section className="mb-5">
//                     <input type="file" name="files" id="files" className="form-control" multiple />
//                 </section>
//                 <section className="mb-5">
//                     <p className="mb-4 fs-5" each="image : ${article.images}">
//                         <img src="|@{/file/{fileName}(fileName=${image.uuid})}|"
//                              alt="${image.fileName}"
//                              className="img-fluid"
//                              data-src="${image.uuid}"
//                         />
//                     </p>
//                 </section>
             
//                         {/* <!--<button if="${article.id}!=null" type="button" id="modify-btn"
//                                 class="btn btn-primary btn-sm">수정
//                         </button>
//                         <button th:if="${article.id}!=null" type="button" id="modify-btn2"
//                                 class="btn btn-primary btn-sm">axios수정
//                         </button>--> */}
//                         <Link to="${article.id}!=null" type="button" id="modify-btn3"
//                                 className="btn btn-primary btn-sm">수정(파일)
//                         </Link>
               
//                 {/* <!--                    <button if="${article.id}==null" type="button" id="create-btn" class="btn btn-primary btn-sm">등록</button>-->
//                 <!--                    <button if="${article.id}==null" type="button" id="create-btn2" class="btn btn-primary btn-sm">axios등록</button>--> */}
//                 <Link to="${article.id}==null" type="button" id="create-btn3" className="btn btn-primary btn-sm">
//                     등록(파일)
//                 </Link>
//                 <Link to="${article.id}==null" type="button" id="create-btn" className="btn btn-primary btn-sm">
//                     등록(파일)
//                 </Link>
//                 <a href="|@{/articles}?${pageRequestDTO.link}|" className="btn btn-secondary btn-sm">목록보기</a>
//             </article>
//         </div>
//     </div>
// </body>
//     )
// }