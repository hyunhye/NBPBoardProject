package com.hyunhye.board.model;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;

/**
 * 게시글 정보
 * @author NAVER
 *
 */
@Data
@Alias("board")
public class Board {
	/** 게시판 번호 **/
	private int boardNo;
	/** 게시글 제목 **/
	private String boardTitle;
	/** 게시글 내용 **/
	private String boardContent;
	/** 게시글 Summary **/
	private String boardContentSummary;
	/** 게시글 작성 날짜 **/
	private Date boardDate;
	/** 게시글 첨부 파일 **/
	private String[] boardFiles;
	/** 게시글 첨부 파일 번호 **/
	private int[] boardFilesNo;
	/** 게시글 삭제 파일 이름 **/
	private String[] boardFilesDelete;
	/** 파일 개수 **/
	private int fileCount;
	/** 파일 리스트 */
	private List<BoardFile> boardFileList;
	/** 조회수 **/
	private int boardViewCount;
	/** 게시글 개수 */
	private int boardCount;
	/** 카테고리 번호 **/
	private int categoryNo;
	/** 카테고리 목록이름 **/
	private String categoryItem;
	/** 사용자 번호 **/
	private int userNo;
	/** 사용자 아이디 **/
	private String userId;
	/** 답변 갯수 **/
	private int commentCount;
	/** 즐겨찾기 체크 유무 **/
	private int bookmarkCheck;
}
