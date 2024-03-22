package com.ch.board.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
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
	

	
	@GetMapping("/listlist")
	public String boardListList(@RequestParam(value = "searchType", required = false, defaultValue = "") String searchType,
	                            @RequestParam(value = "search", required = false, defaultValue = "") String search,
	                            @RequestParam(value = "stDate", required = false, defaultValue = "") String stDate,
	                            @RequestParam(value = "endDate", required = false, defaultValue = "") String endDate,
	                            @RequestParam(value = "curPage", required = false, defaultValue = "1") int curPage,
	                            @RequestParam(value = "listSize", required = false, defaultValue = "10") int listSize,
	                            Model model) {
	    
	    System.out.println("Search Type: " + searchType);
	    System.out.println("Search: " + search);
	    System.out.println("Start Date: " + stDate);
	    System.out.println("End Date: " + endDate);
	    System.out.println("Current Page: " + curPage);
	    System.out.println("List Size: " + listSize);
	    
	    List<BoardBoard> boardList = boardservice.getBoardList(searchType, search, stDate, endDate, curPage, listSize);
	    for (BoardBoard board : boardList) {
	        System.out.println("Seq: " + board.getSeq() + ", Name: " + board.getMemName() + 
	                           ", Title: " + board.getBoardSubject() + ", Date: " + board.getRegDate());
	    }
	    
	    int totalCount = boardservice.getBoardListTotalCount(searchType, search, stDate, endDate);
	    System.out.println("Total Count: " + totalCount);
	    
	    Map<String, Object> paginationInfo = boardservice.getPaginationInfo(curPage, listSize, totalCount);
	    System.out.println("Pagination Info: " + paginationInfo);
	    
	    model.addAttribute("boardList", boardList);
	    model.addAttribute("totalCount", totalCount);
	    model.addAttribute("paginationInfo", paginationInfo);
	    
	    return "board/boardListList";
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
