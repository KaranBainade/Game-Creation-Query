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

.form_module{
		font-size: 18px;
		color: purple;
}

.loader {
  border: 16px solid #f3f3f3; /* Light grey */
  border-top: 16px solid #3498db; /* Blue */
  border-radius: 50%;
  width: 120px;
  height: 120px;
  animation: spin 2s linear infinite;
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
</style>
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
								<a href="/logoutUrl">Logout</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br><br><br><br>
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-12">
					<div class="card mx-15">
						<div class="card-body p-10" align="center">
							<h3>Seed Sites &  Deep Pages</h3>
						</div>
						<div class="form-group row">
							<label class="col-md-15 col-form-label" for="textarea-input"Style="">
							</label>
							<div class="col-md-12">
								<table border="1" align="center" >
									<tr>
										<th scope="col">Seed Site </th>
										<th scope="col">Deep pages </th>
									</tr>
									<tr>
										<td valign="top"  >
   											 <table class="table table-hover">
												<c:forEach var="link" items="${requestScope.seedSite2}"  varStatus="loop" >
													<tr>
    													<td>
    														<a  href="${pageContext.request.contextPath}/deepWebSiteUrl?seedLink=${link}" title="${pageContext.request.contextPath}/deepWebSiteUrl?seedLink=${link}"> 
    															<c:out value="${link}"/>
    														</a>
    													</td>
    												</tr>
    											</c:forEach>  
    										</table>
    									</td>
    									<td valign="top">
    										<table class="table table-hover" > 
    											<c:forEach var="deep" items="${requestScope.deep}"> 
    												<tr>
                            							<td>
                            								<a href="pdfGanerateUrl?action=<c:out value="${deep}" />" title="pdfGanerateUrl?action=<c:out value="${deep}"/>">
                            									<c:out value="${deep}" />
                            								</a>
                            							</td>
                    							 	</tr>
												</c:forEach> 
											</table>
    									</td>										
    								</tr>
    							</table>
							</div>
						</div>
					</div>
				</div>
			<!-- </div> -->
		</div>
	</div>
	<!-- <a href="#" class="gotop"><i class="icon-double-angle-up"></i></a> -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.easing-1.3.min.js"></script>
	<script src="assets/js/jquery.scrollTo-1.4.3.1-min.js"></script>
	<script src="assets/js/shop.js"></script>
	
</body>
</html>