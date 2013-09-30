<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registered</title>
<link rel="stylesheet" type="text/css" href="css/demo.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/animate-custom.css" />
<link rel="stylesheet" type="text/css" href="css/preference.css">
</head>

<body>

	<div class="container">
		<div class="codrops-top">
			<a href="index.html"> <strong>&laquo; Back Home </strong></a>
			<div class="clr"></div>
		</div>
 
<header> 
		<h1 style="font-size: 60px;">&lt;Corsola&gt;</h1>
		<h2>
			<span>Scheduling your life.</span>
		</h2>
		
</header>
<body>

<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td align="right"><b>Term:</b></td>
							<td align="left"><select
								name="ctl00$AppContent$CoTermDropDownList"
								onchange="javascript:setTimeout('__doPostBack(\'ctl00$AppContent$CoTermDropDownList\',\'\')', 0)"
								id="ctl00_AppContent_CoTermDropDownList">
									<option value="13/LF">Law 2013-14 Fall</option>
									<option selected="selected" value="13/UF">Ugrad	2013-14 Fall</option>
									<option value="13/US">Ugrad 2012-13 Spring</option>
								</select></td>
						</tr>
</table>

<div id="viewSched" align= "center" style="position: absolute; left: 600px">
	<form action="ViewScheduleServlet">
	
	<p class="login button">
		<input type="submit" value="View Schedule" />
	</p>


	
	</form>
</div>

</body>
</html>