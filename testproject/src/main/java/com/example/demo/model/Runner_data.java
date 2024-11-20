package com.example.demo.model;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;
@Data
@Alias("runner_data")
public class Runner_data {
	private int runner_data_no;
	private String user_id;
	private String runner_data_distance;
	private String runner_data_time;
	private Date runner_data_date;
	private int runner_data_del;
	
	// page
	private int startRow;
	private int endRow;
}
