package com.ch.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String BoardListList(Model model) {
	    model.addAttribute("boardlistlist", boardservice.BoardListList());
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
	
	

}
