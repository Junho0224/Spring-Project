<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>공지사항 상세</title>

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
</head>
<body>
   <%@include file="../../includes/header.jsp"%>
   <div class="container-fluid">

   <!-- Basic Card Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-4">
            <h6 class="m-0 font-weight-bold text-primary">공지사항 상세</h6>
        </div>
        <div class="card-body">
            <form class="pl-3">
                <div class="form-group border-bottom-secondary pt-2">
                    <p>[
                    	<c:choose>
						    <c:when test="${notice.important == 1}">중요</c:when>
						    <c:otherwise>일반</c:otherwise>
						</c:choose>
                    ]</p>
                    <h3 class="text-gray-800 py-1">${notice.title }</h3>
                    <div class="d-flex justify-content-between">
	                    <p class="pb-1">${notice.created_at }</p>
	                    <p class="pb-1">작성자 : ${notice.admin_name }</p>
                    </div>
                </div>
                <div class="form-group pt-4">
                    <p>
                        ${notice.content }
                    </p>
                </div>
                <div class="d-flex justify-content-center gap-2 mt-5">
                    <a href="/admin/notice/update?notice_id=${notice.notice_id }" class="btn btn-success btn-icon-split mr-2">
                        <span class="icon text-white-50">
                            <i class="fas fa-check"></i>
                        </span>
                        <span class="text">공지사항 수정</span>
                    </a>
                    <a href="/admin/notice/delete?notice_id=${notice.notice_id }" class="btn btn-danger btn-icon-split mr-2">
                        <span class="icon text-white-50">
                            <i class="fas fa-trash"></i>
                        </span>
                        <span class="text">공지사항 삭제</span>
                    </a>
                    <a href="/admin/notice/list" class="btn btn-secondary btn-icon-split" >
                        <span class="icon text-white-50"><i class="fas fa-list"></i></span>
                        <span class="text">목록</span>
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>

<%@include file="../../includes/footer.jsp"%>

    <!-- Page level plugins -->
    <script src="<c:url value='/resources/vendor/datatables/jquery.dataTables.min.js'></c:url>"></script>
    <script src="<c:url value='/resources/vendor/datatables/dataTables.bootstrap4.min.js'></c:url>"></script>

    <!-- Page level custom scripts -->
    <script src="<c:url value='/resources/js/demo/datatables-demo.js'></c:url>"></script>