package com.march.seventeen.dao;

import java.util.ArrayList;

import com.march.seventeen.dto.BoardDto;

public interface BoardDao {

	public ArrayList<BoardDto> selectBoardList(); 
	public int selectBoardCount();
	public int BoardInsert(int bd_m_no, String bd_title, String bd_content, String filename);
	public BoardDto BoardView(int bd_no);
	public int BoardUpdate(int bd_no, String bd_title, String bd_content);
	public int BoardDelete(int bd_no);
	
	
}