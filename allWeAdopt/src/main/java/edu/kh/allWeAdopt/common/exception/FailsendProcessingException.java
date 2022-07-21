package edu.kh.allWeAdopt.common.exception;

public class FailsendProcessingException extends RuntimeException{
	
	public FailsendProcessingException(int paymentNo) {
		super(paymentNo + "번의 택배 발송 처리 실패");
	}
	
}
