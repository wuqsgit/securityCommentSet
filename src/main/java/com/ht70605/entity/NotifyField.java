package com.ht70605.entity;

import java.io.Serializable;


public class NotifyField implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2269793914687382971L;

	private String id;
	

	private String fieldName;
	

	private String business;
	

	private String createDate;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFieldName() {
		return fieldName;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	public String getBusiness() {
		return business;
	}

	public void setBusiness(String business) {
		this.business = business;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
}
