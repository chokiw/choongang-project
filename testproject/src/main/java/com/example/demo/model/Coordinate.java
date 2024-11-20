package com.example.demo.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("coordinate")
public class Coordinate {
	private int coordinate_no;
	private int runner_data_no;
	private String lat;
	private String lng;
}
