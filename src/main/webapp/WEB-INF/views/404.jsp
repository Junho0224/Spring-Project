<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>404 페이지</title>

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

   <%@ include file="./includes/header.jsp" %>
	
	<div class="container-fluid">

        <!-- 404 Error Text -->
        <div class="text-center">
            <div class="error mx-auto" data-text="404" style="margin-top: 130px;">404</div>
            <p class="lead text-gray-800 mb-3">Page Not Found</p>
            <p class="text-gray-500 mb-2">요청하신 페이지를 찾을 수 없습니다.</p>
            <a href="/admin/dashboard">&larr; Back to Dashboard</a>
        </div>

    </div>
	
    <%@ include file="./includes/footer.jsp" %>
    
    <!-- 여기부터 차트 관련 스크립트들을 추가하면 돼! -->
    <!-- 참고: footer.jsp에 이미 jQuery, Bootstrap, sb-admin-2.min.js 등이 있으므로 여기서는 차트 관련 스크립트만 추가합니다. -->

    <!-- Page level plugins - Chart.js 라이브러리 -->
    <script src="${pageContext.request.contextPath}/resources/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts - 각 차트별 초기화 스크립트 -->
    <script src="${pageContext.request.contextPath}/resources/js/demo/chart-area-demo.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/demo/chart-pie-demo.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/demo/chart-bar-demo.js"></script>
    <!-- 여기까지! -->

</body>
</html>
