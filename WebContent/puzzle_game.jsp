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

 <link href="css1/style.css" rel="stylesheet" />
    <link href="css1/image-puzzle.css" rel="stylesheet" />
    <script src="js/jquery-2.1.1.min.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script src="js/image-puzzle.js"></script>

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
<script type="text/javascript">
	
	var radionButtonValue;
	
	function stepCounter(){
		alert('in side stepCounter()');
		var stepCount = document.getElementsByClassName("stepCount").value;
		console.log('stepCount :: '+stepCount);
		
		
	}
	function timeCounter(){
		alert('in side timeCounter()');
		var timeCount = document.getElementsByClassName("timeCount").value;
		console.log('timeCount :: '+timeCount);
		
	}
	
	function isEmpty(str){
		if(str==""){
			return true;
		}else {
			return false;
		}
	}
	
	function getRadionButtonValue(){
		
		var modes = document.querySelector('input[name="level"]:checked').value;
		console.log(modes);
		
		window.radionButtonValue = modes;
	}
	
	function validateComment(){
		
		//displaaying appropriate alert msg to end user
		if(window.radionButtonValue == 3){ //if easy step completed then 
			alert('congratulations You have completed First Step...!');
		}else if(window.radionButtonValue == 4){
			alert('congratulations You have completed Second Step...!');
		}else if(window.radionButtonValue == 5){
			alert('congratulations You have completed Third Step...!');
		} 
	
		
		var stepCount = document.querySelector('.stepCount').innerHTML;
		var timeCount = document.querySelector('.timeCount').innerHTML;
		
		//var modes = document.querySelector('input[name="level"]:checked').value;
		//var modeValue
		console.log('stepCount ::'+stepCount);
		console.log('timeCount ::'+timeCount);
		console.log('radionButtonValue ::'+window.radionButtonValue);
		
		/* var mode = document.getElementById('levelPanel').value;
		var mode_value;
		
		if(window.radionButtonValue == 3){
		    mode_value = document.getElementById('easy').value;

		}else if(window.radionButtonValue == 4){
			mode_value = document.getElementById('medium').value;

		}else if(mode == 5){
			mode_value = document.getElementById('hard').value;
		}   
		
		//console.log(mode_value);
		console.log(modes); */
		//console.log('finish..!');

		//console.log("comment Textarea :: "+commentTextArea);
		
		window.location.replace("${pageContext.request.contextPath}/puzzleGameUpdatorUrl?stepCount="+stepCount+"&timeCount="+timeCount+"&modeValue="+window.radionButtonValue);
		return false;
		
		
		/* if(isEmpty(commentTextArea)){
			alert('please write comment ....!');
			return false;
		}
		else{
			alert('Thanks for writing comment..!')
			return true;
		} */ 
	}
	
</script>


<script>
        
        	//creating array of total image present in images foldersize
        	var images = new Array(${requestScope.totalImgCount});
        	console.log("array size is :: "+images.length);	
        	
        	//get session socpe query value button (Light OR Sound)
        	var query ='${sessionScope.redioButtonValue}';
        	console.log("redioButtonValue "+query);
        	//this loop will iterate upto array size and stored each image on array indexes.
        	 for (var i=0; i<images.length;i++){
        		images[i] = { src: "images/sample"+i+".png", title: query, question:''+query+''};
        	} 

          console.log(typeof images);

            $(function () {
                var gridSize = $('#levelPanel :radio:checked').val();
                console.log("gridsize :: "+gridSize)
                imagePuzzle.startGame(images, gridSize);
                $('#newPhoto').click(function () {
                    var gridSize = $('#levelPanel :radio:checked').val();  // Take the updated gridSize from UI.
                    imagePuzzle.startGame(images, gridSize);
                });

                $('#levelPanel :radio').change(function (e) {
                    var gridSize = $(this).val();
                    imagePuzzle.startGame(images, gridSize);
                });
            });
            function rules() {
                alert('Re arrange the image parts in a way that it correctly forms the picture. \nThe no. of steps taken will be counted.');
            }
            function about() {
                alert('Developed by xyz. \nHe can be contacted at: xyz@gmail.com');
            }
        </script>
