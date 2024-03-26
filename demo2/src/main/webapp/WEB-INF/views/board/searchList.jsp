<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>re"%>

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