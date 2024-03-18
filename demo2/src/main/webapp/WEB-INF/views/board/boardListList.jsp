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

	<form action="/board/listlist" method="get">
    <select name="searchType">
        <option value="all">선택</option>
        <option value="name">이름</option>
        <option value="title">제목</option>
        <option value="titleContent">제목+내용</option>
    </select>
    
    <input type="search" name="search">
    <button type="submit">검색</button>
</form>

<a href="/board/insert">글쓰기</a> 
	<table>
		<tr>
			<td>순번</td>
			<td>이름</td>
			<td>아이디</td>
			<td>제목</td>
			<td>내용</td>
			<td>날짜</td>
			<td>날짜</td>
			<td>널</td>
			<td>널</td>
			<td>관리</td>
		</tr>
			

		<c:forEach var="boardStudy" items="${boardlistlist}">
			<tr>
				<td>${boardStudy.seq}</td>
				<td>${boardStudy.memName}</td>
				<td>${boardStudy.memId}</td>
				<td><a href="/board/view/${boardStudy.seq}">${boardStudy.boardSubject}</a></td>
				<td>${boardStudy.boardContent}</td>
				<td>${boardStudy.regDate}</td>
				<td>${boardStudy.uptDate}</td>
				<td>${boardStudy.viewCnt}</td>
				<td>${boardStudy.useYn}</td>
				<td>
				<form action="/board/${boardStudy.seq}" method="post">
					<button type="submit">삭제</button>
				</form>
				</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>