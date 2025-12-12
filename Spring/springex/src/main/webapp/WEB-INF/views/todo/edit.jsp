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
                <div class="card-header">
                    Featured
                </div>
                <div class="card-body">
                    <form name="formObj" action="/todo/edit" method="post">
                    <h5 class="card-title">할 일 수정하기</h5>
                    <div class="input-group mb-3">
                        <span class="input-group-text">TNO</span>
                        <input type="text" name="tno" class="form-control"
                               value="${dto.tno}"/>
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text">Title</span>
                        <input type="text" name="title" class="form-control"
                               value="${dto.title}"/>
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text">DueDate</span>
                        <input type="date" name="dueDate" class="form-control"
                               value="${dto.dueDate}"/>
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text">Writer</span>
                        <input type="text" name="writer" class="form-control"
                               value="${dto.writer}" readonly/>
                    </div>
                    <div class="form-check">
                        <label class="form-check-label">
                            Finished &nbsp;
                        </label>
                        <input class="form-check-input" type="checkbox" name="finished"
                               ${dto.finished?"checked":""} />
                    </div>
                    <div class="my-4">
                        <div class="float-end">
                            <button type="submit" class="btn btn-primary">수정하기</button>
                            <button type="button" class="btn btn-danger">삭제하기</button>
                            <button type="button" class="btn btn-secondary">목록보기</button>
                        </div>
                    </div>
                    </form>
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
    let formObj = document.formObj;

    document.querySelector(".btn-secondary").addEventListener("click", function(){
        self.location = "/todo/list?${pageRequestDTO.link}";
    })
    document.querySelector(".btn-danger").addEventListener("click", function(e){
        e.preventDefault();
        e.stopPropagation();
        formObj.action = "/todo/remove";
        formObj.method = "post";
        formObj.submit();
    })
</script>
</body>
</html>
