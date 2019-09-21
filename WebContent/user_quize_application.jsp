<!DOCTYPE html>
<html lang="en">
<head>
<%@ page import="java.util.*" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Alba Lite Bootstrap 4 Admin Template">
<meta name="author" content="Lukasz Holeczek">
<meta name="keyword" content="Alba Lite Bootstrap 4 Admin Template">


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
.form_module {
	font-size: 18px;
	color: purple;
}
</style>

<script type="text/javascript">
	var score = 0;
	var numQues = 0;

	function playAgain() {
		var res = confirm('Do you Wanna play again..!');
		if (res) {
			//console.log(" i value :: ${sessionScope.i}");
			return true;
			//window.location.replace("${pageContext.request.contextPath}/quizeGameUrl?action=user");
		} else {
			return false;
		}
	}

	function storeScore() {

		var userInput = document.querySelector('input[name="a"]:checked').value;
		//console.log(userInput);
		if (window.numQues == 0)
			var i = 0;

		window.numQues = ++i;
		var ans = document.querySelector('input[name="correctAns"]').value;
		//console.log(ans);

		if (userInput == ans) {
			window.score = window.score++;
		}
	}

	function calcResult() {
		var scoreper = Math.round(score / numQues * 100);
		alert(numQues);
		alert(score);
		alert(scoreper);
		if (scoreper < 40) {
			alert('You are Failed Try again...!');
			return false;
		} else {
			confirm('congratualation..! You are passed.');
			return true;
		}
	}

	function alertMsg() {
		alert('Sorry...! U R not Completed this step..! plz try again..!');
	}
