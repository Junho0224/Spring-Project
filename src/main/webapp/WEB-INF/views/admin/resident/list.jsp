<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>주민 리스트</title>

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
         <h1 class="h3 mb-2 text-gray-800">주민목록</h1>
         <p class="mb-4">아랏동 주민 목록</p>

         <!-- DataTales Example -->
         <div class="card shadow mb-4">
             <div class="card-header py-3 d-flex flex-row justify-content-between align-items-center">
                 <h6 class="m-0 font-weight-bold text-primary">주민 목록</h6>
                <a href="${pageContext.request.contextPath}/admin/resident/register" class="btn btn-primary btn-sm">
                  <span class="icon text-white">
                         <i class="fas fa-pencil-alt"></i>
                     </span>
                     <span class="text">주민 등록</span>
              </a>
          </div>
             <div class="card-body">
                 <div class="table-responsive" style="overflow-x: hidden;">
                     <table class="table table-bordered" style="table-layout: fixed;" id="dataTable" width="100%" cellspacing="0">
                         <colgroup>
                             <col style="width:15%;">
                             <col style="width:10%;">
                             <col style="width:35%; text-align: center;">
                             <col style="width:10%;">
                             <col style="width:15%;">
                             <col style="width:15%;">
                         </colgroup>
                         <thead>
                             <tr>
                             	 <th style="display:none;"></th> <!-- 숨겨진 member_id용 -->
                                 <th class="text-center">주민등록번호</th>
                                 <th class="text-center">이름</th>
                                 <th class="text-center">주소</th>
                                 <th class="text-center">연락처</th>
                                 <th class="text-center">메일주소</th>
                                 <th class="text-center">등록일자</th>
                             </tr>
                         </thead>
                         <tbody>
		                      <c:forEach var="member" items="${memberList}">
								  <tr class="clickable-row" data-href="${pageContext.request.contextPath}/admin/resident/view?member_id=${member.member_id}">
								  	<td style="display: none;">${member.member_id}</td>
								      <td class="text-center">${member.jumin}</td>
								      <td class="text-center">${member.name}</td>
								      <td class="text-center">${member.address}</td>
								      <td class="text-center">${member.phone}</td>
								      <td class="text-center">${member.email}</td>
								      <td class="text-center">
								          <fmt:formatDate value="${member.reg_date}" pattern="yyyy-MM-dd" />
								      </td>
								  </tr>
							  </c:forEach>
                  		</tbody>
                     </table>
                 </div>
             </div>
         </div>

<%@include file="../../includes/footer.jsp"%>
	<script>
	  document.addEventListener("DOMContentLoaded", function () {
	    const rows = document.querySelectorAll(".clickable-row");
	    rows.forEach(row => {
	      row.style.cursor = "pointer"; // 마우스 포인터 변경
	      row.addEventListener("click", () => {
	        const url = row.getAttribute("data-href");
	        if (url) window.location.href = url;
	      });
	    });
	  });
	</script>

    <!-- Page level plugins -->
    <script src="<c:url value='${pageContext.request.contextPath}/resources/vendor/datatables/jquery.dataTables.min.js'></c:url>"></script>
    <script src="<c:url value='${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.js'></c:url>"></script>

    <!-- Page level custom scripts -->
    <script src="<c:url value='${pageContext.request.contextPath}/resources/js/demo/datatables-demo.js'></c:url>"></script>
	