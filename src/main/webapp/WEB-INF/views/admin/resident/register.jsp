<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>주민 등록</title>

    <!-- Custom fonts for this template -->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/vender/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="icon" type="image/x-icon" href="<c:url value='/resources/img/favicon16.ico' />">
    <style>
        .container {
            width: 560px;
        }
        .p-5 {
            width: 498px;
        }
    </style>
</head>
<body class="bg-gradient-primary">
    <div class="container">
        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <div class="row">
                    <div class="col-lg-0 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">아랏동 주민등록</h1>
                            </div>

                            <!-- 폼 시작 -->
                            <form class="user" method="post" action="${pageContext.request.contextPath}/admin/resident/register">
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="jumin" name="jumin" placeholder="주민등록번호" required>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="name" name="name" placeholder="이름" required>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="address" name="address" placeholder="주소">
                                </div>
                                <div class="form-group">
                                    <input type="tel" class="form-control form-control-user" id="phone" name="phone" placeholder="전화번호">
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control form-control-user" id="email" name="email" placeholder="메일주소">
                                </div>
                                <button type="submit" class="btn btn-primary btn-user btn-block">
                                    새 주민 등록하기
                                </button>
                            </form>
                            <!-- 폼 끝 -->

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 자바스크립트 추가 -->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>
</body>
</html>