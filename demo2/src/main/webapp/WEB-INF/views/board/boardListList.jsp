<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
		$(function(){
			
			$("#searchType").val('${paramMap.searchType}');
			
			$("#schBtn").click(function(){
				$("#searchFrm").attr("action","list").attr("method","post").submit();
			})
		})
</script>

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
    <input type = "date" name = "stDate" id = "stDate"> ~ <input type = "date" name = "endDate" id = "endDate">
</form>


<a href="/board/insert">글쓰기</a> 
	<table border = "1">
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
				<form action="/board/${boardStudy.seq}" method="post">
					<button type="submit">삭제</button>
				</form>
				</td>
			</tr>
		</c:forEach>
	</table>

	<!-- 페이징 네비게이션 -->
<div>
    <c:if test="${!empty paginationInfo}">
        <a href="/board/listlist?curPage=1">처음</a>
        <c:if test="${paginationInfo.prevPage > 1}">
            <a href="/board/listlist?curPage=${paginationInfo.prevPage}">이전</a>
        </c:if>
        <c:forEach begin="${paginationInfo.blockBegin}" end="${paginationInfo.blockEnd}" var="pageNum">
            <a href="/board/listlist?curPage=${pageNum}">${pageNum}</a>
        </c:forEach>
        <c:if test="${paginationInfo.nextPage <= paginationInfo.totalPage}">
            <a href="/board/listlist?curPage=${paginationInfo.nextPage}">다음</a>
        </c:if>
        <a href="/board/listlist?curPage=${paginationInfo.totalPage}">마지막</a>
    </c:if>
</div>
	

</body>
</html>