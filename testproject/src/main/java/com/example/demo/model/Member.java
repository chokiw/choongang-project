package com.example.demo.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("member")
public class Member {
	private String user_id;
	private String user_nickname;
	private String user_photo;
}
