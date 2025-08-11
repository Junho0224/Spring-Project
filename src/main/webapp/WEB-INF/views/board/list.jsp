<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>민원사항 리스트</title>

    <!-- Custom fonts -->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,700,900" rel="stylesheet">

    <!-- Custom styles -->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="icon" type="image/x-icon" href="<c:url value='/resources/img/favicon16.ico' />">
</head>

<body>
<%@ include file="../includes/header.jsp" %>

<div class="container-fluid">
    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">민원사항</h1>
    <p class="mb-4">아랏동 주민센터 민원사항.</p>

    <!-- Table -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary d-flex justify-content-between align-items-center">민원 목록
               <!-- 글쓰기 버튼 -->
             <div class="text-right">
                 <a href="${pageContext.request.contextPath}/board/write" class="btn btn-primary btn-sm">
                     <i class="fas fa-pencil-alt"></i> 글쓰기
                 </a>
             </div>
            </h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" style="table-layout: fixed;" id="dataTable" width="100%" cellspacing="0">
                    <colgroup>
                        <col style="width:10%;">
                        <col style="width:20%;">
                        <col style="width:40%;">
                        <col style="width:10%;">
                        <col style="width:10%;">
                        <col style="width:10%;">
                    </colgroup>
                    <thead>
                        <tr>
                            <th class="text-center">글번호</th>
                            <th class="text-center">작성자 주민번호</th>
                            <th class="text-center">제목</th>
                            <th class="text-center">카테고리</th>
                            <th class="text-center">등록일</th>
                            <th class="text-center">처리여부</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="post" items="${list}" varStatus="status">
                            <tr>
                                <td class="text-center">${status.count}</td>
                                <td class="text-center">${post.maskedJumin}</td>
                                <td class="text-center">
                                    <a href="${pageContext.request.contextPath}/board/view?post_id=${post.post_id}">
                                        ${post.title}
                                    </a>
                                </td>
                                <td class="text-center">${post.category}</td>
                                <td class="text-center">
                                    <fmt:formatDate value="${post.created_at}" pattern="yyyy/MM/dd"/> <!-- regdate -> created_at으로 수정! -->
                                </td>
                                <td class="text-center">
                           <c:choose>
                               <c:when test="${post.completed == 1}">처리</c:when>
                               <c:otherwise>미처리</c:otherwise>
                           </c:choose>
                        </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

<%@ include file="../includes/footer.jsp" %>

<!-- DataTables JS -->
<script src="<c:url value='/resources/vendor/datatables/jquery.dataTables.min.js'/>"></script>
<script src="<c:url value='/resources/vendor/datatables/dataTables.bootstrap4.min.js'/>"></script>
<script src="<c:url value='/resources/js/demo/datatables-demo.js'/>"></script>

<!-- 등록/수정/삭제 성공 메시지 표시 스크립트 -->
<script>
    $(document).ready(function() {
        var result = '${result}'; // 컨트롤러에서 전달된 flash attribute 'result' 값
        if (result === 'registerSuccess') {
            alert('게시글이 성공적으로 등록되었습니다!');
        } else if (result === 'updateSuccess') {
            alert('게시글이 성공적으로 수정되었습니다!');
        } else if (result === 'deleteSuccess') {
            alert('게시글이 성공적으로 삭제되었습니다!');
        }
    });
</script>