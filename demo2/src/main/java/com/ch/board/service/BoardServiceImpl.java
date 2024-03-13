package com.ch.board.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ch.board.dto.Board;
import com.ch.board.dto.BoardBoard;
import com.ch.board.mapper.BoardMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {
	
	private final BoardMapper boardmapper;

	@Override
	public List<Board> BoardList() {
		return boardmapper.BoardList();
	}
	
	@Override
	public List<BoardBoard> BoardListList(){
		return boardmapper.BoardListList();
	}
	
	@Override
	public void BoardInsert(BoardBoard board) {
		boardmapper.BoardInsert(board);
	}
	
	@Override
	public void BoardDelete(int BoardDelete) {
		boardmapper.BoardDelete(BoardDelete);;
	}
	

}
