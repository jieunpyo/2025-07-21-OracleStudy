package com.sist.vo;
import lombok.Data;

@Data
public class AttractionVO {
	private int no;                 // PK 번호
    private String image;           // 이미지 URL
    private String name;            // 장소명
    private String description;     // 장소 설명
    private String tel;             // 전화번호
    private String website;         // 공식 웹사이트
    private String language;        // 지원 언어
    private String useTime;         // 이용시간
    private String holiday;         // 휴무일
    private String babyCarriage;    // 유모차 대여 가능 여부
    private String disabledFacility;// 장애인 편의시설
    private String fee;             // 이용 요금
    private String address;         // 주소
    private String traffic;         // 교통 정보
    private String detailUrl;       // 상세페이지 URL
}
