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
	private String memName;
	private String memId;
	private String boardSubject;
	private String boardContent;
	private Date regDate;
	private Date uptDate;
	private String viewCnt;
	private String useYn;
	private String fileName; 
	private String filePath; // 파일이 저장된 경로

}
