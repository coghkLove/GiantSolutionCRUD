<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	$(function() {
		$("#schBtn").click(function(event) {
			event.preventDefault(); // 기본 폼 제출 방지
			$.ajax({
				type : "GET",
				url : "/board/searchList", // 검색 처리를 위한 서버의 URL
				data : $("#searchFrm").serialize(), // 폼 데이터 직렬화
				success : function(data) {
					// 서버로부터 받은 데이터로 테이블 내용 업데이트
					$("#listFrm").html(data);
				},
				error : function(xhr, status, error) {
					alert("An error occurred: " + xhr.status + " " + error);
				}
			});
		});
	});
</script>

</head>
<body>

	<form id="searchFrm" action="/board/list" method="get">
		<select name="searchType">
			<option value="all">선택</option>
			<option value="name">이름</option>
			<option value="title">제목</option>
			<option value="titleContent">제목+내용</option>
		</select> <input type="search" name="search">
		<button type="submit">검색</button>
		<input type="date" name="stDate" id="stDate"> ~ <input
			type="date" name="endDate" id="endDate">
	</form>

	<a href="/board/insert">글쓰기</a>
	<form id="listFrm">
		<table border="1">
			<thead>
				<tr>
					<th>순번</th>
					<th>이름</th>
					<th>아이디</th>
					<th>제목</th>
					<th>내용</th>
					<th>등록 날짜</th>
					<th>수정 날짜</th>
					<th>조회수</th>
					<th>사용 여부</th>
					<th>관리</th>
				</tr>
			</thead>
			<tbody>
				<!-- AJAX를 통해 업데이트 될 검색 결과 -->
				<c:forEach var="boardStudy" items="${boardList}">
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
							<form action="/board/delete/${boardStudy.seq}" method="post">
								<button type="submit">삭제</button>
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div>
			<c:if test="${!empty paginationInfo}">
				<a href="/board/list?curPage=1">처음</a>
				<c:if test="${paginationInfo.prevPage > 1}">
					<a href="/board/list?curPage=${paginationInfo.prevPage}">이전</a>
				</c:if>
				<c:forEach begin="${paginationInfo.blockBegin}"
					end="${paginationInfo.blockEnd}" var="pageNum">
					<a href="/board/list?curPage=${pageNum}">${pageNum}</a>
				</c:forEach>
				<c:if test="${paginationInfo.nextPage < paginationInfo.totalPage}">
					<a href="/board/list?curPage=${paginationInfo.nextPage}">다음</a>
				</c:if>
				<a href="/board/list?curPage=${paginationInfo.totalPage}">마지막</a>
			</c:if>
		</div>
	</form>

</body>
</html>