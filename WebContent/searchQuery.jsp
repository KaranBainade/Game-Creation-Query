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

<style>
/* Paste this css to your style sheet file or under head tag */
/* This only works with JavaScript, 
if it's not present, don't show loader */
.no-js #loader {
	display: none;
}

.js #loader {
	display: block;
	position: absolute;
	left: 100px;
	top: 0;
}

.se-pre-con {
	position: fixed;
	left: 0px;
	top: 0px;
	width: 100%;
	height: 100%;
	z-index: 9999;
	background: url(images/loader-128x/Preloader_2.gif) center no-repeat
		#fff;
}
</style>
<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.2/modernizr.js"></script> -->
<script src="assets/js/jquery.js"></script>

<style type="text/css">
.form_module {
	font-size: 22px6;
	color: purple;
	text-align: center;
}


</style>

<!-- This script will logout the page if give time is up -->
<script type="text/javascript">
	// Set timeout variables.
	var date = new Date().toLocaleString();
	var timoutNow = 30000; // Timeout in 30 secs.
	var pageName = "searchQuery PAGE";
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
	<div class="modal1" style="display: none">
		<div class="center"
			style="position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); -webkit-transform: translate(-50%, -50%); -moz-transform: translate(-50%, -50%); -o-transform: translate(-50%, -50%); -ms-transform: translate(-50%, -50%); font-size: 20px; padding: 5px; z-index: 100;">
			<img alt="" src="images/loader-128x/Preloader_2.gif" />
		</div>

	</div>
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
			<form id="form3" name="form3" method="post"
				action="searchQueryUrl?action=Search">
				&emsp;&emsp;&emsp;&emsp; &emsp; Subjects Name :: &emsp; Physics :: <input
					type="radio" value="Light" name="physics" checked="checked">
				Light &emsp; <input type="radio" value="Sound" name="physics">
				Sound &emsp; <input type="submit" name="Go" id="GO" value="Search">
			</form>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<c:if test="${!empty requestScope.site }">
		<div class="container">

			<div class="row justify-content-center">
				<div class="col-md-12">
					<div class="card mx-15">
						<div class="card-body p-10" align="center">

							<c:if test="${!empty requestScope.site }">
								<h3>Seed Sites</h3>
							</c:if>
						</div>
						<div class="form-group row">
							<label class="col-md-15 col-form-label" for="textarea-input"
								Style=""> </label>
							<div class="col-md-12">
								<c:if test="${!empty requestScope.site}">
									<table border="1" align="center">
										<thead>
											<tr>
												<!-- 	<th scope="col">#</th> -->
												<th scope="col">Seed Site</th>
												<!-- 	<th scope="col">Deep Site</th> -->
											</tr>
										</thead>
										<tbody>
											<tr>
												<td valign="top">
													<table class="table table-hover">
														<c:forEach var="link" items="${requestScope.site}"
															varStatus="loop">
															<tr>
																<td><a
																	href="${pageContext.request.contextPath}/deepWebSiteUrl?seedLink=${link}"
																	title="${pageContext.request.contextPath}/deepWebSiteUrl?seedLink=${link}">
																		<c:out value="${link}" />
																</a></td>
															</tr>
														</c:forEach>
													</table>
												</td>
											</tr>
										</tbody>
									</table>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<br>
	<!-- <div id="loader" style="text-align: center;"></div>  -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.easing-1.3.min.js"></script>
	<script src="assets/js/jquery.scrollTo-1.4.3.1-min.js"></script>
	<script src="assets/js/shop.js"></script>

</body>
</html>