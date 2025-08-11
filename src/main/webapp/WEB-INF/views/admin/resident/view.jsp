<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>주민 상세보기</title>
    
    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/vender/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="icon" type="image/x-icon" href="<c:url value='/resources/img/favicon16.ico' />">
        <style>
        .container
         {
            width: 560px;
        }
        .p-5{
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
                            <div class="text-center mb-4">
                                <h1 class="h4 text-gray-900">주민 상세 정보</h1>
                            </div>

                            <!-- 주민 상세 정보 출력 -->
                            <form class="user">
                                <div class="form-group">
                                    <label>주민등록번호</label>
                                    <input type="text" class="form-control form-control-user" value="${member.jumin}" readonly>
                                </div>
                                <div class="form-group">
                                    <label>이름</label>
                                    <input type="text" class="form-control form-control-user" value="${member.name}" readonly>
                                </div>
                                <div class="form-group">
                                    <label>주소</label>
                                    <input type="text" class="form-control form-control-user" value="${member.address}" readonly>
                                </div>
                                <div class="form-group">
                                    <label>전화번호</label>
                                    <input type="text" class="form-control form-control-user" value="${member.phone}" readonly>
                                </div>
                                <div class="form-group">
                                    <label>메일주소</label>
                                    <input type="text" class="form-control form-control-user" value="${member.email}" readonly>
                                </div>

                                <!-- 수정/삭제 버튼 -->
                                <div class="mt-4 d-flex justify-content-between">
                                    <a href="${pageContext.request.contextPath}/admin/resident/update?member_id=${member.member_id}" class="btn btn-warning btn-user">
                                        수정
                                    </a>
									<a href="${pageContext.request.contextPath}/admin/resident/list" class="btn btn-primary btn-user">
                                        리스트로 돌아가기
                                    </a>
                                    
                                    <a href="${pageContext.request.contextPath}/admin/resident/delete?member_id=${member.member_id}"
									   class="btn btn-danger btn-user"
									   onclick="return confirmDelete();">
									   삭제
									</a>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<!-- Bootstrap core JavaScript-->
<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>
    
    <script>
	  function confirmDelete() {
	    return confirm("정말 삭제하시겠습니까?\n[확인]을 누르면 삭제됩니다.");
	  }
	</script>
</body>
</html>