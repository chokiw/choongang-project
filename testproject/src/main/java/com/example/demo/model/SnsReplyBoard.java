package com.example.demo.model;

import java.sql.Date;
import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Alias("srb")
public class SnsReplyBoard {
	
	private int sns_r_no;
	private int sns_no;
	private String user_id;
	private int sns_r_step;
	private int sns_r_level;
	private String sns_r_content;
	private Date sns_r_date;
	private int sns_r_ref;
	private int sns_r_del;
	private int sns_r_parent;

	private String user_nickname;
	private String user_photo;
	private String parent_nickname;
	
	
}