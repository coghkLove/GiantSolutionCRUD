package com.ch.board.dto;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@Builder
@NoArgsConstructor
@Data
public class BoardBoard {
	 	private int seq;
	    private String id;
	    private String subject;
	    private String content; 
	    private Date regDate;
	    private Date checkDate;
	    private String payOption;
	    private String history;
	    private String checkName;
	    private String delegateCheckName;

}
