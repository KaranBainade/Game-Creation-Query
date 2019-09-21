package com.gamecreation.bo;

public class SurveyFormBO {
	private String userName;
	private String email;
	private int age;
	private String currentRole;
	private String recommendFried;
	private String improvement;
	private String comment;
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getCurrentRole() {
		return currentRole;
	}
	public void setCurrentRole(String currentRole) {
		this.currentRole = currentRole;
	}
	public String getRecommendFried() {
		return recommendFried;
	}
	public void setRecommendFried(String recommendFried) {
		this.recommendFried = recommendFried;
	}
	public String getImprovement() {
		return improvement;
	}
	public void setImprovement(String improvement) {
		this.improvement = improvement;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	
	@Override
	public String toString() {
		return "SurveyFormBO [userName=" + userName + ", email=" + email + ", age=" + age + ", currentRole="
				+ currentRole + ", recommendFried=" + recommendFried + ", improvement=" + improvement + ", comment="
				+ comment + "]";
	}
	
}
