package com.example.demo.model;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("good")
public class Good {
	private int good_no;
	private int sns_no;
	private String user_id;
	private Date good_date;
	
}
