<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>공지사항 수정</title>

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
            width: 75%;
            margin: 0 auto;
        }
        .notice_form {
            width: 100%;
        }
    </style>
</head>    
<body class="bg-gradient-primary">
    <div class="container d-flex justify-content-center">

        <div class="card o-hidden border-0 shadow-lg my-5 notice_form">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="p-5">
                    <div class="text-center">
                        <h1 class="h4 text-gray-900 mb-4">공지사항 수정</h1>
                    </div>
                    <form action="/admin/notice/update" method="post" style="display:inline;" class="user">
                    	<input type="hidden" name="notice_id" value="${notice.notice_id}" />
                    	<input type="hidden" name="admin_name" value="${notice.admin_name }">
                        <p class="text-gray-800 text-right">작성자 : ${notice.admin_name }</p>
                        <div class="form-group">
                            <input type="text" class="form-control form-control-user" id="title"
                                value="${notice.title }" name="title" placeholder="제목...">
                        </div>
                        <div class="form-group">
                            <textarea class="form-control" rows="10" 
                                name="content" id="content" placeholder="내용...">${notice.content }</textarea>
                        </div>
                        <div class="form-group">
                            <p class="text-gray-800">중요 공지 여부</p>
                            <div class="d-flex flex-row">
                            	<div class="form-check pr-3">
	                                <input class="form-check-input" type="radio" name="important" id="radio1" value="1"
									       ${notice.important == 1 ? 'checked' : ''}>
									<label class="form-check-label" for="radio1">중요</label>
								</div>
								<div class="form-check pr-3">
									<input class="form-check-input" type="radio" name="important" id="radio2" value="0"
									       ${notice.important == 0 ? 'checked' : ''}>
									<label class="form-check-label" for="radio2">일반</label>
								</div>
                            </div>
                        </div>
                        <div class="mt-4 d-flex justify-content-center">
                            <button type="submit" class="btn btn-success btn-user mr-2">수정 완료</button>
                            <a href="${pageContext.request.contextPath}/admin/notice/view?admin_id=${notice.notice_id}" class="btn btn-secondary btn-user">취소</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
</div>
</body>
</html>