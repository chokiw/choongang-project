package com.example.demo.model;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("totalpage")
public class Totalpage {
	private String user_id;
	private int recruit_no;
	private String recruit_subject;
	private Date recruit_date;
	private int recruit_readcount;
	private int sns_no;
	private String sns_subject;
	private Date sns_date;
	private int sns_readcount;

}
