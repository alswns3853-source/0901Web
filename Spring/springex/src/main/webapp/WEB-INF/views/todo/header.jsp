<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 25. 12. 10.
  Time: 오후 12:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
    <div class="col">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="/">Home</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                    <div class="navbar-nav">
                        <a class="nav-link active" aria-current="page" href="/todo/list">할 일 목록</a>
                        <c:if test="${loginData == null}">
                        <a class="nav-link" href="/member/login">로그인</a>
                        <a class="nav-link" href="/member/join">회원가입</a>
                        </c:if>
                        <c:if test="${loginData != null}">
                            <a class="nav-link" href="/member/logout">로그아웃</a>
                        </c:if>
                        <a class="nav-link disabled">Disabled</a>
                    </div>
                </div>
            </div>
        </nav>
    </div>
</div>
