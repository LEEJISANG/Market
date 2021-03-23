package com.march.seventeen.command.board;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.march.seventeen.dao.BoardDao;

public class BoardUpdateCommand implements BoardCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		int bd_no = Integer.parseInt(request.getParameter("bd_no"));
		String bd_title = request.getParameter("bd_title");
		String bd_content = request.getParameter("bd_content");
		boardDao.BoardUpdate(bd_no, bd_title, bd_content);
		
		
	}

}
