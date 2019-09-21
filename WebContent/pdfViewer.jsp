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
	var pageName = "pdfViewer PAGE";
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
						<a id="gameID" href="${pageContext.request.contextPath}/gameUrl">Play Game</a>
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
		<div class="row"></div>
		<div class="slider_module"></div>
		<div class="app flex-row align-items-center">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-12">
						<div class="card mx-15">
							<div class="card-body p-10" align="center">
								<h1>PDF</h1>
							</div>
							<div class="form-group row">
								<label class="col-md-15 col-form-label" for="textarea-input"
									Style=""></label>
								<div class="col-md-12" style="text-align: center;">
									<object data="<c:url value="/pdf/formatingTextInPDF.pdf"/>" type="application/pdf" width="900" height="800" >
       									 <embed src="<c:url value="/pdf/formatingTextInPDF.pdf"/>" type="application/pdf" width="900" height="800"/>
   									 </object> 
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	
		<!-- <a href="#" class="gotop"><i class="icon-double-angle-up"></i></a> -->
		<!-- Placed at the end of the document so the pages load faster -->
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


			  $('a#gameID').click(function() {
				  
				// the event you'd like to time goes here:
				  //doSomethingForALongTime();
			  	/* 	var end = Date.now();
				 	var elapsed = end - start; // time in milliseconds
				 	var difference = new Date(elapsed);
				 	
					//If you really want the hours/minutes, 
					//Date has functions for that too:
					var diff_hours = difference.getHours();
					var diff_mins = difference.getMinutes();
					var diif_secs =difference.getSeconds();
					
			      	timeSpended = diff_hours+":"+diff_mins+":"+diif_secs;
			      	console.log(timeSpended); */
					//alert('inside gameID');
			      	
			      	var date_future = new Date();
			     // get total seconds between the times
			      	var delta = Math.abs(date_future - date_now) / 1000;

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
			      	var seconds = Math.floor(delta % 60);  // in theory the modulus is not required
			      	timeSpended = hours+":"+minutes+":"+seconds;
			      	console.log(timeSpended);
			      	
			      	window.location.replace("${pageContext.request.contextPath}/gameUrl?timeSpended="+timeSpended);
			      	console.log(timeSpended);
			      	
			      	return false;
			   });
			});
		
		</script>
	</body>
</html>