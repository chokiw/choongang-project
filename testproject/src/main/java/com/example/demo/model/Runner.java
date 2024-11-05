package com.example.demo.model;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("runner")
public class Runner {
	private String user_id; 
	private String user_passwd;
	private String user_name;
	private String user_nickname;
	private String user_jumin1;
	private String user_jumin2;
	private String user_emailid;
	private String user_domain;
	private String user_phone1;
	private String user_phone2;
	private String user_phone3;
	private String user_address1;
	private String user_address2;
	private String user_photo;
	private int user_runtime;
	private int user_distance;
	private String user_gender;
	private Date user_date;

}
