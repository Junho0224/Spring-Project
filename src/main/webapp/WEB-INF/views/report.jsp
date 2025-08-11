<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="주민센터 민원 및 활동 통계 리포트">
    <meta name="author" content="주민센터 데이터 분석팀">

    <title>주민센터 통계 리포트</title>

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
	<link rel="icon" type="image/x-icon" href="<c:url value='/resources/img/favicon16.ico' />">
    <style>
        .report-section {
            margin-bottom: 2.5rem;
            padding-bottom: 1.5rem;
            border-bottom: 1px solid #eaecf4;
        }
        .report-section:last-child {
            border-bottom: none;
        }
        .report-section h3, .report-section h4 {
            color: #4e73df; /* Primary color */
            margin-bottom: 1rem;
        }
        .report-section p {
            line-height: 1.6;
            margin-bottom: 0.8rem;
        }
        .chart-card { /* 대시보드 카드 스타일 유지 */
            border: 1px solid #e3e6f0;
            border-radius: 0.35rem;
            margin-bottom: 1.5rem;
            box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
        }
        .chart-card .card-header {
            padding: 0.75rem 1.25rem;
            margin-bottom: 0;
            background-color: #f8f9fc;
            border-bottom: 1px solid #e3e6f0;
        }
        .chart-card .card-body {
            padding: 1.25rem;
        }
        .chart-area, .chart-bar, .chart-pie {
            height: 320px; /* 차트 높이 고정 */
            position: relative;
        }
    </style>

</head>

