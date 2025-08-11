<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>민원 대시보드</title>
  <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
  <link rel="icon" type="image/x-icon" href="<c:url value='/resources/img/favicon16.ico' />">
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <style>
    .section-box {
      border-radius: 0.75rem;
      background: #fff;
      padding: 1rem;
      box-shadow: 0 0 10px rgba(0,0,0,0.05);
      margin-bottom: 1rem;
    }
    .stat-box {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 0.5rem 1rem;
      border-radius: 0.5rem;
      background-color: #f8f9fc;
      font-size: 0.9rem;
      margin-bottom: 0.5rem;
    }
    .section-title {
      font-weight: bold;
      margin-bottom: 0.75rem;
    }
    .table-sm th, .table-sm td {
      font-size: 0.85rem;
      padding: 0.4rem;
    }
    .chart-container {
      width: 100%;
      height: 250px;
      text-align: center;
    }
    .chart-container canvas {
      display: inline-block;
    }
  </style>
  
</head>
<body id="page-top">
<%@ include file="../includes/header.jsp" %>

<div class="container-fluid">
  <div class="row mb-3">
    <div class="col-md-4 mb-2">
      <div class="card border-left-primary shadow h-100 p-2">
        <div class="card-body py-1">
          <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">총 민원 접수</div>
          <div class="h6 mb-0 font-weight-bold text-gray-800">${dashboard.totalPostCount }</div>
        </div>
      </div>
    </div>
    <div class="col-md-4 mb-2">
      <div class="card border-left-warning shadow h-100 p-2">
        <div class="card-body py-1">
          <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">처리 대기</div>
          <div class="h6 mb-0 font-weight-bold text-gray-800">${dashboard.pendingPostCount }</div>
        </div>
      </div>
    </div>
    <div class="col-md-4 mb-2">
      <div class="card border-left-success shadow h-100 p-2">
        <div class="card-body py-1">
          <div class="text-xs font-weight-bold text-success text-uppercase mb-1">처리 완료</div>
          <div class="h6 mb-0 font-weight-bold text-gray-800">${dashboard.completedPostCount }</div>
        </div>
      </div>
    </div>
  </div>

  <div class="row">
    <div class="col-md-6">
      <div class="section-box">
        <div class="section-title">처리 현황</div>
        <div class="chart-container" style="display: flex; justify-content: center; align-items: center; height: 250px;">
          <canvas id="myPieChart"></canvas>
        </div>
        <div class="d-flex justify-content-around mt-3">
          <div>접수중 <span class="text-primary">${dashboard.totalPostCount }건</span></div>
          <div>처리중 <span class="text-warning">${dashboard.pendingPostCount }건</span></div>
          <div>처리완료 <span class="text-success">${dashboard.completedPostCount }건</span></div>
        </div>
      </div>

      <div class="section-box">
        <div class="section-title">최근 접수된 민원</div>
        <table class="table table-sm table-bordered text-center">
          <thead class="small">
            <tr>
               <th>제목</th>
               <th>작성자 주민번호</th>
               <th>상태</th>
               <th>등록일</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach items="${dashboard.recentPosts }" var="post">
             <tr>
                 <td>${post.title}</td>
                 <td>${post.jumin}</td>
                 <td>
                     <c:choose>
                         <c:when test="${post.completed == 1}">처리완료</c:when>
                         <c:otherwise>처리대기</c:otherwise>
                     </c:choose>
                 </td>
                 <td><fmt:formatDate value="${post.created_at}" pattern="yyyy-MM-dd" /></td>
             </tr>
         </c:forEach>
          </tbody>
        </table>
      </div>
    </div>

    <div class="col-md-6">
      <div class="section-box">
      <div class="section-title">유형별 민원 건수</div>
       <div class="d-flex flex-wrap gap-2">
           <c:forEach var="entry" items="${dashboard.postCountByType}">
               <div class="stat-box">
                   ${entry.key} <span>${entry.value}건</span>
               </div>
           </c:forEach>
       </div>
     </div>

      <div class="section-box">
        <div class="section-title">접수된 QnA</div>
        <div class="d-flex flex-wrap gap-2">
          <div class="stat-box">행정,서류 <span>6건</span></div>
          <div class="stat-box">세무 <span>5건</span></div>
          <div class="stat-box">교통 <span>4건</span></div>
          <div class="stat-box">불편사항신고 <span>4건</span></div>
          <div class="stat-box">기타 <span>1건</span></div>
        </div>
      </div>

      <div class="section-box">
        <div class="section-title">최근 공지사항</div>
        <ul class="list-group list-group-flush small">
          <c:forEach items="${dashboard.recentNotices }" var="notice">
             <li class="list-group-item d-flex justify-content-between align-items-center">
              <span>${notice.title }</span>
              <span class="text-muted">${notice.created_at }</span>
            </li>
          </c:forEach>
        </ul>
      </div>
    </div>
  </div>
</div>

<script>
  // 서버에서 받은 데이터를 기반으로 labels와 data 배열을 동적으로 생성
  // dashboard.postCountByType는 List<Map<String, Object>> 형태로 되어 있음
  // 각 Map은 {key="카테고리명", value=건수} 형태일 것임
  const dynamicLabels = [];
  const dynamicData = [];

  <c:forEach var="entry" items="${dashboard.postCountByType}" varStatus="loop">
    // 각 entry에서 key(카테고리명)와 value(건수)를 가져옴
    dynamicLabels.push("${entry.key}"); // JSP 변수를 JavaScript 문자열로 삽입
    dynamicData.push(${entry.value});   // JSP 변수를 JavaScript 숫자로 삽입
  </c:forEach>

  // Chart.js 초기화 부분
  new Chart(document.getElementById("myPieChart"), {
    type: 'doughnut',
    data: {
      labels: dynamicLabels, // 동적으로 생성된 라벨 사용
      datasets: [{
        data: dynamicData, // 동적으로 생성된 데이터 사용
        backgroundColor: [
          "#ff6b6b", "#4e73df", "#f6c23e", "#1cc88a", "#a7a9be", // 5개 색상만 있어도 돼.
          // 더 많은 색상이 필요하다면 여기 추가. Chart.js는 필요한 만큼만 사용해.
        ]
      }]
    },
    options: {
      responsive: true,
      plugins: {
        legend: { position: 'right' }
      }
    }
  });
</script>



<%@ include file="../includes/footer.jsp" %>
</body>
</html>
