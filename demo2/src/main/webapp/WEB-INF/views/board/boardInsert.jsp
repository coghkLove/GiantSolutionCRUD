<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<form action="/board/insert" method="post">
  
  <div class="form-group">
    <input type="text" name="memName" placeholder="이름">
  </div>
  
  <div class="form-group">
    <input type="text"  name="memId" placeholder="사용자 ID">
  </div>

  <div class="form-group">
    <input type="text"  name="boardSubject" placeholder="제목">
  </div>
  
  <div class="form-group">
    <textarea name="boardContent" placeholder="내용"></textarea>
  </div>
  
  
  <button type="submit">제출</button>
  
</form>

</body>
</html>
