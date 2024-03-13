<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table>
		<tr>
			<td>순번</td>
			<td>아이디</td>
			<td>제목</td>
			<td>내용</td>
			<td>등록 날짜</td>
			<td>확인 날짜</td>
			<td>결제 옵션</td>
			<td>이력</td>
			<td>확인자 이름</td>
			<td>대리 확인자 이름</td>
		</tr>

		<c:forEach var="boardStudy" items="${boardlistlist}">
			<tr>
				<td>${boardStudy.seq}</td>
				<td>${boardStudy.memName}</td>
				<td>${boardStudy.memId}</td>
				<td>${boardStudy.boardSubject}</td>
				<td>${boardStudy.boardContent}</td>
				<td>${boardStudy.regDate}</td>
				<td>${boardStudy.uptDate}</td>
				<td>${boardStudy.viewCnt}</td>
				<td>${boardStudy.useYn}</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>