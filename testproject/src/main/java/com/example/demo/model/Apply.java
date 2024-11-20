package com.example.demo.model;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("apply")
public class Apply {
	
	private int apply_no;
	private int recruit_no;
	private String user_id;
	private Date apply_date;
	private int apply_del;
}