<body id="page-top">
    <%@ include file="./includes/header.jsp" %>

    <!-- Page Wrapper -->
    <div id="wrapper">
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- Main Content -->
            <div id="content">
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-4 text-gray-800">주민센터 민원 및 활동 통계 리포트</h1>
                    <p class="mb-4">
                        본 리포트는 2025년 상반기(1월~6월) 주민센터의 주요 운영 현황을 분석하여 서비스 개선 방안을 모색합니다.
                    </p>

                    <!-- Report Section: 개요 -->
                    <div class="report-section">
                        <h3>1. 리포트 개요</h3>
                        <ul class="list-unstyled">
                            <li><strong>제목:</strong> 2025년 상반기 주민센터 민원 및 활동 분석</li>
                            <li><strong>기간:</strong> 2025년 1월 ~ 6월</li>
                            <li><strong>목적:</strong> 상반기 주요 운영 현황 파악 및 서비스 개선 방안 모색</li>
                        </ul>
                    </div>

                    <!-- Report Section: 요약 -->
                    <div class="report-section">
                        <h3>2. 주요 분석 요약</h3>
                        <p>
                            2025년 상반기 민원 접수 건수는 5월에 최고치를 기록했으며, 주민등록 발급은 3월에 가장 활발했습니다.
                            공지사항은 '일반' 카테고리가 높은 비중을 차지하여, 핵심 정보의 가시성 확보가 필요합니다.
                        </p>
                    </div>

                    <!-- Report Section: 상세 통계 분석 -->
                    <div class="report-section">
                        <h3>3. 상세 통계 분석</h3>

                        <!-- 민원 접수 현황 (Area Chart) -->
                        <h4 class="mt-4">3.1. 민원 접수 현황</h4>
                        <p>최근 1년간 월별 민원 접수 건수 추이입니다.</p>
                        <div class="chart-card">
                            <div class="card-header">
                                <h6 class="m-0 font-weight-bold text-primary">월별 민원 접수 건수 (2025년 상반기)</h6>
                            </div>
                            <div class="card-body">
                                <div class="chart-area">
                                    <canvas id="myAreaChart"></canvas>
                                </div>
                                <hr>
                                <p>
                                    **분석**: 5월에 민원 접수 건수가 급증한 후 6월에 소폭 감소했습니다.
                                    **인사이트**: 민원 급증 시기에 대한 예측 및 선제적 대응(인력 보강, FAQ 공지 등)이 필요합니다.
                                </p>
                            </div>
                        </div>

                        <!-- 월별 주민등록 발급 건수 (Bar Chart) -->
                        <h4 class="mt-4">3.2. 월별 주민등록 발급 건수</h4>
                        <p>월별 주민등록 발급 통계입니다.</p>
                        <div class="chart-card">
                            <div class="card-header">
                                <h6 class="m-0 font-weight-bold text-primary">월별 주민등록 발급 건수 (2025년 상반기)</h6>
                            </div>
                            <div class="card-body">
                                <div class="chart-bar">
                                    <canvas id="myBarChart"></canvas>
                                </div>
                                <hr>
                                <p>
                                    **분석**: 3월에 발급 건수가 가장 높았습니다.
                                    **인사이트**: 신학기/이사철 등 특정 시기 수요 집중을 고려하여 서비스 혼잡도 완화 방안을 모색해야 합니다.
                                </p>
                            </div>
                        </div>

                        <!-- 공지사항 카테고리 분포 (Pie Chart) -->
                        <h4 class="mt-4">3.3. 공지사항 카테고리 분포</h4>
                        <p>최근 등록된 공지사항의 카테고리별 비율입니다.</p>
                        <div class="chart-card">
                            <div class="card-header">
                                <h6 class="m-0 font-weight-bold text-primary">공지사항 카테고리 분포 (2025년 상반기)</h6>
                            </div>
                            <div class="card-body">
                                <div class="chart-pie">
                                    <canvas id="myPieChart"></canvas>
                                </div>
                                <hr>
                                <p>
                                    **분석**: '일반' 카테고리가 전체의 50%를 차지하며 가장 높은 비중을 보였습니다.
                                    **인사이트**: 중요 정책이나 재난 관련 정보의 가시성을 높이는 전략(강조 표시, 알림 기능 등)이 필요합니다.
                                </p>
                            </div>
                        </div>
                    </div>

                    <!-- Report Section: 종합 결론 및 제언 -->
                    <div class="report-section">
                        <h3>4. 종합 결론 및 제언</h3>
                        <p>
                            상반기 운영은 안정적이었으나, 데이터 분석을 통해 예측 기반 자원 배분, 맞춤형 정보 제공 강화,
                            지속적인 데이터 모니터링을 통한 서비스 개선이 필요합니다.
                        </p>
                    </div>

                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->
        </div>
        <!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->

    <%@ include file="./includes/footer.jsp" %>

    <!-- Page level plugins - Chart.js 라이브러리 -->
    <script src="${pageContext.request.contextPath}/resources/vendor/chart.js/Chart.min.js"></script>

    <!-- Chart.js를 이용한 차트 그리기 스크립트 -->
    <script>
    // Set new default font family and font color to mimic Bootstrap's default styling
    Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
    Chart.defaults.global.defaultFontColor = '#858796';

    function number_format(number, decimals, dec_point, thousands_sep) {
      // *     example: number_format(1234.56, 2, ',', ' ');
      // *     return: '1 234,56'
      number = (number + '').replace(',', '').replace(' ', '');
      var n = !isFinite(+number) ? 0 : +number,
        prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
        sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
        dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
        s = '',
        toFixedFix = function(n, prec) {
          var k = Math.pow(10, prec);
          return '' + Math.round(n * k) / k;
        };
      s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
      if (s[0].length > 3) {
        s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
      }
      if ((s[1] || '').length < prec) {
        s[1] = s[1] || '';
        s[1] += new Array(prec - s[1].length + 1).join('0');
      }
      return s.join(dec);
    }

    // Area Chart (민원 접수 현황)
    var ctxArea = document.getElementById("myAreaChart");
    var myAreaChart = new Chart(ctxArea, {
      type: 'line',
      data: {
        labels: ["1월", "2월", "3월", "4월", "5월", "6월"],
        datasets: [{
          label: "민원 건수",
          lineTension: 0.3,
          backgroundColor: "rgba(78, 115, 223, 0.05)",
          borderColor: "rgba(78, 115, 223, 1)",
          pointRadius: 3,
          pointBackgroundColor: "rgba(78, 115, 223, 1)",
          pointBorderColor: "rgba(78, 115, 223, 1)",
          pointHoverRadius: 3,
          pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
          pointHoverBorderColor: "rgba(78, 115, 223, 1)",
          pointHitRadius: 10,
          pointBorderWidth: 2,
          data: [120, 115, 130, 145, 180, 155], // 예시 데이터
        }],
      },
      options: {
        maintainAspectRatio: false,
        layout: {
          padding: {
            left: 10,
            right: 25,
            top: 25,
            bottom: 0
          }
        },
        scales: {
          xAxes: [{
            time: {
              unit: 'date'
            },
            gridLines: {
              display: false,
              drawBorder: false
            },
            ticks: {
              maxTicksLimit: 7
            }
          }],
          yAxes: [{
            ticks: {
              min: 0,
              max: 200, // 데이터 최대값에 맞춰 조정
              maxTicksLimit: 5,
              padding: 10,
              callback: function(value, index, values) {
                return number_format(value);
              }
            },
            gridLines: {
              color: "rgb(234, 236, 244)",
              zeroLineColor: "rgb(234, 236, 244)",
              drawBorder: false,
              borderDash: [2],
              zeroLineBorderDash: [2]
            }
          }],
        },
        legend: {
          display: false
        },
        tooltips: {
          backgroundColor: "rgb(255,255,255)",
          bodyFontColor: "#858796",
          titleMarginBottom: 10,
          titleFontColor: '#6e707e',
          titleFontSize: 14,
          borderColor: '#dddfeb',
          borderWidth: 1,
          xPadding: 15,
          yPadding: 15,
          displayColors: false,
          intersect: false,
          mode: 'index',
          caretPadding: 10,
          callbacks: {
            label: function(tooltipItem, chart) {
              var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
              return datasetLabel + ': ' + number_format(tooltipItem.yLabel) + '건';
            }
          }
        }
      }
    });


    // Bar Chart (월별 주민등록 발급 건수)
    var ctxBar = document.getElementById("myBarChart");
    var myBarChart = new Chart(ctxBar, {
      type: 'bar',
      data: {
        labels: ["1월", "2월", "3월", "4월", "5월", "6월"],
        datasets: [{
          label: "발급 건수",
          backgroundColor: "#4e73df",
          hoverBackgroundColor: "#2e59d9",
          borderColor: "#4e73df",
          data: [80, 95, 110, 100, 90, 85], // 예시 데이터
        }],
      },
      options: {
        maintainAspectRatio: false,
        layout: {
          padding: {
            left: 10,
            right: 25,
            top: 25,
            bottom: 0
          }
        },
        scales: {
          xAxes: [{
            time: {
              unit: 'month'
            },
            gridLines: {
              display: false,
              drawBorder: false
            },
            ticks: {
              maxTicksLimit: 6
            },
            maxBarThickness: 25,
          }],
          yAxes: [{
            ticks: {
              min: 0,
              max: 120, // 데이터 최대값에 맞춰 조정
              maxTicksLimit: 5,
              padding: 10,
              callback: function(value, index, values) {
                return number_format(value);
              }
            },
            gridLines: {
              color: "rgb(234, 236, 244)",
              zeroLineColor: "rgb(234, 236, 244)",
              drawBorder: false,
              borderDash: [2],
              zeroLineBorderDash: [2]
            }
          }],
        },
        legend: {
          display: false
        },
        tooltips: {
          titleMarginBottom: 10,
          titleFontColor: '#6e707e',
          titleFontSize: 14,
          backgroundColor: "rgb(255,255,255)",
          bodyFontColor: "#858796",
          borderColor: '#dddfeb',
          borderWidth: 1,
          xPadding: 15,
          yPadding: 15,
          displayColors: false,
          caretPadding: 10,
          callbacks: {
            label: function(tooltipItem, chart) {
              var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
              return datasetLabel + ': ' + number_format(tooltipItem.yLabel) + '건';
            }
          }
        },
      }
    });


    // Pie Chart (공지사항 카테고리 분포)
    var ctxPie = document.getElementById("myPieChart");
    var myPieChart = new Chart(ctxPie, {
      type: 'doughnut', // 파이 차트 중 도넛 형태로 그립니다.
      data: {
        labels: ["일반", "행사", "정책", "재난/안전", "기타"],
        datasets: [{
          data: [40, 15, 10, 8, 7], // 예시 데이터
          backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc', '#f6c23e', '#e74a3b'], // 색상 추가
          hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf', '#dda20a', '#be2617'],
          hoverBorderColor: "rgba(234, 236, 244, 1)",
        }],
      },
      options: {
        maintainAspectRatio: false,
        tooltips: {
          backgroundColor: "rgb(255,255,255)",
          bodyFontColor: "#858796",
          borderColor: '#dddfeb',
          borderWidth: 1,
          xPadding: 15,
          yPadding: 15,
          displayColors: false,
          caretPadding: 10,
          callbacks: {
            label: function(tooltipItem, data) {
                var dataset = data.datasets[tooltipItem.datasetIndex];
                var total = dataset.data.reduce(function(previousValue, currentValue, currentIndex, array) {
                    return previousValue + currentValue;
                });
                var currentValue = dataset.data[tooltipItem.index];
                var percentage = Math.floor(((currentValue/total)*100)+0.5);
                return data.labels[tooltipItem.index] + ': ' + percentage + '% (' + currentValue + '건)';
            }
          }
        },
        legend: {
          display: true, // 범례 표시
          position: 'bottom', // 범례 위치
        },
        cutoutPercentage: 80, // 도넛 차트의 가운데 빈 공간 비율
      },
    });
    </script>

</body>
</html>