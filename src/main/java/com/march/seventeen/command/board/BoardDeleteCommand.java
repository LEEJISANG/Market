package com.march.seventeen.command.board;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.march.seventeen.dao.BoardDao;

public class BoardDeleteCommand implements BoardCommand {
	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int bd_no = Integer.parseInt(request.getParameter("bd_no"));
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		boardDao.BoardDelete(bd_no);

	}

}
