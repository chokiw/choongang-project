package com.example.demo.model;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("sns")
public class SnsBoard {
	private int sns_no;
	private int runner_data_no;
	private String user_id;
	private String sns_address1;
	private String sns_address2;
	private String sns_subject;
	private String sns_content;
	private Date sns_date;
	private String sns_proofshot;
	private int sns_good;
	private int sns_readcount;
	private int sns_del;
	
	private String keyword;
	private String search;
	
	// page
	private int startRow;
	private int endRow;

	// 메인페이지 베스트 트랙에서 nickname 값을 가져오기 위해 사용
	private String user_nickname;
	
}
