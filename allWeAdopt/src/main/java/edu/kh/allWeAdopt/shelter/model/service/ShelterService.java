package edu.kh.allWeAdopt.shelter.model.service;

import java.util.List;
import java.util.Map;

public interface ShelterService {
	


	/** 전단지 목록 조회
	 * @param cp
	 * @param boardCode
	 * @return
	 */
	Map<String, Object> selectPamphletList(int cp);

}
