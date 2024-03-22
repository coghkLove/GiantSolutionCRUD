package com.ch.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;


import com.ch.board.dto.BoardBoard;
import com.ch.board.mapper.BoardMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {

	private final BoardMapper boardmapper;

	

	@Override
	public List<BoardBoard> getBoardList(String searchType, String search, String stDate, String endDate, int curPage,
			int listSize) {
		int startRow = (curPage - 1) * listSize;
		return boardmapper.BoardListList(searchType, search, stDate, endDate, startRow, listSize);
	}

	@Override
	public int getBoardListTotalCount(String searchType, String search, String stDate, String endDate) {
		return boardmapper.total(searchType, search, stDate, endDate);
	}

	@Override
	public Map<String, Object> getPaginationInfo(int curPage, int listSize, int totalCount) {
	    Map<String, Object> paginationInfo = new HashMap<>();
	    
	    int totalPage = (int) Math.ceil((double) totalCount / listSize);

	    int blockScale = 5; 
	    int currentBlock = (int) Math.ceil((double) curPage / blockScale);
	    
	
	    int blockBegin = (currentBlock - 1) * blockScale + 1;

	    int blockEnd = blockBegin + blockScale - 1;
	    if (blockEnd > totalPage) {
	        blockEnd = totalPage;
	    }

	    int prevPage = currentBlock == 1 ? 1 : (currentBlock - 1) * blockScale;
	    int nextPage = currentBlock >= (totalPage / blockScale) ? totalPage : currentBlock * blockScale + 1;
	    if (nextPage >= totalPage) {
	        nextPage = totalPage;
	    }

	    paginationInfo.put("totalPage", totalPage);
	    paginationInfo.put("currentBlock", currentBlock);
	    paginationInfo.put("blockBegin", blockBegin);
	    paginationInfo.put("blockEnd", blockEnd);
	    paginationInfo.put("prevPage", prevPage);
	    paginationInfo.put("nextPage", nextPage);
	    paginationInfo.put("curPage", curPage);
	    paginationInfo.put("totalCount", totalCount);

	    return paginationInfo;
	}
	
	@Override
	public void BoardInsert(BoardBoard board) {
		boardmapper.BoardInsert(board);
	}

	@Override
	public void BoardDelete(int BoardDelete) {
		boardmapper.BoardDelete(BoardDelete);
	}

	@Override
	public BoardBoard BoardSeq(int seq) {
		return boardmapper.BoardSeq(seq);
	}

	@Override
	public void UpdateBoard(BoardBoard borad) {
		boardmapper.UpdateBoard(borad);
	}

}
