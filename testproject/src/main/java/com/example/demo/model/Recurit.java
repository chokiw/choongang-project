package com.example.demo.model;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("recurit")
public class Recurit {
	
	private int recruit_no;
	private String user_id;
	private Date recruit_d_day;
	private int recruit_recruitnum;
	private int recruit_remainnum;
	private String recruit_subject;
	private String recruit_content;
	private String recruit_address1;
	private String recruit_address2;
	private int recruit_readcount;
	private Date recruit_date;
	private int recruit_del;
}
