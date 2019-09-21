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
<script>
	function validateForm(theForm) {

		if (theForm.quest.value == "") {
			//Please enter username
			alert("Please enter Question.");
			theForm.quest.focus();
			return false;
		}

		return true;
	}
</script>
</head>

<body>
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
		<br>
		<h1 style="text-align: center; color: red;">Quize Application</h1>
		<br>
		<div class="form_module"></div>
	</div>
	<div class="row justify-content-center">
		<div class="col-md-12">
			<div class="card mx-15">
				<div class="card-body p-10" align="center"></div>
				<div class="form-group row">
					<label class="col-md-15 col-form-label" for="textarea-input"
						Style=""> </label>
					<div class="col-md-12">
						<br> <br />
						<center>

							<table border="1" width="450px" bgcolor="pink" cellspacing="0"
								cellpadding="0">
								<tr>
									<td width="100%">
										<form method="POST" action="adminQuizUrl"
											onsubmit="return validateForm(this);">

											<h2 align="center">
												<font color="red">Quize Application Form</font>
											</h2>
											<table border="0" width="400px" cellspacing="2"
												cellpadding="4">
												<tr>
													<td width="50%"><b>Enter Question:</b></td>
													<td width="50%"><input type="text" name="quest"
														size="40" /></td>
												</tr>
												<tr>
													<td width="50%"><b>Enter Answer(A.):</b></td>
													<td width="50%"><input type="text" name="QA" size="40" />
													</td>
												</tr>
												<tr>
													<td width="50%"><b>Enter Answer(B.):</b></td>
													<td width="50%"><input type="text" name="QB" size="40" />
													</td>
												</tr>

												<tr>
													<td width="50%"><b>Enter Answer(C.):</b></td>
													<td width="50%"><input type="text" name="QC" size="40" />
													</td>
												</tr>

												<tr>
													<td width="50%"><b>Enter Answer(D.):</b></td>
													<td width="50%"><input type="text" name="QD" size="40" />
													</td>
												</tr>

												<tr>
													<td width="50%"><b>Correct Answer:</b></td>
													<td width="50%"><input type="text" name="correctAns"
														size="10" /></td>
												</tr>

											</table>
											<center>
												<p>
													<input type="submit" value="Submit" name="submit">
													<input type="reset" value="Reset" name="reset">
												</p>
											</center>
										</form>
									</td>
								</tr>
							</table>
						</center>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>

</html>
