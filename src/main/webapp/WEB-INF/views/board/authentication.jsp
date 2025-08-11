<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="증명서 발급 신청 페이지">
    <meta name="author" content="멋진샌드위치5434">

    <title>증명서 발급 신청</title>

    <!-- Custom fonts for this template (sb-admin-2 템플릿의 폰트) -->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template (sb-admin-2 템플릿의 기본 스타일) -->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
    <!-- DataTables CSS (네가 보여준 예시에 포함되어 있었어) -->
    <link href="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <!-- Bootstrap Icons (네가 보여준 예시에 포함되어 있었어) -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="icon" type="image/x-icon" href="<c:url value='/resources/img/favicon16.ico' />">
</head>

<body id="page-top">
<%@include file="../includes/header.jsp"%>
    <!-- Page Wrapper (sb-admin-2 템플릿의 기본 Wrapper) -->
    <div id="wrapper">

        <%-- 여기에는 보통 네 프로젝트의 사이드바 (includes/sidebar.jsp 같은 것)가 들어갈 수 있습니다. --%>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <%-- 여기에는 보통 네 프로젝트의 헤더/상단바 (includes/topbar.jsp 같은 것)가 들어갈 수 있습니다. --%>

                <!-- Begin Page Content -->
                <div class="container-fluid">
                
                    <!-- Page Heading -->
                    <h1 class="h3 mb-4 text-gray-800">증명서 발급 신청</h1>

                    <!-- Basic Card Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">증명서 발급 정보 입력</h6>
                        </div>
                        <div class="card-body">
                            <%-- 📌 action 속성은 비워두거나, 네 컨트롤러의 실제 POST 매핑 경로로 바꿔주세요!
                                 예: action="${pageContext.request.contextPath}/certificate/submit"
                                 또는 네가 언급한 "/board/authentication"과 관련된 로직이라면 그 경로로 연결해야 합니다. --%>
                            <form method="post" action="">
                                <div class="form-group">
                                    <p class="text-gray-800">신청자 이름</p>
                                    <input type="text" class="form-control" name="userName" placeholder="신청자 이름을 입력해주세요">
                                </div>

                                <div class="form-group">
                                    <p class="text-gray-800">증명서 종류</p>
                                    <select class="form-control" name="certificateType">
                                        <option value="">-- 증명서 종류를 선택하세요 --</option>
                                        <option value="재직증명서">재직증명서</option>
                                        <option value="경력증명서">경력증명서</option>
                                        <option value="건강보험납부확인서">건강보험납부확인서</option>
                                        <option value="학적증명서">학적증명서</option>
                                        <option value="기타">기타</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <p class="text-gray-800">발급 매수</p>
                                    <input type="number" class="form-control" name="quantity" value="1" min="1">
                                </div>

                                <div class="form-group">
                                    <p class="text-gray-800">사용 목적</p>
                                    <textarea class="form-control" rows="5" name="purpose" placeholder="증명서 사용 목적을 상세히 기재해주세요"></textarea>
                                </div>

                                <div class="form-group">
                                    <p class="text-gray-800">주민등록번호 포함 여부</p>
                                    <div class="d-flex flex-row">
                                        <div class="form-check pr-4">
                                            <input class="form-check-input" type="checkbox" name="includeIdNumber" id="includeIdNumber" value="true">
                                            <label class="form-check-label" for="includeIdNumber">
                                                주민등록번호 전체 포함 (미체크시 마스킹 처리)
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="d-flex justify-content-center gap-2 mt-4">
                                    <button type="submit" class="btn btn-primary btn-icon-split mr-2">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-check"></i>
                                        </span>
                                        <span class="text">신청하기</span>
                                    </button>
                                    <a href="${pageContext.request.contextPath}/" class="btn btn-secondary btn-icon-split">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-times"></i>
                                        </span>
                                        <span class="text">취소</span>
                                    </a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

  
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal (예시 템플릿에 포함된 모달) -->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript (sb-admin-2 템플릿의 JS) -->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins (DataTables JS, 네가 보여준 예시에 포함되어 있었어) -->
    <script src="${pageContext.request.contextPath}/resources/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts (DataTables Demo JS, 네가 보여준 예시에 포함되어 있었어) -->
    <%-- 이 파일은 필요에 따라 포함하거나 제외하세요 --%>
    <%-- <script src="${pageContext.request.contextPath}/resources/js/demo/datatables-demo.js"></script> --%>

<%@include file="../includes/footer.jsp"%>