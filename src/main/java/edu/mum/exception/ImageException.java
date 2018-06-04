package edu.mum.exception;

public class ImageException extends RuntimeException{
	private static final long serialVersionUID = 1L;
	
	String msg  = "upload failed";
	
	public ImageException(String msg, Exception e) {
		this.msg=msg;
	}

	public String getMsg() {
		return msg;
	}
	

	

}
