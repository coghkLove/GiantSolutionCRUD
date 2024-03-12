<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>체크박스</title>
</head>
<body>

	<div>

	<div id = "chkDiv">
		<input type = "checkbox" name = "all" id = "all" ><label for="all">전체</label>
		<input type = "button" name = "btn" id = "btn" value = "버튼">
	</div>
	<div id = "checkBox">
		<input type = "checkbox" name = "chk" id = "chk1" value = "체크1"  class = "aa" >체크1
		<input type = "checkbox" name = "chk" id = "chk2" value = "체크2">체크2
		<input type = "checkbox" name = "chk" id = "chk3" value = "체크3">체크3
		<input type = "checkbox" name = "chk" id = "chk4" value = "체크4">체크4
		<input type = "checkbox" name = "chk" id = "chk5" value = "체크5">체크5
		<input type = "checkbox" name = "chk" id = "chk6" value = "체크6">체크6
		<input type = "checkbox" name = "chk" id = "chk7" value = "체크7">체크7
		<input type = "checkbox" name = "chk" id = "chk8" value = "체크8">체크8
		<input type = "checkbox" name = "chk" id = "chk9" value = "체크9">체크9
	</div>
	<div id = "txtDv"></div>
	</div>
	
	
	<script>
        //체크박스 누를시 글자 출력
		document.getElementById('btn').addEventListener('click', function() {
		    var query = 'input[name="chk"]:checked';
		  //input의 name이 chk인 것들중에 내가 체크(선택한것)
		    var select = document.querySelectorAll(query);
		  //document.querySelectorAll는 주어진 CSS 선택자에 
		  //일치하는 문서의 모든 요소를 NodeList 객체로 반환하는 메소드
		
		    var result = '';
		  //빈문자열을 result에 저장
		    select.forEach((selectList) => {
		        result += selectList.value + ', ';
		    });
		  //의에 var select라는 이름의 리스트(배열)에 있는 각각의 요소를
		  //하나씩 꺼내서 중괄호 { ... } 안에 있는 코드를 실행 
		
		    document.getElementById('txtDv').innerText = result;
		  //'txtDv'라는 id를 가진 HTML 요소의 텍스트를 체크박스에서 선택한 값으로 설정 
		  //즉, 체크박스에서 선택한 값을 웹 페이지에 출력하는 역할
		});


        //전체체크 하기 박스
        document.getElementById('all').addEventListener('change', function() {
        //all'이라는 ID를 가진 HTML 요소에 'change' 이벤트 리스너를 추가하는 역할
        //'change' 이벤트는 체크박스나 라디오 버튼 등의 선택 상태가 변경될 때 발생
        //'all' 체크박스의 선택 상태가 변경될 때마다 익명 함수가 호출
        var checkboxes = document.querySelectorAll('input[name="chk"]');
        //'chk'라는 이름을 가진 모든 <input> 요소를 선택하여 'checkboxes' 변수에 할당
        //querySelectorAll 메서드는 주어진 CSS 선택자에 일치하는 문서의 모든 요소를 NodeList 객체로 반환
        // 따라서 'checkboxes' 변수는 선택한 체크박스 요소들의 리스트를 가지게됨
        checkboxes.forEach((chk) => {
        // 'checkboxes' 리스트의 각 요소에 대해 익명 함수를 실행함 'chk'는 현재 처리 중인 체크박스 요소를 가리킴
            chk.checked = this.checked;
        //현재 처리 중인 체크박스의 체크 상태를 'all' 체크박스의 체크 상태와 동일하게 설정
        //'this'는 이벤트 리스너가 연결된 'all' 체크박스를 가리킴
        // 'this.checked'는 'all' 체크박스의 체크 상태를 나타냄
            });
        });
        $('#all').on('change',function(){
        	var
        })
        
        
        
/*         document.getElementById('btn').addEventListener('click', function(){
        	var checkcheck = document.querySelectorAll('input[name=\'chk\']:checked');
        	if(checkcheck.length  < 4){
        		alert('4개 이상 선택하세요');
        	}
        }); */
        //위에 코드를 제이쿼리로 바꿈
        $('#btn').on('click', function(){
            var checkcheck = $('input[name="chk"]:checked');
            if(checkcheck.length <4){
               alert('4개이상 선택하세요');
               }
        });





	</script>

	

</body>
</html>