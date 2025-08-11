<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>게시글 상세</title>

    <!-- Custom fonts -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,700,900" rel="stylesheet">

    <!-- Custom styles -->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="icon" type="image/x-icon" href="<c:url value='/resources/img/favicon16.ico' />">
</head>

<body>
<%@ include file="../includes/header.jsp" %>

   <div class="container-fluid">
       <!-- Page Heading -->
       <h1 class="h3 mb-2 text-gray-800">게시글 상세</h1>
       <p class="mb-4">게시글 내용을 확인하고 수정/삭제할 수 있습니다.</p>
   
       <!-- Basic Card Example -->
       <div class="card shadow mb-4">
           <div class="card-header py-3">
               <h6 class="m-0 font-weight-bold text-primary">게시글 정보</h6>
           </div>
           <div class="card-body">
               <form id="actionForm" action="${pageContext.request.contextPath}/board/update" method="post">
                   <!-- post_id는 숨겨진 필드로 전달하여 수정/삭제 시 사용 -->
                   <input type="hidden" name="post_id" value="${post.post_id}">
   
                   <div class="form-group">
                       <p class="text-gray-800"><strong>글 번호:</strong> ${post.post_id}</p>
                   </div>
                   <div class="form-group">
                       <p class="text-gray-800"><strong>작성자 주민번호:</strong> ${post.jumin}</p>
                       <input type="hidden" name="jumin" value="${post.jumin}"> <!-- 주민번호는 수정 못하게 hidden으로 -->
                   </div>
                   <div class="form-group">
                       <p class="text-gray-800"><strong>제목:</strong></p>
                       <input type="text" class="form-control" name="title" value="${post.title}">
                   </div>
                   <div class="form-group">
                       <p class="text-gray-800"><strong>내용:</strong></p>
                       <textarea class="form-control" rows="8" name="content">${post.content}</textarea>
                   </div>
                   <div class="form-group">
                     <p class="text-gray-800">민원 유형</p>
                  <div class="d-flex flex-row flex-wrap">
                    <c:forEach var="cat" items="${fn:split('행정,서류&세무&교통&불편사항신고&기타', '&')}">
                      <div class="form-check pr-4 mb-2">
                        <input class="form-check-input" type="radio" 
                               name="category" 
                               id="radio_${cat}" 
                               value="${cat}"
                               ${post.category == cat ? "checked" : ""}>
                        <label class="form-check-label" for="radio_${cat}">${cat}</label>
                      </div>
                    </c:forEach>
                  </div>
                 </div>
                   <div class="form-group">
                       <p class="text-gray-800"><strong>등록일:</strong> <fmt:formatDate value="${post.created_at}" pattern="yyyy/MM/dd HH:mm"/></p>
                   </div>
                   <div class="form-group">
                       <p class="text-gray-800"><strong>처리여부:</strong>
                     <div class="d-flex flex-row">
                               <div class="form-check pr-3">
                                   <input class="form-check-input" type="radio" name="completed" id="radio1" value="1"
                                  ${post.completed == 1 ? 'checked' : ''}>
                           <label class="form-check-label" for="radio1">처리</label>
                        </div>
                        <div class="form-check pr-3">
                           <input class="form-check-input" type="radio" name="completed" id="radio2" value="0"
                                  ${post.completed == 0 ? 'checked' : ''}>
                           <label class="form-check-label" for="radio2">미처리</label>
                        </div>
                            </div>
                  </p>
                   </div>
   
                   <div class="d-flex justify-content-center gap-2 mt-4" style="margin-bottom:80px;">
                       <button type="submit" class="btn btn-warning btn-icon-split mr-2" id="modifyBtn">
                           <span class="icon text-white-50"><i class="fas fa-edit"></i></span>
                           <span class="text">수정 완료</span> <!-- 버튼 텍스트 변경 -->
                       </button>
                       <button type="button" class="btn btn-danger btn-icon-split mr-2" id="removeBtn">
                           <span class="icon text-white-50"><i class="fas fa-trash"></i></span>
                           <span class="text">삭제</span>
                       </button>
                       <button type="button" id='addReplyBtn' class='btn btn-primary btn-xs pull-right btn-icon-split' style="margin-right : 8px;">
                             <span class="icon text-white-50"><i class="fas fa-comments"></i></span>
                             <span class="text">New Reply</span>
                       </button>
                       <a href="${pageContext.request.contextPath}/board/list" class="btn btn-secondary btn-icon-split" >
                           <span class="icon text-white-50"><i class="fas fa-list"></i></span>
                           <span class="text">목록</span>
                       </a>
                       
                   </div>
               </form>
               <!-- 댓글 추가 HTML -->
            <div class='row'>
               <div class="col-lg-12">
                  <div class="panel panel-default">
                     <div class="panel-heading">
                        
                     </div>
                     <div class="panel-body">
                        <ul class="chat" style="cursor:pointer;" >
                           <!-- data-rno 속성을 이용하여 -> 수정이나 삭제시 반드시 댓글번호 rno가 필요함 -->
                           <li class="left clearfix" data-rno="12" >
                              <div>
                                 <div class="header">
                                    <strong class="primary-font">user00</strong> 
                                    <small class="pull-right text-muted">2024-02-05</small>
                                 </div>
                              </div>
                           </li>
                        </ul>
                     </div>
                     <div class="panel-footer"></div>
                  </div>
               </div>
            </div>
            <!-- /댓글 추가 HTML -->
           </div>
       </div>
   </div>

