<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>생활불편신고</title>

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
<%-- 헤더 인클루드: 네 프로젝트의 상단 영역 --%>
<%@include file="../includes/header.jsp"%>

<!-- Page Wrapper (sb-admin-2 템플릿의 기본 Wrapper, header.jsp에 포함되어 있을 가능성 높음) -->
<%-- <div id="wrapper"> --%>
    <%-- 이 주석은 header.jsp 내용에 따라 제거될 수 있습니다. --%>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Begin Page Content -->
            <div class="container-fluid">
            
                <!-- Page Heading -->
                <h1 class="h3 mb-4 text-gray-800">생활불편신고</h1>

                <!-- Basic Card Example -->
                <div class="card shadow mb-4">
                    <%-- 📌 카드 헤더 색상 및 아이콘: 원래의 primary 색상으로 복귀! --%>
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary"><i class="fas fa-exclamation-triangle mr-2"></i> 불편 신고 접수</h6>
                    </div>
                    <div class="card-body">
                        <form method="post" action="">
                            <div class="row">
                                <%-- 📌 신고자 정보 (2/3 + 1/3 비율로 배치) --%>
                                <div class="col-lg-8"> <%-- 큰 화면에서는 8/12 = 2/3 너비 --%>
                                    <div class="form-group">
                                        <p class="text-gray-800 font-weight-bold">신고자 이름 <span class="text-danger">*</span></p>
                                        <input type="text" class="form-control" name="reporterName" placeholder="실명을 입력해주세요" required>
                                    </div>
                                </div>
                                <div class="col-lg-4"> <%-- 큰 화면에서는 4/12 = 1/3 너비 --%>
                                    <div class="form-group">
                                        <p class="text-gray-800">연락처 (선택)</p>
                                        <input type="text" class="form-control" name="contactInfo" placeholder="휴대폰 번호 또는 이메일">
                                    </div>
                                </div>
                            </div>
                            
                            <div class="row">
                                <%-- 📌 불편 유형 (1/2 + 1/2 비율로 배치 가능성) --%>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <p class="text-gray-800 font-weight-bold">불편 유형 <span class="text-danger">*</span></p>
                                        <select class="form-control" name="nuisanceType" required>
                                            <option value="">-- 불편 유형을 선택하세요 --</option>
                                            <option value="소음">소음</option>
                                            <option value="쓰레기_무단투기">쓰레기 무단투기</option>
                                            <option value="불법_주정차">불법 주정차</option>
                                            <option value="공공시설물_파손">공공시설물 파손</option>
                                            <option value="가로등_신호등_고장">가로등/신호등 고장</option>
                                            <option value="기타">기타</option>
                                        </select>
                                    </div>
                                </div>
                                <%-- 📌 발생 장소 (1/2 너비로 옆에 배치) --%>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <p class="text-gray-800 font-weight-bold">발생 장소 <span class="text-danger">*</span></p>
                                        <input type="text" class="form-control" name="location" placeholder="정확한 주소 또는 장소를 입력해주세요" required>
                                    </div>
                                </div>
                            </div>
                            
                            <%-- 📌 상세 내용 (항상 꽉 채워지도록) --%>
                            <div class="form-group">
                                <p class="text-gray-800 font-weight-bold">상세 내용 <span class="text-danger">*</span></p>
                                <textarea class="form-control" rows="6" name="details" placeholder="불편 사항에 대해 상세히 설명해주세요 (발생 일시, 구체적 상황 등)" required></textarea>
                            </div>

                            <%-- 📌 사진/파일 첨부 (별도 섹션 강조 - 배경색 유지) --%>
                            <div class="form-group mb-4 p-3 bg-light rounded">
                                <p class="text-gray-800 font-weight-bold"><i class="fas fa-camera mr-2"></i> 사진/파일 첨부 (선택)</p>
                                <input type="file" class="form-control-file" id="nuisanceFile" name="nuisanceFile">
                                <small class="form-text text-muted">현장 사진, 동영상 등 증빙 자료를 첨부하시면 더 빠른 처리에 도움이 됩니다. (최대 5MB)</small>
                            </div>

                            <%-- 📌 개인정보 수집 및 이용 동의 --%>
                            <div class="form-group mb-4">
                                <p class="text-gray-800 font-weight-bold">개인정보 수집 및 이용 동의</p>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="privacyConsent" id="privacyConsent" value="true" required>
                                    <label class="form-check-label" for="privacyConsent">
                                        개인정보 수집 및 이용에 동의합니다. <span class="text-danger">(필수)</span>
                                    </label>
                                </div>
                            </div>
                            
                            <div class="d-flex justify-content-center gap-2 mt-4">
                                <%-- 📌 신고 버튼 아이콘 변경 (원하는 대로 비행기 아이콘 유지) --%>
                                <button type="submit" class="btn btn-primary btn-icon-split mr-2">
                                    <span class="icon text-white-50">
                                        <i class="fas fa-paper-plane"></i>
                                    </span>
                                    <span class="text">신고 접수</span>
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

        <%-- 푸터 인클루드: 네 프로젝트의 하단 영역 --%>
        <%@include file="../includes/footer.jsp"%>

    </div>
    <!-- End of Content Wrapper -->

<%-- </div> --%>
<%-- 이 주석은 footer.jsp 내용에 따라 제거될 수 있습니다. --%>