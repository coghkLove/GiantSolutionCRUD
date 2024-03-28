package com.ch.board.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ch.board.dto.BoardBoard;

@Mapper
public interface BoardMapper {
	
	List<BoardBoard> BoardList(@Param("searchType") String searchType, @Param("search") String search,
			@Param("stDate") String stDate, @Param("endDate") String endDate, @Param("startRow") int startRow, 
		    @Param("endRow") int endRow);

	int total(@Param("searchType") String searchType, @Param("search") String search, @Param("stDate") String stDate,
			@Param("endDate") String endDate);

	void BoardInsert(BoardBoard board);
	
	void fileInsert(Map<String, Object> fileData);

	void BoardDelete(int BoardDelete);

	BoardBoard BoardSeq(int seq);

	void UpdateBoard(BoardBoard borad);
	

}
