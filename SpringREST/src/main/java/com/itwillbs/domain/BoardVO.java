package com.itwillbs.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardVO {
	private Integer bno;		/* 페이지 이동할 때 형변환이 생기므로 integer */
	private String title;
	private String content;
	private String writer;
	private Timestamp regdate;
	private int viewcnt;
	
}
