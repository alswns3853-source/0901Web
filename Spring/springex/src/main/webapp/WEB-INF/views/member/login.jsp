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
    <jsp:include page="../todo/header.jsp"/>
    <div class="row content">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    Featured
                </div>
                <div class="card-body">
                    <form action="/member/login" method="post">
                        <div class="input-group mb-3">
                            <span class="input-group-text">ID</span>
                            <input type="text" name="id"
                                   class="form-control" placeholder="아이디"/>
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text">PASSWORD</span>
                            <input type="password" name="pw"
                                   class="form-control" placeholder="비밀번호"/>
                        </div>
                        <div class="my-4">
                            <div class="float-end">
                                <button type="submit" class="btn btn-primary">로그인</button>
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
    <jsp:include page="../todo/footer.jsp"/>
</div>
<!-- 부트스트랩 JavaScript를 CDN방식으로 다운로드 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script>
    const serverValidResult = {};
    <c:forEach items="${errors}" var="error">
        serverValidResult['${error.getField()}'] = '${error.defaultMessage}';
    </c:forEach>
    console.log(serverValidResult);
    if(Object.keys(serverValidResult).length > 0){
        alert("title : " + serverValidResult.title + "\n"
        +"dueDate : " + serverValidResult.dueDate + "\n"
        +"writer : " + serverValidResult.writer + "\n")
    }
</script>
</body>
</html>