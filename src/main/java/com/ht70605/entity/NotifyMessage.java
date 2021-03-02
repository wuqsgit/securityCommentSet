package com.ht70605.entity;

import java.io.Serializable;

public class NotifyMessage implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 857921206177322059L;


	private String id;
	
	private String message;
	
	private String fieldId;

	private String userId;

	private String isRead;

	private String readStr;
	

	private String createDate;

	private String readTime;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getFieldId() {
		return fieldId;
	}

	public void setFieldId(String fieldId) {
		this.fieldId = fieldId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getIsRead() {
		return isRead;
	}

	public void setIsRead(String isRead) {
		this.isRead = isRead;
	}

	public String getReadStr() {
		return readStr;
	}

	public void setReadStr(String readStr) {
		this.readStr = readStr;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getReadTime() {
		return readTime;
	}

	public void setReadTime(String readTime) {
		this.readTime = readTime;
	}
}
