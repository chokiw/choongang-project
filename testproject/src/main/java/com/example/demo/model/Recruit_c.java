package com.example.demo.model;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("recruit_c")
public class Recruit_c {
	private int recruit_c_no;
	private int recruit_no;
	private String lat;
	private String lng;

}
