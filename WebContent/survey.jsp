<!DOCTYPE html>
<html lang="en">
<head>
<%@ page import="java.util.*" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://fonts.googleapis.com/css?family=Raleway:400,600" rel="stylesheet">
  <link rel="stylesheet" href="css/main.css">
  <link rel="shortcut icon" href="assets/ico/images/favicon.ico">

<title>Digital Game Based Learning</title>

<!-- Icons -->
<link href="vendors/css/font-awesome.min.css" rel="stylesheet">
<link href="vendors/css/simple-line-icons.min.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet" type="text/css" />

<!-- Main styles for this application -->
<link href="css/style.css" rel="stylesheet">

<!-- Styles required by this views -->
<style type="text/css">
/* .slider_module {
	background: url(img/spider_web_net_weave_crawl_dark_42303_1440x900.jpg) repeat-x center bottom;
	height: 100%;
	position: absolute;
	clear: both;
	width: 100%;
	overflow: hidden;
} */

.form_module{
		font-size: 18px;
		color: purple;
}


</style>
<!-- This script will logout the page if give time is up -->
<script type="text/javascript">
	// Set timeout variables.
	var date = new Date().toLocaleString();
	var timoutNow = 30000; // Timeout in 30 secs.
	var pageName = "survey PAGE";
	var logoutUrl = '${pageContext.request.contextPath}/idleSessionLogoutUrl?page='+pageName+'&date='+date; // URL to logout page.


	var timeoutTimer;

	// Start timers.
	function StartTimers() {
		
		timeoutTimer = setTimeout("IdleTimeout()", timoutNow);
	}

	// Reset timers.
	function ResetTimers() {
		
		clearTimeout(timeoutTimer);
		StartTimers();
		$("#timeout").dialog().dialog('close');
	}

	// Show idle timeout warning dialog.
	function IdleWarning() {
		$("#timeout").dialog({
			modal : true
		});
	}

	// Logout the user.
	function IdleTimeout() {
		window.location = logoutUrl;
	}
	
</script>

</head>

<body onload="StartTimers();" onkeypress="ResetTimers();"
	onmousedown="ResetTimers();" onmouseup="ResetTimers();"
	onmousemove="ResetTimers();" onmouseenter="ResetTimers();"
	onmouseover="ResetTimers();" onmouseleave="ResetTimers();"
	onmousewheel="ResetTimers();" onmouseout="ResetTimers();">
	<div class="slider_module">
		<div style="background-color: #cbf2f3" class="header">
			<h1 style="text-align: center;">Digital Game Based Learning</h1>
		</div>

		<div style="background-color: #aa372a" class="topnav">
			<a href="${pageContext.request.contextPath}/dashboardUrl">Home</a>
			<div style="background-color: #aa372a" class="topnav">
				<a href="searchQuery.jsp">Online Learning</a>
				<div style="background-color: #aa372a" class="topnav">
					<a href="pdfViewer.jsp">Show Pdf</a>
					<div style="background-color: #aa372a" class="topnav">
						<a href="game.jsp">Play Game</a>
						<div style="background-color: #aa372a" class="topnav">
							<a href="survey.jsp">Survey</a>
							<div style="background-color: #aa372a" class="topnav">
								<a href="${pageContext.request.contextPath}/logoutUrl">Logout</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
		
		<div class="slider_module">
		<br><br>
		<div class="form_module"> 
	
	</div>
	</div>
		<!-- <div class="app flex-row align-items-center"> -->

		  <h1 id="title">Survey Form</h1>
  <div class="container">
    <p id="description">Let us know how we can improve Digital Based Learning..!</p>
    <form action="surveyFormUrl" method="post" id="survey-form" onsubmit="alert('thanque..!');">
      <div class="rowDiv">
        <div class="questionDiv">
          <label for="name" id="name-label">*Name:</label>
        </div>
        <div class="answerDiv">
          <input type="text" name="name" id="name" placeholder="Enter your name" required>
        </div>
      </div>

      <div class="rowDiv">
        <div class="questionDiv">
          <label for="email" id="email-label">*Email:</label>
        </div>
        <div class="answerDiv">
          <input type="email" name="email" id="email" placeholder="Enter your email" required>
        </div>
      </div>

      <div class="rowDiv">
        <div class="questionDiv">
          <label for="age" id="number-label">Age:</label>
        </div>
        <div class="answerDiv">
          <input type="number" name="age" id="number" min="1" max="150" placeholder="Enter your age">
        </div>
      </div>

      <div class="rowDiv">
        <div class="questionDiv">
          <label for="currentPosition" id="dropdown-label">Which option best describes your current role?</label>
        </div>
        <div class="answerDiv">
          <select name="currentPosition" id="dropdown">
            <option value="" selected disabled>Select an option</option>
            <option value="student">Student</option>
            <option value="job">Full-time job</option>
            <option value="learner">Full-time learner</option>
            <option value="preferNotToSay">Prefer not to say</option>
            <option value="other">Other</option>
          </select>
        </div>
      </div>

      <div class="rowDiv">
        <div class="questionDiv">
          <label for="userRatings">How likely is that you would recommend Digital Based Learning to a friend?</label>
        </div>
        <div class="answerDiv">
          <ul>
            <li><label for="userRating"><input type="radio" value="definitely" name="userRating">Definitely</label></li>
            <li><label for="userRating"><input type="radio" value="maybe" name="userRating">Maybe</label></li>
            <li><label for="userRating"><input type="radio" value="notSure" name="userRating">Not sure</label></li>
          </ul>
        </div>
      </div>

      <div class="rowDiv">
        <div class="questionDiv">
          <label for="preferences">Things that should be improved in the future<br>(Check all that apply):</label>
        </div>
        <div class="answerDiv">
          <ul>
            <li><label for="preference"><input type="checkbox" name="preference" value="pdf">pdf</label></li>
            <li><label for="preference"><input type="checkbox" name="preference" value="puzzle Game">puzzle Game</label></li>
            <li><label for="preference"><input type="checkbox" name="preference" value="Quiz Game">Quiz Game</label></li>
            <li><label for="preference"><input type="checkbox" name="preference" value="query">Query Result</label></li>
          </ul>
        </div>
      </div>

      <div class="rowDiv">
        <div class="questionDiv">
          <label for="comments">Anything you would like to say to us?</label>
        </div>
        <div class="answerDiv">
          <textarea name="comments" id="comments" placeholder="Enter your comment..."></textarea>
        </div>
      </div>

      <div class="rowDiv">
        <button id="submit" type="submit">Submit</button>
      </div>
    </form>
  </div>
  <!-- <script src="https://cdn.freecodecamp.org/testable-projects-fcc/v1/bundle.js"></script> -->		<!-- Placed at the end of the document so the pages load faster -->
		<script src="assets/js/jquery.js"></script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/jquery.easing-1.3.min.js"></script>
		<script src="assets/js/jquery.scrollTo-1.4.3.1-min.js"></script>
		<script src="assets/js/shop.js"></script>
	</body>
</html>