package com.march.seventeen.command.board;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.march.seventeen.dao.BoardDao;

public class BoardViewCommand implements BoardCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		int bd_no = Integer.parseInt(request.getParameter("bd_no"));
		model.addAttribute("boardDto", boardDao.BoardView(bd_no));
		
		//조회수 처리
		int bd_hit = boardDao.BoardHit(bd_no);
		model.addAttribute("bd_hit", bd_hit);
		
	}

}
