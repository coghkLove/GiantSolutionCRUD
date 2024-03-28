package com.ch.board.dto;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@Builder
@NoArgsConstructor
@Data

public class BoardFile {
    private Long fileSeq;
    private String realName;
    private String saveName;
    private Date regDate;
    private String savePath;
    private Long listSeq;
}