<!-- 새 댓글 Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
               &times;
            </button>
            <h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
         </div>
         <div class="modal-body">
            <div class="form-group">
               <label>Reply</label>
               <input class="form-control" id='replyContent' name='reply' value=''>
            </div>
            <div class="form-group">
               <label>Replyer</label>
               <input class="form-control" name='admin_name' value='${loginAdmin.admin_name }'>
            </div>
            <!-- closest()에 의해 div 가려짐 -->
            <div class="form-group">
               <label>Reply Date</label>
               <input class="form-control" name='replyDate' value='2018-01-01 13:13'>
            </div>

         </div>
         <div class="modal-footer">
            <button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
            <button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
            <button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
            <button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
         </div>
      </div>
   </div>
</div>
<!-- /새 댓글 Modal -->

<%@ include file="../includes/footer.jsp" %>

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
<!-- Custom scripts for all pages-->
<script src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>
<!-- 댓글 스크립트 -->
<script type="text/javascript" src="/resources/js/reply.js"></script>
<script>
   var post_id = ${post.post_id};
   
$(document).ready(function() {
    $("#addReplyBtn").on("click", function(e) {
        e.preventDefault(); // 이벤트 전파 막기
        // 모달 표시 코드
        $(".modal").modal("show");
    });
});

$(document).ready(function() {
    var actionForm = $("#actionForm"); // 폼 선택

    // 삭제 버튼 클릭 시
    $("#removeBtn").on("click", function(e) {
        e.preventDefault(); // 기본 submit 동작 방지
        if(confirm("정말 이 게시글을 삭제하시겠습니까?")) { // 삭제 확인 메시지
            actionForm.attr("action", "${pageContext.request.contextPath}/board/remove"); // action을 remove로 변경
            actionForm.attr("method", "post"); // method를 post로 변경 (필요시)
            actionForm.submit(); // 폼 제출
        }
    });

    var result = '${result}'; // 컨트롤러에서 전달된 flash attribute 'result' 값
    if (result === 'deleteSuccess') {
        alert('게시글이 성공적으로 삭제되었습니다!');
    }
});
</script>


<!-- ajax관련 스크립트 -->


