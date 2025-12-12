<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!-- 부트스트랩 CSS를 CDN방식으로 다운로드 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<div class="container-fluid">
   <jsp:include page="header.jsp"/>
    <div class="row content">
        <div class="col">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">검색</h5>
                    <form action="/todo/list" method="get">
                        <input type="hidden" name="size" value="${pageRequestDTO.size}">
                        <div class="mb-3">
                            <input type="checkbox" name="finished" ${pageRequestDTO.finished?"checked":""}>완료여부
                        </div>
                        <div class="mb-3">
                            <input type="checkbox" name="types" value="t" ${pageRequestDTO.checkType("t")?"checked":""}>제목
                            <input type="checkbox" name="types" value="w" ${pageRequestDTO.checkType("w")?"checked":""}>작성자
                            <input type="text" name="keyword" class="form-control" value="${pageRequestDTO.keyword}">
                        </div>
                        <div class="input-group mb-3 dueDateDiv">
                            <input type="date" name="from" class="form-control" value="${pageRequestDTO.from}">
                            <input type="date" name="to" class="form-control" value="${pageRequestDTO.to}">
                        </div>
                        <div class="input-group mb-3">
                            <div class="float-end">
                                <button class="btn btn-primary" type="submit">검색</button>
                                <button class="btn btn-info" type="reset">초기화</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="row content">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    Featured
                </div>
                <div class="card-body">
                    <h5 class="card-title">할 일 목록</h5>
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">Tno</th>
                            <th scope="col">Title</th>
                            <th scope="col">Writer</th>
                            <th scope="col">DueDate</th>
                            <th scope="col">Finished</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${responseDTO.dtoList}" var="dto">
                            <tr>
                                <th scope="row">${dto.tno}</th>
                                <td><a href="/todo/read?tno=${dto.tno}&${pageRequestDTO.link}" class="text-decoration-none">
                                        ${dto.title}</a></td>
                                <td>${dto.writer}</td>
                                <td>${dto.dueDate}</td>
                                <td>${dto.finished}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="float-end">
                        <ul class="pagination flex-wrap">
                            <c:if test="${responseDTO.prev}">
                            <li class="page-item">
                                <a class="page-link" data-num="${responseDTO.start-1}">이전</a>
                            </li>
                            </c:if>
                            <c:forEach begin="${responseDTO.start}"
                                       end="${responseDTO.end}"
                                       var="num">
                                <li class="page-item ${responseDTO.page == num?"active":""}">
                                    <a class="page-link" data-num="${num}">${num}</a>
                                </li>
                            </c:forEach>
                            <c:if test="${responseDTO.next}">
                                <li class="page-item">
                                    <a class="page-link" data-num="${responseDTO.end+1}">다음</a>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row content">
        <h1>Content</h1>
    </div>
   <jsp:include page="footer.jsp"/>
</div>
<!-- 부트스트랩 JavaScript를 CDN방식으로 다운로드 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script>
    document.querySelector(".pagination").addEventListener("click", (e)=>{
        e.preventDefault();
        e.stopPropagation();
        // 실제로 클릭한 태그를 target변수에 저장
        const target = e.target;
        // a태그를 누른것이 아니라면 실행 종료
        if(target.tagName !== 'A'){
            return;
        }
        // 페이지 태그에 설정한 페이지 값(data-num) 저장
        const num = target.getAttribute("data-num");
        // 검색에 사용하는 form태그 저장
        const formObj = document.querySelector("form")
        // form태그에 page데이터를 추가
        formObj.innerHTML += `<input type='hidden' name='page' value='\${num}'/>`;
        formObj.submit();
        })
</script>
</body>
</html>
