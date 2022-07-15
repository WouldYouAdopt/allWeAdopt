package edu.kh.allWeAdopt.common.exception;

public class FailReturnException extends RuntimeException{
	
	public FailReturnException() {
		super("반품 사유 삽입 실패");
	}
	
}
