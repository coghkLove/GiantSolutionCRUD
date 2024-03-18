package com.ch.board.service;

import java.util.List;

import com.ch.board.dto.Board;
import com.ch.board.dto.BoardBoard;

public interface BoardService {
	List<Board> BoardList();
	
	List<BoardBoard> BoardListList(String search);
	
	void BoardInsert(BoardBoard board);
	
	void BoardDelete(int BoardDelete);
	
	BoardBoard BoardSeq(int seq);
	
	void UpdateBoard(BoardBoard borad);
	
	


}
