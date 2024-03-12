<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		
		<c:forEach var="boardboard" items="${boardlistlist}">
			<tr>
				<td>${boardboard.seq}</td>
				<td>${boardboard.id}</td>
				<td>${boardboard.subject}</td>
				<td>${boardboard.content}</td>
				<td>${boardboard.regDate}</td>
				<td>${boardboard.checkDate}</td>
				<td>${boardboard.payOption}</td>
				<td>${boardboard.history}</td>
				<td>${boardboard.checkName}</td>
				<td>${boardboard.delegateCheckName}</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>