<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>민원 대시보드</title>
  <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
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
<%@ include file="./includes/header.jsp" %>

<div class="container-fluid">
  <div class="row mb-3">
    <div class="col-md-4 mb-2">
      <div class="card border-left-primary shadow h-100 p-2">
        <div class="card-body py-1">
          <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">총 민원 접수</div>
          <div class="h6 mb-0 font-weight-bold text-gray-800">42</div>
        </div>
      </div>
    </div>
    <div class="col-md-4 mb-2">
      <div class="card border-left-warning shadow h-100 p-2">
        <div class="card-body py-1">
          <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">처리 대기</div>
          <div class="h6 mb-0 font-weight-bold text-gray-800">3</div>
        </div>
      </div>
    </div>
    <div class="col-md-4 mb-2">
      <div class="card border-left-success shadow h-100 p-2">
        <div class="card-body py-1">
          <div class="text-xs font-weight-bold text-success text-uppercase mb-1">처리 완료</div>
          <div class="h6 mb-0 font-weight-bold text-gray-800">39</div>
        </div>
      </div>
    </div>
  </div>

  <div class="row">
    <div class="col-md-6">
      <div class="section-box">
        <div class="section-title">처리 현황</div>
        <div class="chart-container" div style="display: flex; justify-content: center; align-items: center; height: 250px;">
          <canvas id="myPieChart"></canvas>
        </div>
        <div class="d-flex justify-content-around mt-3">
          <div>접수중 <span class="text-primary">1건</span></div>
          <div>처리중 <span class="text-warning">0건</span></div>
          <div>처리완료 <span class="text-success">12건</span></div>
        </div>
      </div>

      <div class="section-box">
        <div class="section-title">최근 접수된 민원</div>
        <table class="table table-sm table-bordered text-center">
          <thead class="small">
            <tr><th>제목</th><th>작성자</th><th>상태</th><th>등록일</th></tr>
          </thead>
          <tbody>
            <tr><td>도로 파손 신고</td><td>홍길동</td><td>접수중</td><td>2025-07-10</td></tr>
            <tr><td>소음 민원 접수</td><td>김민지</td><td>처리중</td><td>2025-07-08</td></tr>
            <tr><td>불법 주정차 신고</td><td>박철수</td><td>처리완료</td><td>2025-07-06</td></tr>
            <tr><td>가로등 고장 신고</td><td>이수정</td><td>접수중</td><td>2025-07-05</td></tr>
            <tr><td>쓰레기 무단투기 제보</td><td>최현우</td><td>처리완료</td><td>2025-07-04</td></tr>
            <tr><td>소방도로 불법주차</td><td>윤서연</td><td>처리중</td><td>2025-07-03</td></tr>
          </tbody>
        </table>
      </div>
    </div>

    <div class="col-md-6">
      <div class="section-box">
        <div class="section-title">유형별 민원 건수</div>
        <div class="d-flex flex-wrap gap-2">
          <div class="stat-box">행정,서류 <span>3건</span></div>
          <div class="stat-box">세무 <span>1건</span></div>
          <div class="stat-box">교통 <span>6건</span></div>
          <div class="stat-box">불편사항신고 <span>1건</span></div>
          <div class="stat-box">기타 <span>2건</span></div>
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
          <li class="list-group-item d-flex justify-content-between align-items-center">
            <span>무더위 쉼터 운영 안내</span>
            <span class="text-muted">2025-07-15</span>
          </li>
          <li class="list-group-item d-flex justify-content-between align-items-center">
            <span>주민등록증 발급 지연 안내</span>
            <span class="text-muted">2025-07-12</span>
          </li>
          <li class="list-group-item d-flex justify-content-between align-items-center">
            <span>도로공사로 인한 통행제한 안내</span>
            <span class="text-muted">2025-07-08</span>
          </li>
          <li class="list-group-item d-flex justify-content-between align-items-center">
            <span>폭염 대비 행동 요령 안내</span>
            <span class="text-muted">2025-07-05</span>
          </li>
          <li class="list-group-item d-flex justify-content-between align-items-center">
            <span>장마철 침수 위험 지역 안내</span>
            <span class="text-muted">2025-07-01</span>
          </li>
        </ul>
      </div>
    </div>
  </div>
</div>

<script>
  new Chart(document.getElementById("myPieChart"), {
    type: 'doughnut',
    data: {
      labels: ["행정,서류", "세무", "교통", "불편사항", "기타"],
      datasets: [{
        data: [3, 1, 6, 1, 2],
        backgroundColor: ["#ff6b6b", "#4e73df", "#f6c23e", "#1cc88a", "#a7a9be"]
      }]
    },
    options: {
      responsive: true,
      plugins: {
        legend: {
          position: 'right',
          labels: {
            font: { size: 10 }
          }
        }
      }
    }
  });
</script>

<%@ include file="./includes/footer.jsp" %>
</body>
</html>
