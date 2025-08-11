/*
	JavaScript 준비
	 : JSP 내 댓글에 대한 처리는 하나의 페이지에서 모든 작업이 이루어짐 -> 조금 복잡함
	   => 기존과 달리 JavaScript와 동적으로 만들어지는 HTML로 처리하기 때문에 각단계를 주의해서 작성해야 함

	JavaScript 모듈
	 : 화면에서 사용되는 jQuery는 막강한 기능과 다양한 플러그인을 통해 많은 프로젝트에서 기본으로 사용됨
	 : 특히 Ajax를 이용하는 경우, jQuery 함수를 이용 너무쉽게 처리할 수 있어서 많이 사용
	 : 화면 내 JavaScript처리시 이벤트, DOM처리, Ajax처리 등이 섞여서 유지보수시 어려울 수 있으므로 모듈화 해야 함
	
	#. JavaScript 모듈패턴
	 : 관련있는 함수들을 하나의 모듈처럼 묶음으로 구성하는것을 의미
	   여러 함수들이 메서드화되므로 객체지향 구조에 적합
	   => JavaScript의 클로저를 이용하는 것이 대표적인 방법
	   => js의 클로저(지역변수를 외부에서 접근해서 전역변수처럼 쓰는것)
*/

console.log("Reply Module...");
/* 모듈 구성
   = Java 클래스처럼 JavaScript를 이용해서 메서드를 가지는 객체를 구성
   = JavaScript의 즉시실행 함수 = {} 를 이용해서 객체를 구성
	 => 즉시실행함수 = 함수의 실행결과가 바깥쪽에 선언된 변수에 할당 됨 */
	 
/* 모듈연동 테스트 */
/* var replyService = (function(){
   return {name:"AAAA",};
}) (); */

/* 등록 처리 테스트 = 모듈패턴은 즉시 실행하는 함수 내부에서 필요한 메서드를 구성해서 객체를 구성하는 방식 */
/* var replyService = (function(){
   function add(reply, callback){
      console.log("reply.....");
   }
   return {add: add};
}) (); */

/* 개발자도구 콘솔 탭 = replyService객체의 (내부)에서는 add라는 메서드가 보이는 형태
								  (외부)에서는 replyService.add(객체,콜백)를 전달하는 형태로 호출 가능
								   => Ajax호출은 감춰져있기 때문에 코드를 좀 더 깔끔하게 작성가능
								   => reply.js내의 add함수 = Ajax를 이용해서 POST방식으로 호출하는 코드를 작성 */
