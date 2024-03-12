package com.ch.board.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@Builder
@NoArgsConstructor
@Data
public class Board {
	private int empNo;
	private String job;
	private int deptNo;
	private String projectCode;
	private int sal;
	private int comm;
	private String ename;
	
}
