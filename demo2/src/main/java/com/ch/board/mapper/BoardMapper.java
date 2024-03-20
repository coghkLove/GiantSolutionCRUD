package com.ch.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ch.board.dto.Board;
import com.ch.board.dto.BoardBoard;

@Mapper
public interface BoardMapper {
	List<Board> BoardList();
	
	List<BoardBoard> BoardListList(@Param("searchType") String searchType, @Param("search") String search,@Param("stDate") String stDate);
	
	void BoardInsert(BoardBoard board);
	
	void BoardDelete(int BoardDelete);
	
	BoardBoard BoardSeq(int seq);
	
	void UpdateBoard(BoardBoard borad);
	
	

}
