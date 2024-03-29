<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
$(function() {
    // 검색 버튼 클릭 이벤트
    $("#schBtn").click(function(event) {
        event.preventDefault();
        loadSearchResults($("#searchFrm").serialize());
    });

    // 페이징 링크 클릭 이벤트
    $(document).on("click", ".page-link", function(event) {
        event.preventDefault();
        var query = $(this).attr("href").split('?')[1]; // URL에서 쿼리 스트링 추출
        loadSearchResults(query);
    });

    // 검색 결과 로드 함수
    function loadSearchResults(query) {
        $.ajax({
            type: "GET",
            url: "/board/searchList?" + query,
            success: function(data) {
                console.log("AJAX 요청 성공:", data);
                $("#listFrm").html(data);
            },
            error: function(xhr, status, error) {
                console.error("AJAX 요청 실패:", error);
            }
        });
    }
});
</script>

</head>
<body>

	<form name="searchFrm" id="searchFrm">
		<select name="searchType">
			<option value="all">선택</option>
			<option value="name">이름</option>
			<option value="title">제목</option>
			<option value="titleContent">제목+내용</option>
		</select> <input type="search" name="search">
		<button type="button" id="schBtn">검색</button>
		<input type="date" name="stDate" id="stDate"> ~ <input
			type="date" name="endDate" id="endDate">
	</form>

	<a href="/board/insert">글쓰기</a>
	<form name="listFrm" id="listFrm">
		
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
				<a href="/board/list?curPage=1" class="page-link">처음</a>
				<c:if test="${paginationInfo.prevPage > 1}">
					<a href="/board/list?curPage=${paginationInfo.prevPage}" class="page-link">이전</a>
				</c:if>
				<c:forEach begin="${paginationInfo.blockBegin}"
					end="${paginationInfo.blockEnd}" var="pageNum">
					<a href="/board/list?curPage=${pageNum}"class="page-link">${pageNum}</a>
				</c:forEach>
				<c:if test="${paginationInfo.nextPage < paginationInfo.totalPage}">
					<a href="/board/list?curPage=${paginationInfo.nextPage}"class="page-link">다음</a>
				</c:if>
				<a href="/board/list?curPage=${paginationInfo.totalPage}" class="page-link">마지막</a>
			</c:if>
		</div>
	</form>

</body>
</html>