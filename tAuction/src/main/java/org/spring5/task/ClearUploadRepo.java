package org.spring5.task;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.spring5.domain.BoardAttachVO;
import org.spring5.mapper.BoardAttachMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class ClearUploadRepo {

	@Autowired
	private BoardAttachMapper boardAttachMapper;

	public ClearUploadRepo() {
	}

	public ClearUploadRepo(BoardAttachMapper boardAttachMapper) {
		this.boardAttachMapper = boardAttachMapper;
	}

	public BoardAttachMapper getBoardAttachMapper() {
		return boardAttachMapper;
	}

	public void setBoardAttachMapper(BoardAttachMapper boardAttachMapper) {
		this.boardAttachMapper = boardAttachMapper;
	}

	@Override
	public String toString() {
		return "ClearUploadRepo [boardAttachMapper=" + boardAttachMapper + "]";
	}
	
	//하루 전 폴더 문자열 생성 메소드(예, 2021\02\08 형식 문자열)
	private String getStrOfYesterdayFolder() {
		//문자열 형식 지정
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");
		
		//달력 객체(연/월/일) 생성
		Calendar calendar = Calendar.getInstance();
		
		//달력에서의 하루 전 날짜를 생성하여 달력 객체에 추가
		calendar.add(Calendar.DATE, -1);
		
		//달력 객체에 설정된 밀리세컨드 값을 가져와서 날짜형식 문자열로 변환
		String strYesterdayFolder = simpleDateFormat.format(calendar.getTime());
		
		System.out.println("하루 전 날짜형식 폴더 반환 값 : "+strYesterdayFolder);
		
		//문자열의 날짜 구분자를 운영체제 디렉토리 구분자로 변경
		return strYesterdayFolder.replace("/", File.separator);  // / ---> \로 변경된다.
	}
	
////위의 코드와 비교코드: UploadController에 있는 메서드
// //Date()를 이용해서 하루 전 날짜를 가져오는 직접적인 기능은 없습니다.
// //Date()는 기본적으로 현재날짜만 반환합니다.
// //다음은 Date()를 이용하여 하루 전 날짜문자열을 생성하는 메서드입니다.
// private String getDatefmtPathName() {
//
// //날짜 형식 지정
// SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");
// //오늘 날짜 생성
// //Date date = new Date();
// //date1은 하루 전 날짜의 밀리-세컨드 객체
// Date date = new Date(System.currentTimeMillis()-24*60*60*1000);
// //날짜 형식이 지정된 날짜문자열(yyyy/MM/dd) 생성
// String strDatefmtPathName = simpleDateFormat.format(date);
// //경로구분자를 운영체제에 맞도록 변경한 문자열을 반환
// return strDatefmtPathName.replace("/", File.separator);
// }	
	
	//spring-task의 스케쥴 기능으로 자동으로 실행되는 메소드
	//@Scheduled(cron = "0 0 3 * * *") 초 분 시 일 월 년
	@Scheduled(cron = "0 0 3 * * *")
	public void clearNeedlessFiles() throws Exception{
		
		String strUploadFileRepoDir = "C:\\upload";
		
		System.out.println("파일 검사 작업 시작........");
		System.out.println("오늘 날짜 : "+new Date());
		
		//데이터 베이스에 저장된 하루 전 첨부파일 전체 정보목록 생성(삭제하면 안되는 파일)
		List<BoardAttachVO> doNotDeleteFileList = boardAttachMapper.selectAttachFilesBeforeOneDay();
		
		List<Path> doNotDeleteFilePathList = doNotDeleteFileList.stream()
																//자바의 java.util.Collection 인터페이스의 stream 메소드로 리스트 객체를 스트림으로 변환
																//스트림의 중간단계 매핑 기능(전달된 리스트의 각 저장값을 다른 값으로 변경)
																//Paths.get() : 문자열 매개변수를 명시된 순서대로 합치면서 운영체제의 파일 경로 객체를 생성
																//boardAttachVO를 생성된 경로 객체로 하나 씩 교체
																.map(boardAttachVO -> Paths.get(strUploadFileRepoDir,
																								boardAttachVO.getUploadPath(),
																								boardAttachVO.getUuid()+"_"+boardAttachVO.getFileName()))
																//스트림을 List 컬렉션 객체로 변환
																.collect(Collectors.toList()); //List<Path> 객체로 변환
		
		//썸네일 파일 정보를 추가한다.
		doNotDeleteFileList.stream()
						   //자바 Strame 기능 사용
						   .filter(boardAttachVO -> boardAttachVO.getFileType().equals("I"))
						   //파일 정보 객체 중, 이미지 파일 정보만 골라냄
						   //이미지 파일 boardAttachVO 객체를 이미지의 썸네일 경로 객체로 교체
						   .map(boardAttachVO -> Paths.get(strUploadFileRepoDir,
														   boardAttachVO.getUploadPath(),
														   "s_"+boardAttachVO.getUuid()+"_"+boardAttachVO.getFileName()))
						   //각각의 썸네일 경로객체를 경로 목록에 추가
						   .forEach(doNotDeleteFilePath -> doNotDeleteFilePathList.add(doNotDeleteFilePath));
		System.out.println("========================================");
		
		
		//최종 : 지우면 안되는 파일(썸네일 포함)의 경로 목록, 각 경로를 콘손에 하나씩 출력(배포시에 주석처리)
		doNotDeleteFilePathList.forEach(doNotDeleteFilePath -> System.out.println(doNotDeleteFilePath));
		
		//하루 전 날짜 경로 파일 객체
		File dirBeforeOneDay = Paths.get(strUploadFileRepoDir, getStrOfYesterdayFolder()) // 하루 전 날짜 경로 객체(Path 객체) 가져와서
									//하루 전 날짜 경로 Path 객체를 File 객체로 변환
									.toFile();

		//디렉토리의 파일 중 DB에 정보가 없는 파일(삭제 파일)들의 배열 객체(DB정보와 비교)
		//하루 전 날짜 폴더에서
		File[] needlessFileArray = dirBeforeOneDay
									//하루 전 날짜 폴더에 있는 각 파일들의 절대경로와 파일이름으로 된 File 객체 배열 반환
									.listFiles(
											//각 파일의 Path 객체로 변환하여 디렉토리의 각 파일의 Path 객체를
											//doNotDelteFilePathList(DB에 정보가 있는 파일) 목록의 Path 객체와 비교하여
											//DB에 없는 (false) 디렉토리 파일들의 File 객체를 
											//needlessFileArray File 배열에 저장
											eachFile -> doNotDeleteFilePathList.contains(eachFile.toPath())==false);
		
		System.out.println("----------------------------------------");
		
		for(File needlessFile : needlessFileArray) {
			System.out.println("=======다음의 파일들이 삭제됩니다.============");
			System.out.println("필요없는 파일 이름 : "+needlessFile.getAbsolutePath());
			
			//필요 없는 파일 삭제
			needlessFile.delete();
			
		}
		
	}
	
	
}
