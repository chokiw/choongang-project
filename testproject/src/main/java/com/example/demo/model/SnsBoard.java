package com.example.demo.model;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("sns")
public class SnsBoard {
	private int sns_no;
	private String user_id;
	private String sns_address1;
	private String sns_address2;
	private String sns_subject;
	private String sns_content;
	private Date sns_date;
	private String sns_proofshot;
	private int sns_good;
	private int sns_readcount;
	
	private String keyword;
	private String search;
	
	// page
	private int startRow;
	private int endRow;

}
