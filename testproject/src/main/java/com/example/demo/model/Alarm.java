package com.example.demo.model;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("alarm")
public class Alarm {
	
	private int alarm_no;
	private String user_id;
	private int recruit_no;
	private String alarm_content;
	private Date alarm_date;
	private int alarm_date_readcount;
	private int alarm_del;
	private String alarm_subject;
	
	// page
	private int startRow;
	private int endRow;

}
