package com.march.seventeen.command.board;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.march.seventeen.dao.BoardDao;

public class BoardInsertCommand implements BoardCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)map.get("multipartRequest");
		
		// multipartRequest에 저장된 일반 파라미터는 getParameter()를 씁니다.
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String bd_m_no = multipartRequest.getParameter("bd_m_no");
		String bd_title = multipartRequest.getParameter("bd_title");
		String bd_content = multipartRequest.getParameter("bd_content");
		
		// 1. multipartRequest에 저장된 첨부가 1개일 때는 getFile()을 씁니다.
				/*
					<input type="file" name="filename" />
					MultipartFile file = multipartRequest.getFile("filename");
				*/
				
				// 2. multipartRequest에 저장된 첨부가 multiple일 때는 getFiles()를 씁니다.
				// 첨부 타입이 multiple이면 첨부된 파일들은 List에 저장되서 넘어옵니다.
				// 각 첨부 파일들의 타입은 MultipartFile입니다.
				/*
					<input type="file" name="files" multiple />
					List<MultipartFile> files = multipartRequest.getFiles("files");
				*/
		
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		
	List<MultipartFile> files = multipartRequest.getFiles("files");
		
		// 첨부를 하나씩 꺼내기
		for (MultipartFile file : files) {
			
			// 꺼낸 첨부가 있는지 검사
			if (file != null && !file.isEmpty()) {
				
				// MultipartFile file에서 첨부하는 파일명을 알아냅니다.
				String originalFilename = file.getOriginalFilename();
				
				// 업로드 할 파일명의 중복 방지 대책을 수립합니다.
				// 원래파일명_업로드시간.확장자
				
				// abcde.jpg
				// 확장자 (jpg 구하기)
				String extension = originalFilename.substring( originalFilename.lastIndexOf(".") + 1 );
				// 파일명 (abcde 구하기)
				String filename = originalFilename.substring( 0, originalFilename.lastIndexOf(".") );
				
				// 업로드 할 파일명 만들기 (abcde_업로드시간.jpg)
				String uploadFilename = filename +
						                "_" +
						                System.currentTimeMillis() +
						                "." +
						                extension;
				
				// 업로드 할 경로 구하기
				// 업로드는 resources/storage 디렉토리에 저장하기로 합니다.
				// 자바 코드로 storage 디렉토리를 만들기 때문에 미리 만들어 둘 필요가 없습니다.
				String realPath = multipartRequest.getServletContext().getRealPath("resources/storage");
				
				// 업로드 할 경로가 없으면 storage 디렉토리를 만듭니다.
				File dir = new File(realPath);
				if ( !dir.exists() ) {
					dir.mkdirs();
				}
				
				// 이제 업로드 할 파일명(uploadFilename)과 경로(realPath)를 모두 알고 있습니다.
				File uploadFile = new File(realPath, uploadFilename);
				
				// 첨부한 파일(MultipartFile file) -> 업로드 (uploadFile) 합니다.
				try {
					file.transferTo(uploadFile);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				// 테이블에 데이터를 저장합니다.
				boardDao.BoardInsert(bd_m_no, bd_title, bd_content, uploadFilename);  // 첨부가 있는 경우
				
			} else {
				
				boardDao.BoardInsert(bd_m_no, bd_title, bd_content, "첨부없음");  // 첨부가 없는 경우
				
			}
			
		}  // for (MultipartFile file : files) {
		
		
	}
		
}
				

	


