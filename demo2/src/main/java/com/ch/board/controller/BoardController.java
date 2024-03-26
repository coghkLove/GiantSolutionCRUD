package com.ch.board.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ch.board.dto.BoardBoard;
import com.ch.board.service.BoardService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardController {
	
	private final BoardService boardservice;
	

	@Transactional
	@GetMapping("/list")
	public String boardList(
	        @RequestParam(value = "searchType", required = false, defaultValue = "") String searchType,
	        @RequestParam(value = "search", required = false, defaultValue = "") String search,
	        @RequestParam(value = "stDate", required = false, defaultValue = "") String stDate,
	        @RequestParam(value = "endDate", required = false, defaultValue = "") String endDate,
	        @RequestParam(value = "curPage", required = false, defaultValue = "1") int curPage,
	        @RequestParam(value = "listSize", required = false, defaultValue = "10") int listSize,
	        Model model) {
	    
	    int totalCount = boardservice.getBoardListTotalCount(searchType, search, stDate, endDate);
	    Map<String, Object> paginationInfo = boardservice.getPaginationInfo(curPage, listSize, totalCount);
	    List<BoardBoard> boardList = boardservice.BoardList(searchType, search, stDate, endDate, curPage, listSize);
	    model.addAttribute("boardList", boardList);
	    model.addAttribute("paginationInfo", paginationInfo);
	    return "board/boardList";
	}


	@GetMapping("/insert")
	public String BoardInsert() {
		return "board/boardInsert";
	}
	
	@PostMapping("/insert")
	public String BoardPostInsert(BoardBoard board) {
		boardservice.BoardInsert(board);
		return "redirect:/board/listlist";
		
	}
	
	
	@PostMapping("/{seq}")
	public String BoardDelete(@PathVariable("seq")int BoardDelete) {
		boardservice.BoardDelete(BoardDelete);
		return "redirect:/board/listlist";
		
	}
	
	@GetMapping("/view/{seq}")
	public String BoardSeq(@PathVariable("seq")int seq, Model model) {
		model.addAttribute("boardview",boardservice.BoardSeq(seq));
		return "board/boardInsert";
	}
	
	@GetMapping("/update")
	public String UpdateBoard() {
		return "board/boardInsert";
	}
	
	@PostMapping("/update")
	public String UpdateBoard(BoardBoard board) {
		boardservice.UpdateBoard(board);
		return "redirect:/board/listlist";
	}
	

		

	
	

}
