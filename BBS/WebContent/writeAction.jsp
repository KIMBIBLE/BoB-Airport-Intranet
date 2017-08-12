<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.IOException"%>


<%@ page import="bbs.BbsDAO"%>
<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bob Airport</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요한 기능입니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		} else {
			/* 파일 업로드 */
			// 100Mbyte 제한
			int maxSize = 1024 * 1024 * 100;

			// 웹서버 컨테이너 경로
			String root = request.getSession().getServletContext().getRealPath("/");

			// 파일 저장 경로(ex : /home/tour/web/ROOT/upload)
			String savePath = root + "upload\\";

			// 업로드 파일명
			//String uploadFile = "";

			// 실제 저장할 파일명
			String newFileName = "";

			int read = 0;
			byte[] buf = new byte[1024];
			FileInputStream fin = null;
			FileOutputStream fout = null;
			long currentTime = System.currentTimeMillis();
			SimpleDateFormat simDf = new SimpleDateFormat("yyyyMMddHHmmss");

			//쿼리문 전달 String query = "SELECT * FROM " + table_name;
			
			try {
				MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8",
				new DefaultFileRenamePolicy());
				String bbsTitle = multi.getParameter("bbsTitle");
				String bbsContent = multi.getParameter("bbsContent");
				String uploadFile = multi.getParameter("uploadFile");

				if (bbsTitle == null || bbsContent == null ||
						bbsTitle.equals("") || bbsContent.equals("")) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('입력이 안 된 사항이 있습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
				bbs.setBbsTitle(bbsTitle);
				bbs.setBbsContent(bbsContent);

				// 파일업로드
				uploadFile = multi.getFilesystemName("uploadFile");

				if(uploadFile != null) {
					// 실제 저장할 파일명(ex : 20140819151221.zip)
					newFileName = simDf.format(new Date(currentTime)) + "."
							+ uploadFile.substring(uploadFile.lastIndexOf(".") + 1);
				}
				
				// 업로드된 파일 객체 생성
				File oldFile = new File(savePath + uploadFile);

				// 실제 저장될 파일 객체 생성
				File newFile = new File(savePath + newFileName);

				// 파일명 rename
				if (!oldFile.renameTo(newFile)) {

					// rename이 되지 않을경우 강제로 파일을 복사하고 기존파일은 삭제
					buf = new byte[1024];
					fin = new FileInputStream(oldFile);
					fout = new FileOutputStream(newFile);
					read = 0;
					while ((read = fin.read(buf, 0, buf.length)) != -1) {
						fout.write(buf, 0, read);
					}
					fin.close();
					fout.close();
					oldFile.delete();
				}
				
				bbs.setBbsFileName(uploadFile);
				bbs.setBbsFilePath(newFileName);


			} catch (Exception e) {
				e.printStackTrace();
			}

			BbsDAO bbsDAO = new BbsDAO();
			int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent(), bbs.getBbsFileName(), bbs.getBbsFilePath());
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'bbs.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>