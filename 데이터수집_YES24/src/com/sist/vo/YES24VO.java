package com.sist.vo;
import lombok.Data;

@Data
public class YES24VO {
	private int no;            // 기본키
    private int cno;           // 카테고리 번호 등
    private int rank;          // 순위
    private String title;      // 도서명
    private String author;     // 저자명
    private String image;      // 이미지 URL
    private String publisher;  // 출판사
    private String price;      // 금액
    private String state;      // 상태 (유지/상승/하락)
    private int idcrement;     // state와 나눠 저장할 변동 폭
}