/* 등록 *//* 자바스크립트 CRUD 모듈코딩 */
console.log("Reply Module.......");   
var replyService = (function(){
   /* a. Create */
   function add(reply, callback, error){ 
      console.log("Reply Module.........");
      $.ajax({
         type: "post",
         url: "/replies/new",
         data: JSON.stringify(reply),
         contentType: "application/json; charset=utf-8",
         success: function (result, status, xhr) {
           if (callback) {
             callback(result);
           }
         },
         error: function (xhr, status, er) {
           if (error) {
             error(er);
            }
            },
        });
    }
   
    /* bb. Read */
    //댓글 전체테이터 가져오기
    function getList(param, callback, error) {
        var post_id = param.post_id;
	    var page = param.page || 1;
	/* (메서드) jQuery의 getJSON()
    = HTTP get 요청을 통해서 JSON DATA를 가져올 수 있음
     (형식) $.getJSON( url [, data] [, success])
        a. url (필수) : 가져올 JSON 데이터를 포함하는 파일의 URL
        b. data (선택) : 서버에 전송할 추가 데이터를 지정
        c. success (선택) : 요청이 성공한 경우 실행할 함수
           success 함수는 세 개의 매개변수를 받음
           => data(서버에서 가져온 JSON 데이터), status(요청 상태). jqXHR(jQuery XmlHttpRequest 객체)
    AJAX() 메서드와 차이점
       a. ajax() = 모든 유형의 HTTP 요청을 수행할 수 있으며, dataType 속성을 사용하여 요청된 데이터 형식을 지정할 수 있음
       b. getJSON() = JSON 형식으로 응답이 수신될 것으로 예상되므로 dataType을 JSON으로 설정할 필요가 없음
                    => 요청이 성공한 경우 success/error 콜백함수 자동으로 호출 */
		    

    // url , 성공하면 콜백함수
       $.getJSON("/replies/pages/" + post_id + "/" + page + ".json", function (data) {
         if (callback) {
           //callback(data); // 댓글 목록만 가져오는 경우
           callback(data.replyCnt, data.list); //댓글 숫자와 목록을 가져오는 경우
         }
       }).fail(function (xhr, status, err) { // 실패하면
         if (error) {
           error();
         }
      });
   }
   
   /* c. Delete */
   function remove(rno, callback, error) {
       $.ajax({
         type: "delete",
         url: "/replies/" + rno,
         success: function (result, status, xhr) {
           if (callback) {
             callback(result);
           }
         },
         error: function (xhr, status, er) {
           if (error) {
             error(er);
           }
         },
       });
   }
   /* d. Update */
   function update(reply, callback, error) {
       $.ajax({
         type: "put",
         url: "/replies/" + reply.rno,
         data: JSON.stringify(reply),
         contentType: "application/json; charset=utf-8",
         success: function (result2, status, xhr) {
           if (callback) {
             callback(result2);
           }
         },
         error: function (xhr, status, er) {
           if (error) {
             error(er);
           }
         },
       });
   }
   /* e. 하나의 Read */
   function get(rno, callback, error) {
       $.ajax({
         type: "get",
         url: "/replies/" + rno + ".json",
         success: function (result, status, xhr) {
           if (callback) {
             callback(result);
           }
         },
         error: function (xhr, status, er) {
           if (error) {
             error(er);
           }
         },
       });
     }



/* 시간에 대한 처리
	 = xml이나 JSON형태로 데이터를 받을때는 순수하게 숫자로 표현되는 시간값이 나오게 되어있으므로 화면에서는 이를 변환해서 사용한다
	 = 날짜 포맷의 경우 문화권마다 표기순서등이 다르기때문에 화면에서 포맷을 처리하는 방식을 권장함
   최근 웹페이지들은 해당일에 해당하는 데이트는 시:분:초를 보여주고 전날에 등록된 데이터는 년/월/일을 보여주는 경우가 많음 */	 
/* 시간 함수 처리
	 = 주어진 시간을 현재 시간과 비교하여 24시간 이내라면 시:분:초로 그 이상이면 년/월/일로 표시
	 = 이 함수의 목적은 시간값을 받아와서 사람이 읽기쉬운 형태로 변환하여 반환해주는것 */
	// 시간값을 매개변수로 받음 = get.jsp 호출할때 받음 -> 이 시간값은 JS의 Data 객체를 생성	 
   function displayTime(timeValue) { 
      var today = new Date(); // 현재 시간을 나타내는 Date 객체를 생성
      var gap = today.getTime() - timeValue; // 현재 시간과 매개변수로 받은 시간값과의 차이를 계산
      var dateObj = new Date(timeValue); // 매개변수로 받은 시간값을 사용하여 Date 객체를 생성
      var str = "";
      // 현재 시간과의 차이가 하루 이내인지를 확인
      if(gap < (1000 * 60 * 60 * 24)) { // 하루를 밀리초 단위로 계산한 값 => gap이 하루보다 작으면 | 즉 하루 안 지났으면
         // Date 객체에서 시간, 분, 초를 추출
         var hh = dateObj.getHours();
         var mi = dateObj.getMinutes();
         var ss = dateObj.getSeconds();
         // 시간, 분, 초를 각각 2자리로 표시하고 콜론(:)으로 구분하여 문자열로 반환
         return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi, ':', (ss > 9 ? '' : '0') + ss ].join('');
      }else { // 현재 시간과의 차이가 하루 이상인 경우에 실행 = 즉, 하루 지났으면
         // 년,월,일 추출
         var yy = dateObj.getFullYear();
         var mm = dateObj.getMonth() + 1; // getMonth() is zero-based
         var dd = dateObj.getDate();
         // 날짜를 YYYY/MM/DD 형식으로 반환
         return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/', (dd > 9 ? '' : '0') + dd ].join('');
      }
   }
/* 요약
   displayTime 함수 = 입력된 시간값을 사람이 읽기쉬운 형태로 변환하여 반환
   현재 시간과의 차이계산 = 현재 시간과 입력된 시간값과의 차이를 계산
   하루이내인경우 시간을 HH:mm:SS 형식으로 표시
   하루이상인경우 날짜를 YYYY/MM/DD 형식으로 표시
   이 함수는 입력된 시간값이 현재로부터 얼마나 떨어져있는지에 따라 시간이나 날짜로 변환하여 반환 */   

   /* (중요)결괏값 add,getList, remove, update, get, displayTime 으로 리턴 */
   return {
      add: add,
      getList: getList,
      remove: remove,
      update: update,
      get: get,
      displayTime: displayTime,
   };
     
})(); // end of JS즉시실행함수
