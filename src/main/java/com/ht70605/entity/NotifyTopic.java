package com.ht70605.entity;

import java.io.Serializable;


public class NotifyTopic implements Serializable{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8643253167086960912L;


	private String id;
	

	private String userId;
	

	private String userName;
	

	private String fieldId;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getFieldId() {
		return fieldId;
	}

	public void setFieldId(String fieldId) {
		this.fieldId = fieldId;
	}
}
