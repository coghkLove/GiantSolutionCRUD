package com.ch.board.controller;

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
	
	@GetMapping("/list")
	public String BoardList(Model model) {
		model.addAttribute("boardlist", boardservice.BoardList());
		return "board/boardList";
	}
	
	@GetMapping("/listlist")
	public String BoardListList( @RequestParam(value = "searchType", required = false) String searchType,
								@RequestParam(value = "stDate", required = false) String stDate,
								 @RequestParam(value = "endDate", required = false) String endDate,
								@RequestParam(value = "search", required = false) String search,Model model) {
	    model.addAttribute("boardlistlist", boardservice.BoardListList(searchType,search,stDate,endDate));
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
