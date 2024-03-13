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
        $(function() {
            $("#regBtn").click(function() {
                $("#frm").attr({"method": "post", "action": "/board/insert"}).submit();
            });
            
            $("#uptBtn").click(function() {
                $("#frm").attr({"method": "post", "action": "/board/update"}).submit();
            });
        });
    </script>
</head>
<body>
	<form name="frm" id="frm">
		작성자: <input type="text" name="name" id="name" value="${boardview.memName}"><br>
		아이디: <input type="text" name="id" id="id" value="${boardview.memId}"><br>
		제목: <input type="text" name="subject" id="subject"
			value="${boardview.boardSubject}"><br> 내용:<br>
		<textarea rows="10" cols="40" name="content" id="content">${boardview.boardContent}</textarea>
		<br>
		<c:choose>
			<c:when test="${empty boardview}">
				<input type="button" name="regBtn" id="regBtn" value="등록">
			</c:when>
			<c:otherwise>
				<input type="button" name="uptBtn" id="uptBtn" value="수정">
			</c:otherwise>
		</c:choose>
	</form>
</body>
</html>
