<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 작성 및 수정</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>

			/* 글 작성 */
        $(function() {
            $("#regBtn").click(function() {
                $("#frm").attr({"method": "post", "action": "/board/insert"}).submit();
            });
            
            
            /*글 수정  */
            $("#uptBtn").click(function() {
                $("#frm").attr({"method": "post", "action": "/board/update"}).submit();
            });
        });
        
        
       		 /* 상세페이지 삭제 */
        $(document).ready(function() {
            $('#deleteBtn').click(function() {
                if (confirm('정말 삭제하시겠습니까?')) {
                    var seq = $(this).data('seq'); 
                    
                    $.ajax({
                        url: '/board/delete/' + seq, 
                        type: 'POST',
                        success: function(response) {
                          
                            alert('게시글이 삭제되었습니다.');
                            window.location.href = '/board/list'; 
                        },
                        error: function(error) {
                  
                            alert('삭제에 실패했습니다.');
                        }
                    });
                }
            });
        });
    </script>
</head>
<body>
	<form name="frm" id="frm">
		작성자: <input type="text" name="memName" id="name" value="${boardview.memName}"><br>
		
		아이디: <input type="text" name="memId" id="id" value="${boardview.memId}"><br>

		제목: <input type="text" name="boardSubject" id="subject"
			value="${boardview.boardSubject}"><br> 
			
		내용:<br>
		<textarea rows="10" cols="40" name="boardContent" id="content">${boardview.boardContent}</textarea><br>
		
		사진첨부 : <input type="file" name="file" id="file"><br> 
		
		
		<c:choose> 
		
			<c:when test="${empty boardview}"> <!--boardview 객체가 비어있거나 존재하지 않는 경우 등록 버튼을 보여짐  -->
				<input type="button" name="regBtn" id="regBtn" value="등록">
			</c:when> 
			
			<c:otherwise> <!--기존의 글을 수정하는 상황일 때 수정버튼과 삭제 버튼을 보여줌  -->
				<input type="button" name="uptBtn" id="uptBtn" value="수정">
				<button type="button" id="deleteBtn" data-seq="${boardview.seq}">삭제</button>
			</c:otherwise>
			
		</c:choose>
		
		
	</form>
</body>
</html>
