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

    <title>공지사항 리스트</title>

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
        <!-- Page Heading -->
         <h1 class="h3 mb-2 text-gray-800">공지사항</h1>
         <p class="mb-4">아랏동 주민센터 공지사항을 확인하세요.</p>

         <!-- DataTales Example -->
         <div class="card shadow mb-4">
             <div class="card-header py-3 d-flex flex-row justify-content-between align-items-center">
                 <h6 class="m-0 font-weight-bold text-primary">공지 목록</h6>
                 <form action="/admin/notice/write" method="get" style="display:inline;">
				    <input type="hidden" name="admin_name" value="${loginAdmin.admin_name }">
				    <button type="submit" class="btn btn-primary btn-sm">
				        <span class="icon text-white">
				            <i class="fas fa-pencil-alt"></i>새 공지사항 등록
				        </span>
				    </button>
				</form>
             </div>
             <div class="card-body">
                 <div class="table-responsive" style="overflow-x: hidden;">
                     <table class="table table-bordered" style="table-layout: fixed;" id="dataTable" width="100%" cellspacing="0">
                         <colgroup>
                             <col style="width:10%;">
                             <col style="width:10%;">
                             <col style="width:50%; text-align: center;">
                             <col style="width:10%;">
                             <col style="width:20%;">
                         </colgroup>
                         <thead>
                             <tr>
                                 <th class="text-center">공지ID</th>
                                 <th class="text-center">작성한 관리자</th>
                                 <th class="text-center">제목</th>
                                 <th class="text-center">중요공지여부</th>
                                 <th class="text-center">등록일</th>
                             </tr>
                         </thead>
                         <!-- <tfoot>
                             <tr>
                                 <th style="width:10%;">공지ID</th>
                                 <th style="width:20%;">작성한 관리자</th>
                                 <th style="width:40%;">제목</th>
                                 <th style="width:20%;">중요공지여부</th>
                                 <th style="width:10%;">등록일</th>
                             </tr>
                         </tfoot> -->
                         <tbody>
                         	<c:forEach items="${noticeList}" var="notice" varStatus="status">
							    <tr>
							        <td class="text-center">${status.count}</td>
							        <td class="text-center">${notice.admin_name}</td>
							        <td class="text-center"><a href="/admin/notice/view?id=${notice.notice_id }">${notice.title}</a></td>
							        <td class="text-center">
							            <c:choose>
										    <c:when test="${notice.important == 1}">중요</c:when>
										    <c:otherwise>일반</c:otherwise>
										</c:choose>
							        </td>
							        <td class="text-center">${notice.created_at}</td>
							    </tr>
							</c:forEach>
							
                         </tbody>
                     </table>
                 </div>
             </div>
         </div>

<%@include file="../../includes/footer.jsp"%>

    <!-- Page level plugins -->
    <script src="<c:url value='${pageContext.request.contextPath}/resources/vendor/datatables/jquery.dataTables.min.js'></c:url>"></script>
    <script src="<c:url value='${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.js'></c:url>"></script>

    <!-- Page level custom scripts -->
    <script src="<c:url value='${pageContext.request.contextPath}/resources/js/demo/datatables-demo.js'></c:url>"></script>
