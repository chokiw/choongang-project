package com.example.demo.model;

import java.sql.Date;
import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Alias("rb")
public class MateReplyBoard {
	
	private int recruit_r_no;
	private int recruit_no;
	private String user_id;
	private int recruit_r_step;
	private int recruit_r_level;
	private String recruit_r_content;
	private Date recruit_r_date;
	private int recruit_r_ref;
	private int recruit_r_del;
	private int recruit_r_parent;
	
	private String user_nickname; 
	private String user_photo;
	private String parent_nickname;
	
}