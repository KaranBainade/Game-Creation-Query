package com.gamecreation.bo;

public class QuizGameResultBO {
	
	private String userName;
	private int correctAnswer;
	private int incorrectAnswer;
	private String result;
	private int totalQuestion;
	private String stepCompletedName;
	private String usersteps;
	private double percentage;
	private int totalObtainedMarks;
	private String totalObtainedPercentage;
	
	public String getStepCompletedName() {
		return stepCompletedName;
	}
	public void setStepCompletedName(String stepCompletedName) {
		this.stepCompletedName = stepCompletedName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getCorrectAnswer() {
		return correctAnswer;
	}
	public void setCorrectAnswer(int correctAnswer) {
		this.correctAnswer = correctAnswer;
	}
	public int getIncorrectAnswer() {
		return incorrectAnswer;
	}
	public void setIncorrectAnswer(int incorrectAnswer) {
		this.incorrectAnswer = incorrectAnswer;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public int getTotalQuestion() {
		return totalQuestion;
	}
	public void setTotalQuestion(int totalQuestion) {
		this.totalQuestion = totalQuestion;
	}
	
	public String getUsersteps() {
		return usersteps;
	}
	public void setUsersteps(String usersteps) {
		this.usersteps = usersteps;
	}
	public double getPercentage() {
		return percentage;
	}
	public void setPercentage(double percentage) {
		this.percentage = percentage;
	}
	
	public int getTotalObtainedMarks() {
		return totalObtainedMarks;
	}
	public void setTotalObtainedMarks(int totalObtainedMarks) {
		this.totalObtainedMarks = totalObtainedMarks;
	}
	public String getTotalObtainedPercentage() {
		return totalObtainedPercentage;
	}
	public void setTotalObtainedPercentage(String totalObtainedPercentage) {
		this.totalObtainedPercentage = totalObtainedPercentage;
	}
	
	@Override
	public String toString() {
		return "QuizGameResultBO [userName=" + userName + ", correctAnswer=" + correctAnswer + ", incorrectAnswer="
				+ incorrectAnswer + ", result=" + result + ", totalQuestion=" + totalQuestion + ", stepCompletedName="
				+ stepCompletedName + ", usersteps=" + usersteps + ", percentage=" + percentage
				+ ", totalObtainedMarks=" + totalObtainedMarks + ", totalObtainedPercentage=" + totalObtainedPercentage
				+ "]";
	}
	
}
