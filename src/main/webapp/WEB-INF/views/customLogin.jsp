<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Admin - Login</title>

    <!-- Fonts and styles -->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,700" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="<c:url value='/resources/img/favicon16.ico' />">
</head>

<body class="bg-gradient-primary d-flex align-items-center justify-content-center" style="min-height: 100vh;">

    <div class="card shadow-lg border-0" style="width: 100%; max-width: 400px;">
        <div class="card-body p-5">
            <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">Welcome Admin!</h1>
            </div>
            <form method="post" action="<c:url value='/login' />">
                <div class="form-group">
                    <input type="text" class="form-control form-control-user" name="username"
                           id="exampleInputEmail" placeholder="Enter Admin...">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control form-control-user" name="password"
                           id="exampleInputPassword" placeholder="Password">
                </div>
                <div class="form-group">
                    <div class="custom-control custom-checkbox small">
                        <input type="checkbox" class="custom-control-input" id="customCheck">
                        <label class="custom-control-label" for="customCheck">Remember Me</label>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary btn-user btn-block">Login</button>
            </form>
            <c:if test="${param.error != null}">
             <div class="text-danger text-center mt-2">
                 로그인에 실패했습니다. 아이디 또는 비밀번호를 확인해주세요.
             </div>
         </c:if>
        </div>
    </div>

    <!-- JS -->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>
</body>

</html>