<script type="text/javascript">
   

   $(document).ready(function(){
      var admin_nameValue = '${admin.admin_name}';
      var replyUL = $(".chat");
      console.log(admin_nameValue);
      console.log(replyUL);
// showList 호출
   // 댓글목록의 페이지번호 1 = 로딩시 자동 함수 호출
   // 페이지를 1로 설정하여 첫번째 페이지의 댓글 목록을 가져옴
      showList(1);

// 댓글페이지 화면처리함수
      function showList(page) {
         console.log("show list " + page);
         var postId = new URLSearchParams(window.location.search).get('post_id');
         console.log("post_id: " + postId); // 디버깅용
    // 모듈함수 목록 불러오기
         replyService.getList(
            {
               post_id: postId,
               admin_name : admin_nameValue,
               page : page || 1
            },
            function(replyCnt, list) { // (추가)파라미터 replyCnt 
               /* (추가 코드) */
               console.log("replyCnt: "+ replyCnt );
                console.log("list: " + list);
                console.log(list);
                
                // ❗페이징 영역 초기화 (남아있던 거 지우기)
                replyPageFooter.html("");
             
    /* 여기에서 -1값은 특별한 용도로 사용됨 
       = showList 함수 내에서 이 값이 사용될 때는 마지막 페이지를 나타내는것으로 처리됨
       = 댓글이 추가된 후 마지막 페이지를 보여주고 싶을때, -1 이라는 값이 사용됨 
         -> 이때는 마지막 페이지를 계산하고 해당 페이지를 보여주기 위해 다시 함수를 호출하게됨 */      
                if(page == -1){
                    pageNum = Math.ceil(replyCnt/10.0);
                    showList(pageNum);
                    return;
               }             
                /* 기존 코드 유지 */
               var str = "";
               if (list == null || list.length == 0) { // null처리 = 댓글이 없는경우
                  replyUL.html(""); // .chat에 빈 문자열
                  return;
               }
               // 댓글 있으면 반복문으로 해당글에 댓글 출력
               for (var i = 0, len = list.length || 0; i < len; i++) {
              str += "<div class='card shadow mb-2 p-2' style='border-left: 4px solid #2e55c7;' data-rno='" + list[i].rno + "'>";
              str += "  <div class='card-body py-2'>";
              str += "    <div class='d-flex justify-content-between align-items-center'>";
              str += "      <div class='font-weight-bold' style='color:#2e55c7;'><i class='fas fa-user-circle'></i> " + list[i].admin_name + "</div>";
              str += "      <div class='text-xs text-gray-500'>" + replyService.displayTime(list[i].replyDate) + "</div>";
              str += "    </div>";
              str += "    <div class='mt-2 text-gray-800 small'>" + list[i].reply + "</div>";
              str += "  </div>";
              str += "</div>";
            }
            replyUL.html(str);         
               // showReplyPage() 호출
               showReplyPage(replyCnt);               
               
            });
      } // end of showList


      var pageNum = 1; // 현재 페이지 번호 | 초깃값 1
       var replyPageFooter = $(".panel-footer"); // 페이지 번호표시 DOM객체,일반적으로 페이지 아래 footer에 해당
       
          function showReplyPage(replyCnt){
             // 댓글 없을 시 페이징버튼 표시 안함
             if (replyCnt == 0) {
                   replyPageFooter.html("");  // 페이징 버튼 지움
                   return;  // 더 이상 처리 안 함
               }
               
              // 현재 페이지 그룹의 마지막 페이지 번호 = 페이지 그룹은 10페이지씩 묶어서 보여주기 때문에 아래 로직처럼 계산
             var endNum = Math.ceil(pageNum / 10.0) * 10; 
              // 페이지 그룹의 첫 번째 페이지 번호를 나타냄. 마지막 페이지 번호에서 9를 빼서 계산
             var startNum = endNum - 9; 
               // 이전 페이지로 이동하는 링크를 표시할지 여부를 결정 
               // = 첫 번째 페이지 그룹이 아닐 때만 이전 페이지로 이동하는 링크를 표시
             var prev = startNum != 1;
               // 다음 페이지로 이동하는 링크를 표시할지 여부를 결정 
               // = 전체 댓글 수를 기준으로 페이지 번호를 계산하여, 마지막 페이지 그룹이 아닐 때만 다음 페이지로 이동하는 링크를 표시
             var next = false;
               // 댓글번호가 페이지그룹의 마지막페이지번호*10 보다 작으면
            if(endNum * 10 >= replyCnt){
               // 페이지그룹의 마지막페이지번호로 설정
               endNum = Math.ceil(replyCnt/10.0);
            }
            // 댓글번호가 페이지그룹의 마지막페이지번호*10 보다 작으면
            if(endNum * 10 < replyCnt){
               // 링크 표시
               next = true;
            }
            // 페이지 번호를 HTML로 렌더링하여 저장 = replyPageFooter 요소에 str을 할당하여 페이지 번호를 렌더링
            var str = "<ul class='pagination justify-content-center'>";
            
            if(prev){
              str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
            }
            
            for(var i = startNum ; i <= endNum; i++){
              
              var active = pageNum == i? "active":"";
              
              str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
            }
            
            if(next){
              str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
            }
            
            str += "</ul></div>";
            
            console.log(str);
            
            replyPageFooter.html(str);
       }
   /* 페이징 처리 끝 */
   
      replyPageFooter.on("click","li a", function(e){
         e.preventDefault();
         console.log("page click");
         
         var targetPageNum = $(this).attr("href");  // 클릭한 페이지 번호
         console.log("targetPageNum: " + targetPageNum);
         
         pageNum = targetPageNum;   // pageNum 변수에 클릭한 페이지 번호를 저장
         
         showList(pageNum);  // 클릭한 페이지의 댓글 목록을 보여주는 함수를 호출
      });
      
      //댓글 작성 버튼을 클릭했을 때 모달 창이 나타나는 코드
       var modal = $(".modal");   // 모달 창 선택
       var modalInputReply = modal.find("input[name='reply']"); // 댓글 입력 필드 선택
       var modalInputAdmin_name = modal.find("input[name='admin_name']"); // 작성자 입력 필드 선택
       var modalInputReplyDate = modal.find("input[name='replyDate']");  // 작성일 입력 필드 선택
       
       var modalModBtn = $("#modalModBtn");   // 수정 버튼 선택
       var modalRemoveBtn = $("#modalRemoveBtn");   // 삭제 버튼 선택
       var modalRegisterBtn = $("#modalRegisterBtn");   // 등록 버튼 선택
       
       /* $("#modalCloseBtn").on("click", function(e){
          modal.modal('hide');
       }); */
       
      // 댓글 작성 버튼 클릭 시 실행될 코드
       $("#addReplyBtn").on("click", function(e){
         modal.find("#replyContent").val("");  // 모달 내의 입력 필드 초기화
         modalInputReplyDate.closest("div").hide();   // 댓글 작성일 숨김
         modal.find("button[id !='modalCloseBtn']").hide();  // 모달 내의 버튼 숨김
         
         modalRegisterBtn.show();  // 등록 버튼 표시
         
         $(".modal").modal("show");  // 모달 창 표시
       }); // end addReplyBtn

      // 댓글등록 = (브라우저) a. 댓글 작성하고 버튼 클릭 b.경고창으로 success가 나와야 함 
      // 댓글 등록 버튼 클릭 시 실행될 코드
      $("#modalRegisterBtn").on("click", function(e){
        
        var reply = {
          post_id: post_id,  // 게시글 번호
          reply: modalInputReply.val(),  // 댓글 내용
          admin_name: modalInputAdmin_name.val()  // 사용자 이름
        };
        
        // 여기서 username이 비어있는지 확인
        if(!reply.admin_name || reply.admin_name.trim() === "") {
          alert("사용자 이름을 입력해주세요!");
          return;
        }
        
        // AJAX 호출로 서버에 데이터 전송
        replyService.add(reply, function(result){
          modal.find("input").val("");
          modal.modal("hide");
          
          // 댓글 목록 갱신
          showList(1);
        });
      });
       
   
       $(".chat").on("click", ".card", function(e){ // 이벤트 위임
          var rno = $(this).closest("[data-rno]").data("rno"); // 댓글의 번호(rno)를 추출 = data() 사용
               
          // 댓글 조회 요청, 모듈패턴의 replyService.get() 함수를 호출하여 해당 댓글의 정보를 서버로 가져옴
          replyService.get(rno, function(reply){
                 // 댓글 정보 표시
                 modalInputReply.val(reply.reply);  // 댓글내용
                 modalInputAdmin_name.val(reply.admin_name); // 작성자
                 // 작성일 = 변경 못하도록 readonly 사용
                 modalInputReplyDate.val(replyService.displayTime( reply.replyDate)).attr("readonly","readonly");
                 modal.data("rno", reply.rno); // 모달에 현재 조회된 댓글의 번호(rno)를 저장 = data() 사용
                 // 다른 버튼들 숨김 = modalCloseBtn 제외
                 modal.find("button[id !='modalCloseBtn']").hide();
                 // 조회된 댓글은 수정(Modify)과 삭제(Delete) 버튼 보이기 = 상단 구조에 코딩되어 있음
                 modalModBtn.show(); // 수정버튼 표시
                 modalRemoveBtn.show();  // 삭제버튼 표시
                 // 모달창 
                 $(".modal").modal("show");          
             });
       });
   
      modalModBtn.on("click", function(e){
         var reply = {rno:modal.data("rno"), reply: modalInputReply.val()};
         // 모듈패턴 update 사용
         replyService.update(reply, function(result){
            alert(result); // 경고창
            modal.modal("hide"); // 사용후 모달창 가리기
            
            showList(pageNum); //현재 페이지의 댓글 목록 다시 로드
            
         });      
      }); //end modalModBtn
      
      /* 댓글 내용 삭제 */   
      modalRemoveBtn.on("click", function (e){
         var rno = modal.data("rno"); // data()사용하여 rno 할당
         // 모듈패턴 remove 사용
         replyService.remove(rno, function(result){
            alert(result); // 경고창
            modal.modal("hide"); // 사용후 모달창 가리기
            showList(pageNum); //현재 페이지의 댓글 목록 다시 로드
   

         });  
      }); //end modalRemoveBtn
      
/* (마무리작업) Close 버튼 클릭시 모달창 닫기 */  
      $('#modalCloseBtn').on('click', function() {      
          $('#myModal').modal('hide');
      });
      
   
   }); // end of jQuery
</script>
</body>
</html>