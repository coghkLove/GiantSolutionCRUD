package com.ch.board.service;

import java.util.List;
import java.util.Map;

import com.ch.board.dto.Board;
import com.ch.board.dto.BoardBoard;

public interface BoardService {
	List<Board> BoardList();

	List<BoardBoard> getBoardList(String searchType, String search, String stDate, String endDate, int curPage,
			int listSize);

	int getBoardListTotalCount(String searchType, String search, String stDate, String endDate);

	Map<String, Object> getPaginationInfo(int curPage, int listSize, int totalCount);

	void BoardInsert(BoardBoard board);

	void BoardDelete(int BoardDelete);

	BoardBoard BoardSeq(int seq);

	void UpdateBoard(BoardBoard borad);

}
