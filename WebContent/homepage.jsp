<!DOCTYPE html>
<html lang="en">
<head>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<link href="css/dashboard_ui.css" rel="stylesheet" type="text/css" />
<!-- Main styles for this application -->
<link href="css/style.css" rel="stylesheet">

	<!-- Bootstrap and necessary plugins -->
	<script src="vendors/js/jquery.min.js"></script>
	<script src="vendors/js/popper.min.js"></script>
	<script src="vendors/js/bootstrap.min.js"></script>

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
</style>

<script type="text/javascript">
function confirmMsgForPuzzleGame(){
	
	var yes = confirm('Do you want play once again From First Step(Puzzle Game) ?');
	if(yes){
		window.location.replace("${pageContext.request.contextPath}/gameUrl?action=playOnceAgainPuzzleGame");
		//return true;
	}
	return false;
}

function confirmMsgForQuizGame(){
	
	var yes = confirm('Do you want play once again From First Step(Quiz Game) ?');
	if(yes){
		window.location.replace("${pageContext.request.contextPath}/gameUrl?action=playOnceAgainQuizGame");
		//return true;
	}
	return false;
}

</script>


<!-- This script will logout the page if give time is up -->
<script type="text/javascript">
	// Set timeout variables.
	var date = new Date().toLocaleString();
	var timoutNow = 30000; // Timeout in 30 secs.
	var pageName = "homepage";
	var logoutUrl = '${pageContext.request.contextPath}/idleSessionLogoutUrl?page='+pageName+'&date='+date; // URL to logout page.


	var timeoutTimer;

	// Start timers.
	function StartTimers() {
		
		timeoutTimer = setTimeout("IdleTimeout()", timoutNow);
	}

	// Reset timers.
	function ResetTimers() {
		console.log('before ,',timeoutTimer);
		clearTimeout(timeoutTimer);
		
		StartTimers();
		console.log('after ,',timeoutTimer);
		//$("#timeout").dialog().dialog('close');
	}

	// Show idle timeout warning dialog.
	/* function IdleWarning() {
		$("#timeout").dialog({
			modal : true
		});
	} */

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
						<a href="${pageContext.request.contextPath}/gameUrl">Play Game</a>
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
	<br>
	<div class="container">
		<div class="justify-content-between-align-items-center">
			<div
				class="community-header-breadcrumb-community-header-breadcrumb-items">
				<div class="page-label">
					<h1 style="    color: #2874e6cc;">Wel-come ${sessionScope.userName }....!</h1>
				</div>
			</div>
		</div>
		<div class="community-content">
			<div class="dashboard-page">
			
				<!-- <div class="v2-section-header"> -->
					<div class="para-headline">
						<div style="text-align: center;">Game Status</div>	
					<!-- </div> -->
				</div>
				<div class="track-rows">
					<div class="puzzle-card-box">
						<div class="puzzle-ui-card">
							<h3 class="puzzle-game-title" title="Puzzle Game">Puzzle
								game</h3>
							<div class="text-content">
								<div class="skill-progress-bar">
									<div class="ui-puzzle-progress-bar">
										<div class="progress-filler"
											style="width: <%=request.getAttribute("dash-Mode-Value")%>%;">

										</div>
									</div>
									<div class="progress-count text-content">
										<span class="percentage"><%=request.getAttribute("dash-Mode-Value")%>%</span>
										<span class="point-left">( <%=request.getAttribute("pointLeftValue")%>/3
											steps completed)
										</span>
									</div>
								</div>
							</div>
							<!-- <button class="ui-puzzle-button" value="contiue to play">
								contiue to play
							</button> -->

							<form action="gameUrl" method="post">

								<%
									if ((Integer) request.getAttribute("dash-Mode-Value") == 100) {
								%>
								<input class="ui-puzzle-button" type="submit" value="completed"
									onclick="return confirmMsgForPuzzleGame()" />
								<%
									} else {
								%>
								<input class="ui-puzzle-button" type="submit"
									value="contiue to play" />
								<%
									}
								%>

							</form>
						</div>
					</div>
					
						<c:if test="${ ! empty sessionScope.firstModePuzzleTime}">
						<div class="puzzle-card-box">
							<div class="puzzle-ui-card">
								<h3 class="puzzle-game-title" title="Puzzle Game">Puzzle game
									slide movement steps and Time.</h3>
								<div class="text-content">
									<div class="row">
									
										<!-- First step  -->
										<div class="col-lg-4">
											<c:if test="${! empty sessionScope.firstModePuzzleTime }">
												<b> First step stats </b><br>
												================
												tile moves count: ${sessionScope.firstModePuzzleTime}<br />
												time taken: ${sessionScope.firstModeStepsCount} secs.<br/><br/>
												
												<%-- <c:if test="${ empty sessionScope.secondStepResult }">
													All Over Game Stats <br/>
													Total Marks :  ${sessionScope.firstStepResult[2]}/5<br/>
													Percentage : ${sessionScope.firstStepResult[3]}<br/>
												</c:if> --%>
											</c:if>
										</div>
										
										<!-- second step  -->
										<div class="col-lg-4">
											<c:if test="${! empty sessionScope.secondModePuzzleTime }">
												<b> Second step stats </b><br>
												================
												tile moves count: ${sessionScope.secondModePuzzleTime}<br />
												time taken: ${sessionScope.secondModeStepsCount } secs.<br/>
												
												<%-- <c:if test="${ empty sessionScope.secondPuzzleTime }">
													All Over Game Stats <br/>
													Total Marks :  ${sessionScope.secondStepResult[2]}/10<br/>
													Percentage : ${sessionScope.secondStepResult[3]}<br/>
												</c:if> --%>
												 
											</c:if>
										</div>
										
										<!-- third step -->
										<div class="col-lg-4">
											<c:if test="${! empty sessionScope.thirdModePuzzleTime }">
												<b> Third step stats </b>	<br />
												================
										 		tile moves count: ${sessionScope.thirdModePuzzleTime} <br/>
												time taken: ${sessionScope.thirdModeStepsCount} secs. <br/><br/>
											<%-- 	All Over Game Stats <br/>
												Total Marks :  ${sessionScope.thirdStepResult[2]}/15<br/>
												Percentage : ${sessionScope.thirdStepResult[3]}<br/> --%>
											</c:if>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:if>
									
					<div class="puzzle-card-box">
						<div class="puzzle-ui-card">
							<h3 class="puzzle-game-title" title="Puzzle Game">Quiz game</h3>
							<div class="text-content">
								<div class="skill-progress-bar">
									<div class="ui-puzzle-progress-bar">
										<div class="progress-filler"
											style="width: <%=request.getAttribute("quizGameStepPercantage")%>%;">
										</div>
									</div>
									<div class="progress-count text-content">
										<span class="percentage"><%=request.getAttribute("quizGameStepPercantage")%>%</span>
										<span class="point-left">( <%=request.getAttribute("poiLeftValueForQuizGame")%>/3
											steps completed)
										</span>
									</div>
								</div>
							</div>
							<!-- <button class="ui-puzzle-button" value="contiue to play">
								contiue to play
							</button> -->

							<form action="quizeGameUrl?action=user" method="post">
								<%
									if ((Integer) request.getAttribute("quizGameStepPercantage") == 100) {
								%>
								<input class="ui-puzzle-button" type="submit" value="completed"
									onclick="return confirmMsgForQuizGame()" />
								<%
									} else if ((Integer) request.getAttribute("quizGameStepPercantage") == 0) {
								%>
								<input class="ui-puzzle-button" type="submit"
									value="contiue to play" />
								<%
									} else {
								%>
								<input class="ui-puzzle-button" type="submit"
									value="contiue to play" />
								<%
									}
								%>
							</form>
						</div>
					</div>
					<c:if test="${ ! empty sessionScope.firstStepResult}">
						<div class="puzzle-card-box">
							<div class="puzzle-ui-card">
								<h3 class="puzzle-game-title" title="Puzzle Game">Quiz game
									Marks and Percentage.</h3>
								<div class="text-content">
									<div class="row">
									
										<!-- First step  -->
										<div class="col-lg-4">
											<c:if test="${! empty sessionScope.firstStepResult }">
												<b> First step stats </b><br>
												================
												Marks : ${sessionScope.firstStepResult[0]}/5<br />
												percentage : ${sessionScope.firstStepResult[1]}%<br/><br/>
												
												<c:if test="${ empty sessionScope.secondStepResult }">
													All Over Game Stats <br/>
													================
													Total Marks :  ${sessionScope.firstStepResult[2]}/5<br/>
													Percentage : ${sessionScope.firstStepResult[3]}<br/>
												</c:if>
											</c:if>
										</div>
										
										<!-- second step  -->
										<div class="col-lg-4">
											<c:if test="${! empty sessionScope.secondStepResult }">
												<b> Second step stats </b><br>
												================
												Marks : ${sessionScope.secondStepResult[0]}/5<br />
												percentage : ${sessionScope.secondStepResult[1]}% <br/><br/>
												<c:if test="${ empty sessionScope.thirdStepResult }">
													All Over Game Stats <br/>
													================
													Total Marks :  ${sessionScope.secondStepResult[2]}/10<br/>
													Percentage : ${sessionScope.secondStepResult[3]}<br/>
												</c:if>
											</c:if>
										</div>
										
										<!-- third step -->
										<div class="col-lg-4">
											<c:if test="${! empty sessionScope.thirdStepResult }">
												<b> Third step stats </b>	<br />
												================
										 		Marks : ${sessionScope.thirdStepResult[0]}/5<br />
												percentage : ${sessionScope.thirdStepResult[1]}% <br/><br/>
												All Over Game Stats <br/>
												================
												Total Marks :  ${sessionScope.thirdStepResult[2]}/15<br/>
												Percentage : ${sessionScope.thirdStepResult[3]}<br/>
											</c:if>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:if>

				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
     $(document).ready(function () {
    	 	<%if ((Integer) request.getAttribute("quizGameStepPercantage") == 34) {%>
        	    var val =  confirm("You have failed in second step(Quiz Game) Do You want to continue ? ");
        	 	if(val == true){
        	 		document.location.href="quizeGameUrl?action=user";
        	   	 } 
     		<%} else if ((Integer) request.getAttribute("quizGameStepPercantage") == 65) {%>
            	    var val =  confirm("You have failed in Third step(Quiz Game) Do You want to continue ? ");
            	 	if(val == true){
            	 		document.location.href="quizeGameUrl?action=user";
            	   	 } 
         		<%}%>
     	<%-- 	
     		<%
	 		if ((Integer) request.getAttribute("dash-Mode-Value") == 34){
	 		%>
    	    var val =  confirm("You have failed in second step(Puzzle Game) Do You want to continue ? ");
    	 	if(val == true){
    	 		document.location.href="gameUrl";
    	   	 } 
 		<%
 			}else if((Integer) request.getAttribute("dash-Mode-Value") == 65){
 	    	 	%>
        	    var val =  confirm("You have failed in Third step(Puzzle Game) Do You want to continue ? ");
        	 	if(val == true){
        	 		document.location.href="gameUrl";
        	   	 } 
     		<%
     		}
 		%> --%>
     		
     		
     });
 	</script>
</body>
</html>