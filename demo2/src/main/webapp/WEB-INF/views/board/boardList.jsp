<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTP-8">
<title>boardlist</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

</head>
<body>
	<select>
		<option>선택</option>
		<option>작성자</option>
		<option>제목</option>
		<option>제목+내용</option>
	</select>

	<table class="table text-center">
		<tr class="table-primary">
			<th>번호</th>
			<th>이름</th>
			<th>직업코드</th>
			<th>부서코드</th>
			<th>프로젝트코드</th>
			<th>급여</th>
			<th>커미션</th>

		</tr>
		<c:forEach var="board" items="${boardlist}">
			<tr class="table-warning">
				<td>${board.empNo}</td>
				<td>${board.ename}</td>
				<td>${board.job}</td>
				<td>${board.deptNo}</td>
				<td>${board.projectCode}</td>
				<td>${board.sal}</td>
				<td>${board.comm}</td>
			</tr>
		</c:forEach>



	</table>

</body>
</html>