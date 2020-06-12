package command;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cs_board.beans.CS_WriteDAO;
import cs_board.beans.CS_WriteDTO;
import cs_board.beans.FileDAO;
import cs_board.beans.FileDTO;

public class CSViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;

		HttpSession session = request.getSession(false);

		CS_WriteDTO[] arr = null; // 초기값
		CS_WriteDAO dao = new CS_WriteDAO();

		// -----------------절취선-----------------------
		// 첨부파일
		FileDAO fileDao = new FileDAO();
		FileDTO[] fileArr = null;

		// -----------------절취선-----------------------

//		int uid = (int)(session.getAttribute("mem_uid"));

		int uid = Integer.parseInt(request.getParameter("uid"));

//		if(uid < 0 ) uid = 1;
		try {
			arr = dao.readByUid(uid);
			request.setAttribute("view", arr);

			System.out.println(uid);
			System.out.println((int) session.getAttribute("mem_uid"));
		} catch (Exception e) {
			e.printStackTrace();
		}

		
		// -----------------절취선-----------------------
		// 첨부파일 읽어들이기
		try {
			if (arr != null && arr.length == 1) {
				fileArr = fileDao.selectFilesByWrUid(uid);

				// 이미지 파일 여부 세팅
				String realPath = "";
				String saveFolder = "upload";
				ServletContext context = request.getServletContext();
				realPath = context.getRealPath(saveFolder);

				for (FileDTO fileDto : fileArr) {
					String downloadedFilePath = realPath + File.separator + fileDto.getFile();
					BufferedImage imgData = ImageIO.read(new File(downloadedFilePath));
					if (imgData != null) {
						fileDto.setImage(true);
					}
				}

				request.setAttribute("file", fileArr);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		// -----------------절취선-----------------------
		
	}// end execute

}
