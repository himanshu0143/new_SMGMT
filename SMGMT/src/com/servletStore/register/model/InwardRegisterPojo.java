package com.servletStore.register.model;

public class InwardRegisterPojo {
	int id,inwardNo,documentId;
	String date,senderName,subject,address,description,docmentName;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getInwardNo() {
		return inwardNo;
	}
	public void setInwardNo(int inwardNo) {
		this.inwardNo = inwardNo;
	}
			
	public int getDocumentId() {
		return documentId;
	}
	public void setDocumentId(int documentId) {
		this.documentId = documentId;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getSenderName() {
		return senderName;
	}
	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getDocmentName() {
		return docmentName;
	}
	public void setDocmentName(String docmentName) {
		this.docmentName = docmentName;
	}
	

}
