package com.march.seventeen.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.march.seventeen.command.board.BoardDeleteCommand;
import com.march.seventeen.command.board.BoardInsertCommand;
import com.march.seventeen.command.board.BoardListCommand;
import com.march.seventeen.command.board.BoardUpdateCommand;
import com.march.seventeen.command.board.BoardViewCommand;
import com.march.seventeen.command.board.DownloadCommand;

@Controller
public class BoardController {
	
	@Autowired
	private SqlSession sqlSession;
	private BoardListCommand boardListCommand;
	private BoardInsertCommand boardInsertCommand;
	private BoardViewCommand boardViewCommand;
	private BoardDeleteCommand boardDeleteCommand;
	private BoardUpdateCommand boardUpdateCommand;
	private DownloadCommand downloadCommand;

	@Autowired
	public void setCommand(BoardListCommand boardListCommand,
			               BoardInsertCommand boardInsertCommand,
			               BoardViewCommand boardViewCommand,
			               BoardDeleteCommand boardDeleteCommand,
			               BoardUpdateCommand boardUpdateCommand,
			               DownloadCommand downloadCommand) {
		this.boardListCommand = boardListCommand;
		this.boardInsertCommand = boardInsertCommand;
		this.boardViewCommand = boardViewCommand;
		this.boardDeleteCommand = boardDeleteCommand;
		this.boardUpdateCommand = boardUpdateCommand;
		this.downloadCommand = downloadCommand;
		
	}


	@RequestMapping(value="boardList", method=RequestMethod.GET)
	public String list(Model model) {
		
		boardListCommand.execute(sqlSession, model);
		return "board/boardList";
	}
	
	@RequestMapping(value="boardWrite", method=RequestMethod.GET)
	public String writePage() {
		return "board/boardWrite";
		
	}
	
	@RequestMapping(value="write", method=RequestMethod.POST)
	public String write(MultipartHttpServletRequest multipartRequest, Model model) {
		model.addAttribute("multipartRequest", multipartRequest);
		
		boardInsertCommand.execute(sqlSession, model);
		return "redirect:boardList";
	}
	
	@RequestMapping(value="BoardView", method=RequestMethod.GET)
	public String view(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
	
		boardViewCommand.execute(sqlSession, model);
		return "board/boardView";
	}
	@RequestMapping(value="BoardUpdate", method=RequestMethod.POST)
	public String update(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		
		boardUpdateCommand.execute(sqlSession, model);
		return "redirect:boardList";
	}
	@RequestMapping(value="BoardDelete", method=RequestMethod.POST)
	public String delete(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		
		boardDeleteCommand.execute(sqlSession, model);
		return "redirect:boardList";
	}
	@RequestMapping(value="download.do", method=RequestMethod.GET)
	public void download( HttpServletRequest request,
			              HttpServletResponse response,  // 다운로드는 response가 필요합니다.
			              Model model) {
		
		model.addAttribute("request", request);
		model.addAttribute("response", response);
		
		downloadCommand.execute(sqlSession, model);
		
	}
}