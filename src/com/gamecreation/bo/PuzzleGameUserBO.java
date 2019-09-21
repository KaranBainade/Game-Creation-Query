package com.gamecreation.bo;

public class PuzzleGameUserBO {

		private int userID;
		private String userName;
		private int modeValue;
		private int steps;
		private int time;
		private String comment;
		
		public int getUserID() {
			return userID;
		}
		public void setUserID(int userID) {
			this.userID = userID;
		}
		public String getUserName() {
			return userName;
		}
		public void setUserName(String userName) {
			this.userName = userName;
		}
		public int getModeValue() {
			return modeValue;
		}
		public void setModeValue(int modeValue) {
			this.modeValue = modeValue;
		}
		public int getSteps() {
			return steps;
		}
		public void setSteps(int steps) {
			this.steps = steps;
		}
		public int getTime() {
			return time;
		}
		public void setTime(int time) {
			this.time = time;
		}
		public String getComment() {
			return comment;
		}
		public void setComment(String comment) {
			this.comment = comment;
		}
		
		@Override
		public String toString() {
			return "PuzzleGameUserBO [userID=" + userID + ", userName=" + userName + ", modeValue=" + modeValue
					+ ", steps=" + steps + ", time=" + time + ", comment=" + comment + "]";
		}
				
}
