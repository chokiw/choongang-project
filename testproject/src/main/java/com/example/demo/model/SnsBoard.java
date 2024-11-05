package com.example.demo.model;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("sns")
public class SnsBoard {
	private int sns_board_no;
	private String user_id;
	private String sns_board_address1;
	private String sns_board_address2;
	private String sns_board_subject;
	private String sns_board_content;
	private Date sns_board_date;
	private String sns_board_proofshot;
	private int sns_board_good;
	private int sns_board_readcount;
	
	private String keyword;
	private String search;
	
	// page
	private int startRow;
	private int endRow;

}
