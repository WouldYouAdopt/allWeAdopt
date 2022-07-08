package edu.kh.allWeAdopt.shelter.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Shelter {
	
	String reqNo;
	String filename;
	String happenDt;
	String happenPlace;
	String kindCd;
	String colorCd;
	String age;
	String weight;
	String popfile;
	

//	String resultCode; // 결과코드
//	String resultMsg; // 결과메세지
	String careNm; // 동물호보센터명
	String orgNm; // 관리기관명
//	String divisionNm; // 동물보호센터유형
	String careAddr; // 소재지 주소(도로명)
	String lat; // 위도
	String lng; // 경도
	String careTel; // 전화번호
//	String dataStdDt; // 데이터기준일자
	String numOfRows; // 한 페이지 결과 수
//	String pageNo; // 페이지 번호
//	String totalCount; // 전체 결과 수
	
}