</script>
<!-- This script will logout the page if give time is up -->
<script type="text/javascript">
	// Set timeout variables.
	var date = new Date().toLocaleString();
	var timoutNow = 30000; // Timeout in 30 secs.
	var pageName = "quiz PAGE";
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
		<br> <br>
		<div class="form_module">
			<h1 class="ui-puzzle-button" style="text-align: center;">
				<a href="puzzleGameUrl">Play Puzzle Game</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href=quizeGameUrl?action=user>Play Quiz Game</a>
			</h1>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-12">
				<div class="card mx-15">
					<div class="card-body p-10" align="center">
						<br />
						<%
							//Quize Result will be pass or fail after steps completed 
							//upto step 5 it will be null 
							if (request.getAttribute("quizResult") == null) {
						%>
								<form name="form1" action="quizeGameUrl?action=user" method="post">
									<h2 align="center">
										<font color="red">Online Quiz Game</font>
									</h2>
									<b>Select Correct Answer</b>
									<div style="text-align: right; color: #3512ea; font-family: inherit; font-size: x-large;">
										Mark : 1
									</div>
									<!-- if bo object is not empty -->
									<c:if test="${not empty requestScope.quizeGameBO}">
										<!-- iterate each object from list -->
										<table class="table">
										<tr>
											<th class="col">Question
											 	<%
													int i1 = (int) session.getAttribute("i");
														out.print(i1);
												%> : ${requestScope.quizeGameBO.questionName}
											</th>
											<input type="hidden" name="correctAns" value="${requestScope.quizeGameBO.correctAnswer}" />
										</tr>
										
										<tr>
											<td>
												1: <input type="radio" name="a" value="QA" required />
													&thinsp;&thinsp;&thinsp;&thinsp;
													${requestScope.quizeGameBO.optionA}
											</td>
										</tr>
										
										<tr>
											<td>
												2: <input type="radio" name="a" value="QB" required />
												&thinsp;&thinsp;&thinsp;&thinsp;
												${requestScope.quizeGameBO.optionB}
											</td>
										</tr>
										
										<tr>
											<td>
												3: <input type="radio" name="a" value="QC" required />
												&thinsp;&thinsp;&thinsp;&thinsp;
												${requestScope.quizeGameBO.optionC}
											</td>
										</tr>

										<tr>
											<td>
												4: <input type="radio" name="a" value="QD" required />
												&thinsp;&thinsp;&thinsp;&thinsp;
												${requestScope.quizeGameBO.optionD}
											</td>
										</tr>
										
										<tr>
											<td style="text-align: center;">
												<%
													int i = (int) session.getAttribute("i");
													//to get submit result button
													if (i == 4) {
												%> 
														<input type="hidden" value="to_add_submit_button"
														name="to_add_submit_button"> 
												<%
 													}
 													if (i == 9) {
 												%> 
 														<input type="hidden" value="to_add_submit_button"
														name="to_add_submit_button"> 
												<%
 													}

 													if (i == 14) {
									 			%> 
									 					<input type="hidden" value="to_add_submit_button"
														name="to_add_submit_button">
												<%
 													}

 													if (i == 5) {
 												%> 
 														<input type="hidden" value="step_completed" name="step_completed">
												<%
													} else if (i == 10) {			
												%> 
														<input type="hidden" value="step_completed"
														name="step_completed"> 
												<%
 													} else if (i == 15) {
 												%> 
 														<input type="hidden" value="step_completed"
														name="step_completed"> 
												<%
 													}

 													if (request.getAttribute("stepCompleted") != null) {
 														if (request.getAttribute("stepCompleted").equals("stepCompleted")) {
									 			%> 
															<input type="hidden" name="timeCounter" value="timeCounter"/>
															<input id="stepCompleted" class="btn btn-lg btn-primary" type="submit"
																value="submit Exam" name="submit_Exam"
																onclick="return playagain()"> 
																<input class="btn btn-secondary btn-lg" type="reset" value="cancel"
																name="cancel"> 
												<%
														}
 													} else {
 												%> 
 														<input type="hidden" name="timeCounter" value="timeCounter"/>
 														<input class="btn btn-lg btn-primary" type="submit" value="next"
														name="next"> <input class="btn btn-secondary btn-lg"
														type="reset" value="cancel" name="cancel"> <%
 													}
 												%>
											</td>
										</tr>
									</table>
								</c:if>
							</form>
						<%
							} else if (request.getAttribute("quizResult") != null) {
								if (request.getAttribute("quizResult").equals("Fail")) {
						%>
						<script>
							alertMsg();
							//	playAgain();
						</script>
						<form name="form1" action="quizeGameUrl?action=user" method="post">

							<h2 align="center">
								<font color="red">Online Quiz Game</font>
							</h2>

							<b>Select Correct Answer</b>

							<div
								style="text-align: right; color: #3512ea; font-family: inherit; font-size: x-large;">
								Mark : 1</div>
							<!-- if object is not empty -->
							<c:if test="${not empty requestScope.quizeGameBO}">
								<!-- iterate each object from list -->

								<table class="table">
									<tr>
										<th class="col">Question <%
											int i1 = (int) session.getAttribute("i");
														out.print(i1);
										%> : ${requestScope.quizeGameBO.questionName}
										</th>
										<input type="hidden" name="correctAns"
											value="${requestScope.quizeGameBO.correctAnswer}" />
									<tr>
										<td>1: <input type="radio" name="a" value="QA" required />
											&thinsp;&thinsp;&thinsp;&thinsp;
											${requestScope.quizeGameBO.optionA}
										</td>
									</tr>
									<tr>
										<td>2: <input type="radio" name="a" value="QB" required />
											&thinsp;&thinsp;&thinsp;&thinsp;
											${requestScope.quizeGameBO.optionB}
										</td>
									</tr>

									<tr>
										<td>3: <input type="radio" name="a" value="QC" required />
											&thinsp;&thinsp;&thinsp;&thinsp;
											${requestScope.quizeGameBO.optionC}
										</td>
									</tr>

									<tr>
										<td>4: <input type="radio" name="a" value="QD" required />
											&thinsp;&thinsp;&thinsp;&thinsp;
											${requestScope.quizeGameBO.optionD}
										</td>
									</tr>


									<tr>
										<td style="text-align: center;">
											<%
												int i = (int) session.getAttribute("i");
															System.out.println(" i ::" + i);

															if (i == 4) {
											%> <input type="hidden" value="to_add_submit_button"
											name="to_add_submit_button"> <%
 											}
 											if (i == 9) {
 												%> <input type="hidden" value="to_add_submit_button"
												name="to_add_submit_button"> <%
 											}

 											if (i == 14) {
 												%> <input type="hidden" value="to_add_submit_button"
												name="to_add_submit_button"> <%
 											}

 										if (i == 5) {
 												%> <input type="hidden" value="step_completed" name="step_completed">
												<%
											} else if (i == 10) {
												%> <input type="hidden" value="step_completed"
												name="step_completed"> <%
 											} else if (i == 15) {
 												%> <input type="hidden" value="step_completed"
												name="step_completed"> <%
 											}

 							if (request.getAttribute("stepCompleted") != null) {
 									System.out.println(
 											"sessionScope.countCompleted is " + request.getAttribute("countCompleted"));
 									if (request.getAttribute("stepCompleted").equals("stepCompleted")) {
 									System.out.println("sessionScope.countCompleted is ");
 										%> 
 											<input type="hidden" name="timeCounter" value="timeCounter"/>
 										<input type="hidden" value="completed" name="completed">
											<!-- <input type="hidden" value="0" name="sesIinitialize"> -->
											<!-- <input type="submit" value="CheckResult" name="checkResult" -->
											<input id="stepCompleted" class="btn btn-lg btn-primary" type="submit"
											value="submit Exam" name="submit_Exam"
											onclick="return playAgain()"> <input
											class="btn btn-secondary btn-lg" type="reset" value="cancel"
											name="cancel"> <%
 									}
 							} else {
								 %> 
								 	<input type="hidden" name="timeCounter" value="timeCounter"/>
								 <input class="btn btn-lg btn-primary" type="submit" value="next"
											name="next" onclick="storeScore()"> <input
											class="btn btn-secondary btn-lg" type="reset" value="cancel"
											name="cancel"> <%
 							}
 								%>
										</td>
									</tr>
								</table>
							</c:if>
						</form>
						<%
							} else if (request.getAttribute("quizResult").equals("pass")) {
									System.out.println(" quizResult != null else block  for pass");
									int i = (int) session.getAttribute("i");
									System.out.println(i);
									if (i == 6) {
						%>

						<script>
							alert('Congratulation You have completed First Step..!');
							//playAgain();
						</script>
						<%
							} else if (i == 11) {
						%>
						<script>
							alert('Congratulation You have completed Second Step..!');
							//playAgain();
						</script>
						<%
							} else if (i == 15) {
						%>
						<script>
							alert('Congratulation You have completed Third Step..!');
							window.location.href = "${pageContext.request.contextPath}/dashboardUrl";
						</script>
						<%
							}
						%>
						<form name="form1" action="quizeGameUrl?action=user" method="post">

							<h2 align="center">
								<font color="red">Online Quiz Game</font>
							</h2>

							<b>Select Correct Answer</b>
							<!-- if object is not empty -->
							<c:if test="${not empty requestScope.quizeGameBO}">
								<!-- iterate each object from list -->

								<table class="table">
									<tr>
										<th width="50%">Question <%
											int i1 = (int) session.getAttribute("i");
														out.print(i1);
										%> : ${requestScope.quizeGameBO.questionName}
										</th>
										<input type="hidden" name="correctAns"
											value="${requestScope.quizeGameBO.correctAnswer}" />
									<tr>
										<td>1: <input type="radio" name="a" value="QA" required />
											&thinsp;&thinsp;&thinsp;&thinsp;
											${requestScope.quizeGameBO.optionA}
										</td>
									</tr>
									<tr>
										<td>2: <input type="radio" name="a" value="QB" required />
											&thinsp;&thinsp;&thinsp;&thinsp;
											${requestScope.quizeGameBO.optionB}
										</td>
									</tr>

									<tr>
										<td>3: <input type="radio" name="a" value="QC" required />
											&thinsp;&thinsp;&thinsp;&thinsp;
											${requestScope.quizeGameBO.optionC}
										</td>
									</tr>

									<tr>
										<td>4: <input type="radio" name="a" value="QD" required />
											&thinsp;&thinsp;&thinsp;&thinsp;
											${requestScope.quizeGameBO.optionD}
										</td>
									</tr>

									<tr>
										<td style="text-align: center;">
											<%
												//int i = (int)session.getAttribute("i");
															System.out.println(" i ::" + i);
															if (i == 4) {
											%> <input type="hidden" value="to_add_submit_button"
											name="to_add_submit_button"> <%
 										}
 										if (i == 9) {
 											%> <input type="hidden" value="to_add_submit_button"
											name="to_add_submit_button"> <%
 										}

 										if (i == 14) {
 											%> <input type="hidden" value="to_add_submit_button"
											name="to_add_submit_button"> <%
 										}

 										if (i == 5) {
 											%> <input type="hidden" value="step_completed" name="step_completed">
											<%
												} else if (i == 10) {
											%> <input type="hidden" value="step_completed"
											name="step_completed"> <%
 										} else if (i == 15) {
 												%> <input type="hidden" value="step_completed"
											name="step_completed"> <%
 										}

 										if (request.getAttribute("stepCompleted") != null) {
 											
 											if (request.getAttribute("stepCompleted").equals("stepCompleted")) {
 											
 												%> 
												
												<input type="hidden" name="timeCounter" value="timeCounter"/>
												<input id="stepCompleted" class="btn btn-lg btn-primary" type="submit"
												value="submit Exam" name="submit_Exam"
												onclick="return playAgain()"> <input
												class="btn btn-secondary btn-lg" type="reset" value="cancel"
												name="cancel"> <%
 											}
 										} else {
 											%> 
 											<input type="hidden" name="timeCounter" value="timeCounter"/>
 											<input class="btn btn-lg btn-primary" type="submit" value="next"
											name="next" onclick="storeScore()"> <input
											class="btn btn-secondary btn-lg" type="reset" value="cancel"
											name="cancel"> <%
 										}
 							%>
										</td>
									</tr>
								</table>
							</c:if>
						</form>
						<!-- </td>	
							</tr>
						</table> -->
						<%
							}
							}
						%>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.easing-1.3.min.js"></script>
	<script src="assets/js/jquery.scrollTo-1.4.3.1-min.js"></script>
	<script src="assets/js/shop.js"></script>

	<script type="text/javascript">
		var timeSpended;

		$(document).ready(function() {
			// using static methods
			var date_now = new Date();
			$('#stepCompleted').click(function() {
				var date_future = new Date();
				// get total seconds between the times
				var delta = Math.abs(date_future- date_now) / 1000;

				// calculate (and subtract) whole days
				var days = Math.floor(delta / 86400);
				delta -= days * 86400;

				// calculate (and subtract) whole hours
				var hours = Math.floor(delta / 3600) % 24;
				delta -= hours * 3600;

				// calculate (and subtract) whole minutes
				var minutes = Math.floor(delta / 60) % 60;
				delta -= minutes * 60;

				// what's left is seconds
				var seconds = Math.floor(delta % 60); // in theory the modulus is not required
				timeSpended = hours + ":"+ minutes + ":"+ seconds;
				
				console.log(timeSpended);
			
				//	window.location
				//	.replace("${pageContext.request.contextPath}/gameUrl?timeSpended="
				//				+ timeSpended);
				console.log(timeSpended);

				//return false;
				});
		});
	</script>

</body>
</html>
