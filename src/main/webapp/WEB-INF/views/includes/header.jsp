<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" pageEncoding="UTF-8" %>
<!-- 시큐리티 적용 -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!doctype html>
<html>
   <head>
      <meta charset="utf-8">
       <meta http-equiv="X-UA-Compatible" content="IE=edge">
       <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
       <meta name="description" content="">
       <meta name="author" content="">
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
             <!-- Custom fonts for this template -->
       <link href="<c:url value='resources/vendor/fontawesome-free/css/all.min.css' />" rel="stylesheet" type="text/css">
       <link
           href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
           rel="stylesheet">
      <!-- 부트스트랩 css -->
      <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sb-admin-2.css">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css">
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
     <link rel="icon" type="image/x-icon" href="<c:url value='/resources/img/favicon16.ico' />">
   </head>

<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/">
                <img src="${pageContext.request.contextPath}/resources/img/아랏동화이트.png" width="40" height="40">
                <div class="sidebar-brand-text mx-3">아랏동 주민센터</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="/">
                    <i class="bi bi-bar-chart-line"></i>
                    <span>대쉬보드</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link" href="/admin/resident/list">
                    <i class="bi bi-person"></i>
                    <span>주민 관리</span>
                </a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="/404" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>민원 처리</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">민원 서비스 : </h6>
                        <a class="collapse-item" href="/board/write">민원 접수</a>
                        <a class="collapse-item" href="/board/112">생활 불편 신고</a>
                        <a class="collapse-item" href="/404">복지 지원 신청</a>
                        <a class="collapse-item" href="/board/authentication">증명서 발급</a>
                        <a class="collapse-item" href="/board/list">문의 및 상담</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link" href="/admin/notice/list">
                    <i class="bi bi-file-earmark-text"></i>
                    <span>공지사항</span>
                </a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="/report">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>통계 리포트</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->
        
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
        
           <!-- Main Content -->
            <div id="content">

        <!-- Topbar Navbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow container-fluid">
                    
                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Search -->
                    <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">
                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="/404" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>

                        <!-- Nav Item - Alerts -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="/404" id="alertsDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-bell fa-fw"></i>
                                <!-- Counter - Alerts -->
                                <span class="badge badge-danger badge-counter">3+</span>
                            </a>
                            <!-- Dropdown - Alerts -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="alertsDropdown">
                                <h6 class="dropdown-header">
                                    알림
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="/404">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-primary">
                                            <i class="fas fa-file-alt text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">2025년 7월 12일</div>
                                        <span class="font-weight-bold">[공지] 여름철 폭염 대비 행동요령 안내</span>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="/404">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-success">
                                            <i class="fas fa-check-circle text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">2025년 7월 7일</div>
                                        [복지] 독거노인 건강 방문 서비스가 신청되었습니다.
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="/404">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-warning">
                                            <i class="fas fa-exclamation-triangle text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">2025년 7월 2일</div>
                                        [시설] 주민센터 냉방기 점검이 7/6(토)에 진행됩니다.
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="/404">모든 알림 보기</a>
                            </div>
                        </li>

                        <!-- Nav Item - Messages -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="/404" id="messagesDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-envelope fa-fw"></i>
                                <!-- Counter - Messages -->
                                <span class="badge badge-danger badge-counter">7</span>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="messagesDropdown">
                                <h6 class="dropdown-header">
                                    메세지
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="/404">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="<c:url value='${pageContext.request.contextPath}/resources/img/undraw_profile_1.svg' />"
                                            alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div class="font-weight-bold">
                                        <div class="text-truncate">[복지과] 이번 주 자료 제출 마감은 금요일입니다.</div>
                                        <div class="small text-gray-500">박혜지 팀장 · 30분 전</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="/404">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="<c:url value='${pageContext.request.contextPath}/resources/img/undraw_profile_2.svg' />"
                                            alt="...">
                                        <div class="status-indicator"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">[총무과] 다음 회의는 7월 15일 오전 10시에 진행됩니다.</div>
                                        <div class="small text-gray-500">윤준호 과장 · 1시간 전</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="/404">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="<c:url value='${pageContext.request.contextPath}/resources/img/undraw_profile_3.svg' />"
                                            alt="...">
                                        <div class="status-indicator bg-warning"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">[민원과] 민원 처리 건수가 이번 달 목표치를 초과했습니다.</div>
                                        <div class="small text-gray-500">이정현 주무관 · 2시간 전</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="/404">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="<c:url value='${pageContext.request.contextPath}/resources/img/undraw_profile_3.svg' />"
                                            alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">[민원과] 6월 민원 접수 건 통계 요청드립니다.</div>
                                        <div class="small text-gray-500">이정현 주무관 · 5시간 전</div>
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="/404">Read More Messages</a>
                            </div>
                        </li>

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="/404" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">${loginAdmin.admin_name }</span>
                                <img class="img-profile rounded-circle"
                                    src="<c:url value='${pageContext.request.contextPath}/resources/img/undraw_profile_1.svg' />">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="/404">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    프로필
                                </a>
                                <a class="dropdown-item" href="/404">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    설정
                                </a>
                                <a class="dropdown-item" href="/404">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    활동 기록
                                </a>
                                <div class="dropdown-divider"></div>
                                <form class="dropdown-item" method="post" action="/logout">
                                   <button type="submit" style="border: none; background: none;">
                                       <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                       로그아웃
                                   </button>
                                </form>
                            </div>
                        </li>

                    </ul>
                </nav>
                <!-- End of Topbar -->