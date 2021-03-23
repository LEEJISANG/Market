package com.march.seventeen.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data

public class BoardDto {
	
	private int bd_no;
	private int bd_m_no;
	private String bd_title;
	private String bd_content;
	private Date bd_regDate;
	private int bd_hit;
	private String filename;

}
