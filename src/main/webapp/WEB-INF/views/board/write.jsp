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

    <title>민원사항 등록</title>

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
   <%@include file="../includes/header.jsp"%>
   <div class="container-fluid">
   
   <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800">민원사항 등록</h1>

    <!-- Basic Card Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">민원사항 등록</h6>
        </div>
        <div class="card-body">
           <form method="post" action="${pageContext.request.contextPath}/board/write">
             <div class="form-group">
                 <p class="text-gray-800">작성자 주민번호</p>
                 <input type="text" class="form-control" name="jumin" placeholder="주민번호 입력 (예: 9901011234567)">
             </div>
             <div class="form-group">
                 <p class="text-gray-800">제목</p>
                 <input type="text" class="form-control" name="title" placeholder="제목 입력">
             </div>
             <div class="form-group">
                 <p class="text-gray-800">내용</p>
                 <textarea class="form-control" rows="5" name="content" placeholder="내용 입력"></textarea>
             </div>
             <div class="form-group">
                 <p class="text-gray-800">민원 유형</p>
                 <div class="d-flex flex-row">
                     <div class="form-check pr-4">
                         <input class="form-check-input" type="radio" name="category" id="radio1" value="행정,서류" checked>
                         <label class="form-check-label" for="radio1">
                             행정,서류
                         </label>
                     </div>
                     <div class="form-check pr-4">
                         <input class="form-check-input" type="radio" name="category" id="radio2" value="세무">
                         <label class="form-check-label" for="radio2">
                             세무
                         </label>
                     </div>
                     <div class="form-check pr-4">
                         <input class="form-check-input" type="radio" name="category" id="radio3" value="교통">
                         <label class="form-check-label" for="radio3">
                             교통
                         </label>
                     </div>
                     <div class="form-check pr-4">
                         <input class="form-check-input" type="radio" name="category" id="radio4" value="불편사항신고">
                         <label class="form-check-label" for="radio4">
                             불편사항신고
                         </label>
                     </div>
                     <div class="form-check pr-4">
                         <input class="form-check-input" type="radio" name="category" id="radio5" value="기타">
                         <label class="form-check-label" for="radio5">
                             기타
                         </label>
                     </div>
                 </div>
             </div>
             
             <div class="d-flex justify-content-center gap-2">
                 <button type="submit" class="btn btn-success btn-icon-split mr-2">
                     <span class="icon text-white-50">
                         <i class="fas fa-check"></i>
                     </span>
                     <span class="text">등록하기</span>
                 </button>
                 <a href="${pageContext.request.contextPath}/board/list" class="btn btn-secondary btn-icon-split">
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

<%@include file="../includes/footer.jsp"%>

    <!-- Page level plugins -->
    <script src="<c:url value='/resources/vendor/datatables/jquery.dataTables.min.js'></c:url>"></script>
    <script src="<c:url value='/resources/vendor/datatables/dataTables.bootstrap4.min.js'></c:url>"></script>

    <!-- Page level custom scripts -->
    <script src="<c:url value='/resources/js/demo/datatables-demo.js'></c:url>"></script>