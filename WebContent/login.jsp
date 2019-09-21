<!DOCTYPE html>
<html lang="en">
<head>

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

	<style type="text/css">
			<!--
				.style11 {font-size: 1.3em;
					font-weight: bold;
				}
			-->
		</style>

		<script type="text/javascript">

			function isEmpty(str) {
				if (str == "") {
					return true;
				} else{
					return false;
				}
			}
	
			function validateAll() {
				var username = document.form1.username.value;
				var password = document.form1.password.value;
		
				if (isEmpty(username)) {
					alert("Please type username.");
					document.form1.username.focus();
					return false;
				} else if (isEmpty(password)) {
					alert("Please type  password.");
					document.form1.password.focus();
					return false;
				}else{
					return true;
				}
			}
		</script>
	</head>
	<body>
	
	<div class="slider_module">
		<div style="background-color: #cbf2f3" class="header">
			<h1 style="text-align: center;">Digital Game Based Learning</h1>
		</div>

		<div style="background-color: #aa372a" class="topnav">
			<a href="login.jsp">Home</a>
				<div style="background-color: #aa372a" class="topnav">
					<a href="registration.jsp">Registration</a>
				</div>
		</div>
	</div>
				<div class="row">
				</div>
			</div>
			<div class="copyright">
				<p>&nbsp;</p>
				<p>&nbsp;</p>
				<form name="form1" method="post" action="loginUrl?action=login"
						onSubmit="return validateAll()">
					<p>&nbsp;</p>
					<table width="296" height="170" border="0" align="center">
			<!-- 			<tr>
							<td width="75">Select User</td>
							<td width="190">
								<label> 
									<select name="SelectedUser" onchange=" 
      	document.getElementById('link-id').setAttribute('href', this.value);
       	 document.getElementById('link-id').innerHTML = this.value;"
								id="web">
									<option value="Admin">Admin</option>
									<option value="Users">Users</option>
								</select>
							</label>
						</td>
					</tr> -->
				<tr>
					<td width="81">
						<span class="style11">
							Username
						</span>
					</td>
					<td width="199">
						<label> 
							<input name="username" type="text" id="username" />
						</label>
					</td>
				</tr>
				<tr>
					<td>
						<span class="style11">
							Password
						</span>
					</td>
					<td>
						<label>
							 <input name="password" type="password" id="password" />
						</label>
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>
						<input type="submit" name="Submit" value="Login" />
					 	<input type="reset" name="Clear" value="Clear" />
					</td>
				</tr>
			</table>
			<p>&nbsp;</p>
		</form>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
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