package com.gamecreation.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.gamecreation.bo.UserSessionTrackBO;
import com.gamecreation.dao.PuzzleGameDAOImpl;
import com.gamecreation.dao.QuizeGameDAOImpl;
import com.gamecreation.dao.USerSessionTrackDAO;
import com.gamecreation.vo.UserSessionTrackVO;

public class UserSessionTrackServiceImpl {

	public String saveSessionTrack(UserSessionTrackVO userVO) throws Exception {
		USerSessionTrackDAO dao = new USerSessionTrackDAO();
		UserSessionTrackBO bo = new UserSessionTrackBO();
		String loginTime = userVO.getLoginTime();
		String logoutTime = userVO.getLogoutTime();
		String gamePlayed = "No";
		String result = "";

		// calculating total session time
		String time1 = loginTime.split(" ")[1];
		String time2 = logoutTime.split(" ")[1];

		SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
		Date date1 = format.parse(time1);
		Date date2 = format.parse(time2);

		long hour = Math.abs((date2.getHours() - date1.getHours()));
		long minut =  Math.abs((date2.getMinutes() - date1.getMinutes()));
		long second =  Math.abs((date2.getSeconds() - date1.getSeconds()));
		
		System.out.println("hour "+hour);
		System.out.println("minut "+minut);
		System.out.println("second "+second);
		
		// long HourMinutSecond =
		// ((date1.getHours()+date1.getMinutes()+date1.getSeconds())-(date2.getHours()+date2.getMinutes()+date2.getSeconds()));

		// System.out.println("HourMinutSecond "+HourMinutSecond);
		long difference = date2.getTime() - date1.getTime();// milliseconds

		String totalSession =hour+":"+minut+":"+second; 

		String userCompletedStepName = new QuizeGameDAOImpl().getStepNameByUserName(userVO.getUserName());
		int modeValue = new PuzzleGameDAOImpl().getUserModeValueByUserName(userVO.getUserName());

		// if user played any one game then
		if (userCompletedStepName != null || modeValue != 0) {
			gamePlayed = "Yes";
		}

		// add variable in vo object
		userVO.setGamePlayed(gamePlayed);
		userVO.setTotalSession(totalSession);

		// convert vo to bo
		bo.setUserName(userVO.getUserName());
		bo.setLoginTime(userVO.getLoginTime());
		bo.setLogoutTime(userVO.getLogoutTime());
		bo.setTotalSession(userVO.getTotalSession());
		bo.setGamePlayed(userVO.getGamePlayed());
		bo.setOnlineLearned(userVO.getOnlineLearned());

		System.out.println(totalSession);

		try {
			// use DAO
			int count = dao.storeSessionUserData(bo);

			if (count > 0) {
				result = "Data is stored ";
			} else {
				result = "not stored ";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public static void main(String[] args) throws Exception {
		UserSessionTrackVO userVO = new UserSessionTrackVO();

		userVO.setLoginTime("2019/06/04 15:04:57");
		userVO.setLogoutTime("2019/06/04 15:05:03");

		new UserSessionTrackServiceImpl().saveSessionTrack(userVO);
	}
}
