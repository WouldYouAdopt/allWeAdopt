package edu.kh.allWeAdopt.point.model.service;

public interface PointService {

	/**해당 회원의 포인트를 증가시켜주는 Service ( 김현기)
	 * @param memberNo
	 * @return
	 */
	int wordleSuccess(int memberNo);

	/**해당 회원의 소지 포인트를 변경
	 * @param total
	 * @param memberNo
	 * @return
	 */
	int rouletteRun(int total, int memberNo);

}
