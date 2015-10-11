package com.itjoin.exception;

public class CommonException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7193088010605303229L;

	public CommonException() {
		super();
	}


	public CommonException(String message, Throwable cause) {
		super(message, cause);
	}

	public CommonException(String message) {
		super(message);
	}

	public CommonException(Throwable cause) {
		super(cause);
	}
    
}
