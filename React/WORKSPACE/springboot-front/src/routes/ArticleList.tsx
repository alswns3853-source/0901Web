import { Link } from "react-router-dom";

export default function ArticleList(){
    return(
        <body>
    {/* <!-- th:replace="~{ 파일경로 :: fragment에 설정한 이름 }" --> */}
    <div className="container">
        {/* <!-- isAuthenticated() : 로그인한 사용자만 보이도록 설정-->
        <!-- isAnonymous() : 로그인하지 않은 사용자만 보이도록 설정--> */}
        <Link className="mb-3 btn btn-secondary btn-sm"
                to="/new-article"
               >글 등록</Link>
        <Link type="button" className="mb-3 btn btn-secondary btn-sm"
               to="/logout">로그아웃</Link>
        <button authorize="isAnonymous()" type="button" class="btn btn-secondary btn-sm mb-3"
                onclick="location.href='/login'">로그인</button>
        <button authorize="hasRole('ADMIN')" type="button" class="btn btn-danger">관리자만 보이는 버튼</button>
        <button authorize="hasRole('USER')" type="button" class="btn btn-danger">일반 사용자만 보이는 버튼</button>
        <form action="/articles" method="get">
            <input type="hidden" name="size" value="${pageRequestDTO.size}"/>
            <div className="mb-3">
                <select name="types">
                    <option value="t" selected="${pageRequestDTO.types == 't'}">제목</option>
                    <option value="c" selected="${pageRequestDTO.types == 'c'}">내용</option>
                    <option value="tc" selected="${pageRequestDTO.types == 'tc'}">제목+내용</option>
                </select>
                <input type="text" name="keyword" value="${pageRequestDTO.keyword}"/>
                <input type="submit" value="검색"/>
            </div>
        </form>
        <div className="row-6" each="item : ${articles.dtoList}">
            <div className="card">
                <div className="card-header" text="${item.id}"></div>
                <div className="card-body">
                    <h5 className="card-title" ttext="${item.title}"></h5>
                    <p className="card-text" text="${item.content}"></p>
                    <a href="|@{/articles/{id}(id=${item.id})}?${pageRequestDTO.getLink()}|" className="btn btn-primary">보러가기</a>
                </div>
            </div>
            <br>
        </div>
        <div className="float-end">
            <ul className="flex-wrap pagination" if="${articles.totalElements>0}">
                <li if="${articles.prev}" className="page-item">
                    <a className="page-link" th:data-num="${articles.start -1}">이전</a>
                </li>
                <li each="num : ${#numbers.sequence(articles.start,articles.end)}"
                    th:className="page-item" th:classappend="${num == articles.page} ? 'active'">
                    <a className="page-link" th:data-num="${num}">[[${num}]]</a>
                </li>
                <li if="${articles.next}" class="page-item">
                    <a className="page-link" th:data-num="${articles.end+1}">다음</a>
                </li>
            </ul>
        </div>
    </div>
</body>
    )
}