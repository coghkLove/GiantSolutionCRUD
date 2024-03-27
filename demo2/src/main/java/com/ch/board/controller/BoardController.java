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
import org.springframework.web.multipart.MultipartFile;

import com.ch.board.dto.BoardBoard;
import com.ch.board.service.BoardService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardController {
	
	private final BoardService boardservice;
	
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
	
	@GetMapping("/searchList")
	public String searchList(
	    @RequestParam(value = "searchType", required = false, defaultValue = "") String searchType,
	    @RequestParam(value = "search", required = false, defaultValue = "") String search,
	    @RequestParam(value = "stDate", required = false, defaultValue = "") String stDate,
	    @RequestParam(value = "endDate", required = false, defaultValue = "") String endDate,
	    @RequestParam(value = "curPage", required = false, defaultValue = "1") int curPage,
	    @RequestParam(value = "listSize", required = false, defaultValue = "10") int listSize,
	    Model model) {

	    int totalCount = boardservice.getBoardListTotalCount(searchType, search, stDate, endDate); // 총 결과 수 계산
	    Map<String, Object> paginationInfo = boardservice.getPaginationInfo(curPage, listSize, totalCount); // 페이징 정보 계산

	    List<BoardBoard> searchResults = boardservice.BoardList(searchType, search, stDate, endDate, curPage, listSize); // 검색 결과 조회

	    model.addAttribute("boardList", searchResults); // 검색 결과
	    model.addAttribute("paginationInfo", paginationInfo); // 페이징 정보

	    return "board/searchList"; // 검색 결과를 보여줄 뷰
	}
	
	


	@GetMapping("/insert")
	public String BoardInsert() {
		return "board/boardInsert";
	}
	
	@PostMapping("/insert")
	public String BoardPostInsert(BoardBoard board) {
		boardservice.BoardInsert(board);
		return "redirect:/board/list";
		
	}
	
//	@PostMapping("insert")
//	public String BoardPostInsert(BoardBoard board, @RequestParam("file") MultipartFile file ) {
//		if(!file.isEmpty()) {
//			String fileName= file.getOriginalFilename();
//			String savePath = "C:\\Users\\Chaehwa\\Desktop\\사진저장공간";
//		}
//	}
//	
	
	
	
	@PostMapping("/{seq}")
	public String BoardDelete(@PathVariable("seq")int BoardDelete) {
		boardservice.BoardDelete(BoardDelete);
		return "redirect:/board/list";
		
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
		return "redirect:/board/list";
	}
	

		

	
	

}
