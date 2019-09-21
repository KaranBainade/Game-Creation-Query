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
		
			function isEmpty(str){
				if(str==""){
					return true;
				}else {
					return false;
				}
			}

			function isPosInteger(num){
				if(!(isNaN(num))){
					if(num>0){ 
						return true;
					}
				}else{
					return false;
				}
			}

			function check(str1,str2){
				if(str1==str2){
					return false;
				}else{ 
					return true;
				}
			}

			function checkEmail() {
     			var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

    			if (!filter.test(email.value)) {
    				alert('Please provide a valid email address');
    				email.focus;
    				return true;
 				}
			}

			function validateAll() {
		
				var fname = document.form1.fname.value;
				var address = document.form1.address.value; 
				var email = document.form1.email.value; 
				var contact = document.form1.contact.value;
				var uname = document.form1.uname.value;
				var password = document.form1.password.value;
				var cpassword = document.form1.cpassword.value;


				if (isEmpty(fname)) {
					alert("Please type First name.");
					document.form1.fname.focus();
					return false;
			
				}else if (isEmpty(email)) {
					alert("Please type your Email id.");
					document.form1.email.focus();
					return false;
			
				}else if (checkEmail(email)) {
					alert("email did not match");
					document.form1.email.focus();
					return false;
			
				}else if (isEmpty(contact)) {
			
					alert("Please type your Mobile no.");
					document.form1.contact.focus();
					return false;
			
				}else if (!isPosInteger(contact)) {
					alert("Please Enter positive Integer number.");
					document.form1.contact.focus();
					return false;
			
				}else if (isEmpty(uname)) {
					alert("Please type your Username");
					document.form1.uname.focus();
					return false;
			
				}else if (isEmpty(password)) {
					alert("Please type your Password");
					document.form1.password.focus();
					return false;
			
				}else if (isEmpty(cpassword)) {
					alert("Please type your Conform Password");
					document.form1.cpassword.focus();
					return false;
			
				}else if (check(password, cpassword)) {
					alert("password did not match");
					document.form1.cpassword.focus();
					return false;
			
				}else if (isEmpty(address)) {
					alert("Please type  Address.");
					document.form1.address.focus();
					return false;
				}
				else{
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
			<a href="login.jsp">Login</a>
				<div style="background-color: #aa372a" class="topnav">
					<a href="registration.jsp">Registration</a>
				</div>
		</div>
	</div>
			<!-- Body Section -->
			<div class="row"></div>
			<!-- Clients --><!--Footer-->
		</div>
		<!-- /container -->
		<div class="copyright">
  			<p>&nbsp;</p>
  				<form name="form1" method="post" action="registerationUrl?action=register" onSubmit="return validateAll()">
    				<table width="529" border="0" align="center">
      					<!-- <tr>
        					<td>
        						<span class="style11">SELECT USER</span>
        					</td>
        					<td width="190">
        						<label>
									<select name="SelectUser" onchange=" 
       									 document.getElementById('link-id').setAttribute('href', this.value);
       				 					document.getElementById('link-id').innerHTML = this.value;" id="web" >
            		 					<option value="Admin">Admin</option>
              		  					<option value="Users">Users</option>
									</select> 
	        					</label>
	     					</td>
      					</tr> -->
      					<tr>
        					<td>
        						<span class="style11">NAME </span>
        					</td>
        					<td>
        						<label>
        							<input name="name" type="text" id="fname" />
        						</label>
       						 </td>
     					 </tr>
      					 <tr>
       						 <td>
       						 	<span class="style11">EMAIL</span>
       						 </td>
       						 <td>
       						 	<label>
       						 		<input name="email" type="text" id="email" />
       						 	</label>
        					</td>
      					</tr>
      					<tr>
       						<td>
       							<label>
       								<span class="style11">CONTACT NUMBER </span>
       							</label>
       						</td>
        					<td>
        						<label>
        							<input name="contact" type="text" id="contact" maxlength="10" />
        						</label>
 					       </td>
      					</tr>
      					<tr>
       					 	<td>
       					 		<span class="style11">DOB</span>
       					 	</td>
        					<td>
        						<label>
        							<input name="DOB" type="text" id="dob" />
        						</label>
        					</td>
     					 </tr> 
      					<tr>
        					<td>
        						<span class="style11">USERNAME</span>
        					</td>
        					<td>
        						<label>
        							<input name="uname" type="text" id="uname" />
        						</label>
        					</td>
    					 </tr> 
      					 <tr>
       						<td>
       					 		<span class="style11">PASSWORD</span>
       					 	</td>
        				 	<td>
        				 		<label>
        				 			<input name="password" type="password" id="password" />
        				 		</label>
        				 	</td>
      					</tr>
      					<tr>
        					<td>
        						<span class="style11">Confirm PASSWORD</span>
        					</td>
        					<td>
        						<label>
          							<input name="cpassword" type="password" id="cpassword" />
        						</label>
        					</td>
     					 </tr>
      
      					<tr>
        					<td>
        						<span class="style11">ADDRESS</span>
        					</td>
        					<td>
        						<label>
        							<input name="address" type="text" id="address" />
        						</label>
        					</td>
      					</tr>
      					
      					<tr>
        					<td colspan="2">
        						<div align="center">
        							<label>
          	  							<input type="submit" name="Submit" value="Submit" />
          	  						</label>
          	  						&nbsp;&nbsp;&nbsp;
          	  						<label>
           				 				<input type="reset" name="Clear" value="Clear" />
           				 			</label>
        						</div>
       						</td>
      					</tr>
    			</table>
    			<p>&nbsp;</p>
   				<p>&nbsp;</p>
   				<p>&nbsp;</p>
    			<p>&nbsp;</p>
  			</form>
  				<p>&nbsp;</p>
  				<p>&nbsp;</p>
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