<!-- This script will logout the page if give time is up -->
<script type="text/javascript">
	// Set timeout variables.
	var date = new Date().toLocaleString();
	var timoutNow = 30000; // Timeout in 30 secs.
	var pageName = "puzzle_game PAGE";
	var logoutUrl = '${pageContext.request.contextPath}/idleSessionLogoutUrl?page='+pageName+'&date='+date; // URL to logout page.


	let timeoutTimer;

	// Start timers.
	function StartTimers() {
		
		timeoutTimer = setTimeout("IdleTimeout()", timoutNow);
	}

	// Reset timers.
	function ResetTimers() {
		console.log('ResetTimers() called');
		console.log('timeoutTimer : ', timeoutTimer);
		clearTimeout(timeoutTimer);
		StartTimers();
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
	onmousewheel="ResetTimers();" onmouseout="ResetTimers();"
	ondrag="ResetTimers();">
	
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
		<div class="slider_module">
			<h1 class="ui-puzzle-button" style="text-align: center;">
				<a href="puzzleGameUrl">Play Puzzle Game</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href=quizeGameUrl?action=user>Play Quiz Game</a>
			</h1>
		
		</div>
		<div class="app flex-row align-items-center">
		
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-12">
						<div class="card mx-15">
							<div class="card-body p-10" align="center">
							</div>
							<div class="form-group row">
								<label class="col-md-15 col-form-label" for="textarea-input"
									Style="">
								</label>
								<div class="col-md-12">
   									<div id="collage">
        								<h2>Image Puzzle Game</h2>
        								<hr />
        								<div id="playPanel" style="padding:5px;display:none;">
           									 <h3 id="imgTitle"></h3> <hr />
           		 							<div style="display:inline-block; margin:auto; width:95%; vertical-align:top;">
                								<ul id="sortable" class="sortable"></ul>
                								<div id="actualImageBox">
                									<h3 id="imgQuestion"></h3><br/>
                    								<div id="stepBox">
                        								<div>Steps:</div><div class="stepCount">0</div>
                    								</div>
                    								<div id="timeBox">
                        								Time Taken: <span id="timerPanel"></span> secs
                    								</div>
                    								<img id="actualImage"/>
                    
                    								<div style="font-size:20px;'">&nbsp;&nbsp; &nbsp;&nbsp;
                    								&nbsp;&nbsp;
                    								Re-arrange to create a picture like this.</div>
                     								<br>
                    								<p id="levelPanel">&nbsp;&nbsp; &nbsp;&nbsp;
                    													&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    													&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    													
                        								<!-- only enble radio button if user completed first step -->
                        								<%
                        									if((int)session.getAttribute("session_modeValue") == 0){
                        								%>
                        									<input type="radio" name="level" id="easy"  value="3"  onchange="getRadionButtonValue()"/> <label for="easy">Easy</label>
                    										<input type="radio" name="level" id="medium" value="4" onchange="getRadionButtonValue()" disabled="disabled"/> <label for="medium">Medium</label>
                    										<input type="radio" name="level" id="hard" value="5"  onchange="getRadionButtonValue()" disabled="disabled"/> <label for="hard">Hard</label>
                    									<%
                        									}else if((int)session.getAttribute("session_modeValue") == 3){
                    									%>
                    										<input type="radio" name="level" id="easy"  value="3"  onchange="getRadionButtonValue()"/> <label for="easy">Easy</label>
                    										<input type="radio" name="level" id="medium" value="4" onchange="getRadionButtonValue()"/> <label for="medium">Medium</label>
                    										<input type="radio" name="level" id="hard" value="5"  onchange="getRadionButtonValue()" disabled="disabled"/> <label for="hard">Hard</label>
                    									<%
                        									}else if((int)session.getAttribute("session_modeValue") == 4){
                    									%>
                    										<input type="radio" name="level" id="easy"  value="3"  onchange="getRadionButtonValue()"/> <label for="easy">Easy</label>
                    										<input type="radio" name="level" id="medium" value="4" onchange="getRadionButtonValue()"/> <label for="medium">Medium</label>
                    										<input type="radio" name="level" id="hard" value="5"  onchange="getRadionButtonValue()"/> <label for="hard">Hard</label>
                    									<%
                    										}else if((int)session.getAttribute("session_modeValue") == 5){
                            									%>
                        										<input type="radio" name="level" id="easy"  value="3"   onclick="alert('Congratulation..! you have completed all steps..!');return false;"/> <label for="easy">Easy</label>
                        										<input type="radio" name="level" id="medium" value="4"  onclick="alert('Congratulation..! you have completed all steps..!');return false;"/> <label for="medium" >Medium</label>
                        										<input type="radio" name="level" id="hard" value="5"   onclick="alert('Congratulation..! you have completed all steps..!');return false;"/> <label for="hard" >Hard</label>
                        									<%
                    										}
                    									%>
                    								</p>
                   
                    							<div>
                     								&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      								&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      	 							&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        							<button id="btnRule" type="button" class="btn" onclick="rules();">Rules</button>
                        							<button id="newPhoto" type="button" class="btn">Another Photo</button>
                    							</div>
                							</div>
            							</div>
        							</div>
        							<br><br><br>
        							<div id="gameOver" style="display:none;">
            							<div style="background-color: #fc9e9e; padding: 5px 10px 20px 10px; text-align: center; ">
            							
                							<h2 style="text-align:center">Game Over!!</h2>
                							Congratulations!! <br /> You have completed this Game.
                							<br />
                							Steps: <span class="stepCount">0</span> steps.
                								
                							<br />
                							Time Taken: <span class="timeCount">0</span> seconds<br />
                							
                							<div>
                						 	<form action="puzzleGameUpdatorUrl" method="post" onSubmit="return validateComment()">
                								<%-- <%=
                									//session.setAttribute("hiddenModeValue", session.getAttribute("modeValue"))
                								%> --%>
                    							<input type="submit" value="Play Again">
                							</form> 
                							</div>
                							<!-- Now stored Mode value in database i.e (3 = easy, 4 = medium ,5 = hard -->
                							<%
                								//int radionButtonValue = (int)session.getAttribute("modeValue");
                								System.out.println("selected radio button value is :: "+request.getParameter("level"));
                								//System.out.println("selected value is : "+radionButtonValue);
                								//session.setAttribute("modeValue", radionButtonValue);
                							%>
            							</div>
            							<br><br><br>
             							<%-- <div style="background-color: white; padding: 5px 10px 20px 10px; text-align: center; ">
        									<form action="${pageContext.request.contextPath}/commentUrl" method="post" name="commentForm" onSubmit="return validateComment()">
        										<h4 style="color:blue;">Give Your Comment :: </h4>
        										<textarea rows="2" cols="30" name="commentTextArea" id="commentID">
        										</textarea><br>
        										
        										<input type="submit" value="submit" name="comment">
        									</form>
        								</div> --%>
        							</div>
   								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</body>
</html>