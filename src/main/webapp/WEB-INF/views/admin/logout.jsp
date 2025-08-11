<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>로그아웃</title>
   <link rel="icon" type="image/x-icon" href="<c:url value='/resources/img/favicon16.ico' />">
</head>
<body>
   <h1> Logout Page </h1>
<!-- POST 방식으로 처리되기 때문에 CSRF 토큰값을 같이 지정 
   = POST 방식으로 처리되는 로그아웃은 스프링 시큐리티 내부에서 동작함
   = 만일, 로그아웃 시 추가되는 작업을 해야 한다면 LogoutSuccessHandler를 정의해서 처리-->
   <form action="/logout" method="post">
      <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
      <button>로그아웃</button>
   </form>
</body>
</html>