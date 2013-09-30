<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="objects.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Corsola - Pick your Preferred Courses</title>
<link rel="shortcut icon"
	href="http://www.wlu.edu/prebuilt/v2css/images/favicon.ico">
<link rel="stylesheet" type="text/css" href="css/demo.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/preference.css">
<link rel="stylesheet" type="text/css" href="css.php" media="all">
<link rel="stylesheet" type="text/css" href="css/SyntaxHighlighter.css">
<link rel="stylesheet" type="text/css" href="css/table.css">
<script type="text/javascript" src="javascript/main.js"></script>
<script type="text/javascript" src="javascript/jquery.js"></script>
<script type="text/javascript" src="javascript/shCore.js"></script>
<script type="text/javascript" src="javascript/shBrushJScript.js"></script>
<script type="text/javascript" src="javascript/table.js"></script>
</head>
<body>
	<div class="container">
		<div class="codrops-top">
			<a href="index.html"> <strong>&laquo; Back Home </strong></a>
			<div class="clr"></div>
		</div>
		<header> <!-- <section>
				<div id="navbar">
					<ul id="list-nav">
						<li id="first"><a href="#">Home</a></li>
						<li><a href="#">About Us</a></li>
						<li><a href="#">Services</a></li>
						<li><a href="#">Products</a></li>
						<li id="last"><a href="#">Contact</a></li>
					</ul>
				</div>
			</section>
			<br> <br> <br>  -->
		<h1 style="font-size: 60px;">&lt;Corsola&gt;</h1>
		<h2>
			<span>Scheduling your life.</span>
		</h2>
		</header>
		<div id="wrapper">
			<div id="login" class="animate form">
				<form method="post" action="CorsolaServlet">
					<div class="but">
						<input type="submit" name="submit"
							value="Submit Preferred Courses" /> 
						<input type="reset"
							name="reset" value="Clear List" />
					</div>
					<br />
					<!-- <table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td align="right"><b>Term:</b></td>
							<td align="left"><select
								name="ctl00$AppContent$CoTermDropDownList"
								onchange="javascript:setTimeout('__doPostBack(\'ctl00$AppContent$CoTermDropDownList\',\'\')', 0)"
								id="ctl00_AppContent_CoTermDropDownList">
									<option value="13/LF">Law 2013-14 Fall</option>
									<option selected="selected" value="13/UF">Ugrad
										2013-14 Fall</option>
									<option value="13/US">Ugrad 2012-13 Spring</option>
									<option value="13/LS">Law 2012-13 Spring</option>
									<option value="13/UW">Ugrad 2012-13 Winter</option>
									<option value="12/LF">Law 2012-13 Fall</option>
									<option value="12/UF">Ugrad 2012-13 Fall</option>
									<option value="12/US">Ugrad 2011-12 Spring</option>
									<option value="12/LS">Law 2011-12 Spring</option>
									<option value="12/UW">Ugrad 2011-12 Winter</option>
									<option value="11/LF">Law 2011-12 Fall</option>
									<option value="11/UF">Ugrad 2011-12 Fall</option>
									<option value="11/US">Ugrad 2010-11 Spring</option>
									<option value="11/LS">Law 2010-11 Spring</option>
									<option value="11/UW">Ugrad 2010-11 Winter</option>
									<option value="10/LF">Law 2010-11 Fall</option>
									<option value="10/UF">Ugrad 2010-11 Fall</option>
									<option value="10/US">Ugrad 2009-10 Spring</option>
									<option value="10/LS">Law 2009-10 Spring</option>
									<option value="10/UW">Ugrad 2009-10 Winter</option>
									<option value="09/LF">Law 2009-10 Fall</option>
									<option value="09/UF">Ugrad 2009-10 Fall</option>
									<option value="09/US">Ugrad 2008-09 Spring</option>
									<option value="09/UW">Ugrad 2008-09 Winter</option>
									<option value="08/UF">Ugrad 2008-09 Fall</option>
									<option value="08/US">Ugrad 2007-08 Spring</option>
									<option value="08/UW">Ugrad 2007-08 Winter</option>
									<option value="07/UF">Ugrad 2007-08 Fall</option>
									<option value="07/US">Ugrad 2006-07 Spring</option>
									<option value="07/UW">Ugrad 2006-07 Winter</option>
									<option value="06/UF">Ugrad 2006-07 Fall</option>
									<option value="06/US">Ugrad 2005-06 Spring</option>
									<option value="06/UW">Ugrad 2005-06 Winter</option>
									<option value="05/UF">Ugrad 2005-06 Fall</option>
									<option value="05/US">Ugrad 2004-05 Spring</option>
									<option value="05/UW">Ugrad 2004-05 Winter</option>
									<option value="04/UF">Ugrad 2004-05 Fall</option>
									<option value="04/US">Ugrad 2003-04 Spring</option>
									<option value="04/UW">Ugrad 2003-04 Winter</option>
									<option value="03/UF">Ugrad 2003-04 Fall</option>
									<option value="03/US">Ugrad 2002-03 Spring</option>
									<option value="03/UW">Ugrad 2002-03 Winter</option>
									<option value="02/UF">Ugrad 2002-03 Fall</option>
									<option value="02/US">Ugrad 2001-02 Spring</option>
									<option value="02/UW">Ugrad 2001-02 Winter</option>
									<option value="01/UF">Ugrad 2001-02 Fall</option>
									<option value="01/US">Ugrad 2000-01 Spring</option>
									<option value="01/UW">Ugrad 2000-01 Winter</option>
									<option value="00/UF">Ugrad 2000-01 Fall</option>
									<option value="00/US">Ugrad 1999-00 Spring</option>
									<option value="00/UW">Ugrad 1999-00 Winter</option>
									<option value="99/UF">Ugrad 1999-00 Fall</option>
									<option value="99/US">Ugrad 1998-99 Spring</option>
									<option value="99/UW">Ugrad 1998-99 Winter</option>
									<option value="98/UF">Ugrad 1998-99 Fall</option>
									<option value="98/US">Ugrad 1997-98 Spring</option>
									<option value="98/UW">Ugrad 1997-98 Winter</option>
									<option value="97/UF">Ugrad 1997-98 Fall</option>
									<option value="97/US">Ugrad 1996-97 Spring</option>
									<option value="97/UW">Ugrad 1996-97 Winter</option>
									<option value="96/UF">Ugrad 1996-97 Fall</option>
									<option value="96/US">Ugrad 1995-96 Spring</option>
									<option value="96/UW">Ugrad 1995-96 Winter</option>
									<option value="95/UF">Ugrad 1995-96 Fall</option>
									<option value="95/US">Ugrad 1994-95 Spring</option>
									<option value="95/UW">Ugrad 1994-95 Winter</option>
									<option value="94/UF">Ugrad 1994-95 Fall</option>
									<option value="94/US">Ugrad 1993-94 Spring</option>
									<option value="94/UW">Ugrad 1993-94 Winter</option>
									<option value="93/UF">Ugrad 1993-94 Fall</option>
									<option value="93/US">Ugrad 1992-93 Spring</option>
									<option value="93/UW">Ugrad 1992-93 Winter</option>
									<option value="92/UF">Ugrad 1992-93 Fall</option>
									<option value="92/US">Ugrad 1991-92 Spring</option>
									<option value="92/UW">Ugrad 1991-92 Winter</option>
									<option value="91/UF">Ugrad 1991-92 Fall</option>
									<option value="91/US">Ugrad 1990-91 Spring</option>
									<option value="91/UW">Ugrad 1990-91 Winter</option>
									<option value="90/UF">Ugrad 1990-91 Fall</option>
									<option value="90/US">Ugrad 1989-90 Spring</option>
									<option value="90/UW">Ugrad 1989-90 Winter</option>
									<option value="89/UF">Ugrad 1989-90 Fall</option>
									<option value="89/US">Ugrad 1988-89 Spring</option>
									<option value="89/UW">Ugrad 1988-89 Winter</option>
									<option value="88/UF">Ugrad 1988-89 Fall</option>
									<option value="88/US">Ugrad 1987-88 Spring</option>
									<option value="88/UW">Ugrad 1987-88 Winter</option>
									<option value="87/UF">Ugrad 1987-88 Fall</option>
									<option value="87/US">Ugrad 1986-87 Spring</option>
									<option value="87/UW">Ugrad 1986-87 Winter</option>
									<option value="86/UF">Ugrad 1986-87 Fall</option>
									<option value="86/US">Ugrad 1985-86 Spring</option>
									<option value="86/UW">Ugrad 1985-86 Winter</option>
									<option value="85/UF">Ugrad 1985-86 Fall</option>
									<option value="85/US">Ugrad 1984-85 Spring</option>
									<option value="85/UW">Ugrad 1984-85 Winter</option>
									<option value="84/UF">Ugrad 1984-85 Fall</option>
									<option value="83/US">Ugrad 1983-84 Spring</option>
									<option value="83/UW">Ugrad 1983-84 Winter</option>
									<option value="83/UF">Ugrad 1983-84 Fall</option>

							</select></td>

							<td align="right"><b>Faculty:</b></td>
							<td align="left" style="white-space: nowrap;"><select
								name="ctl00$AppContent$CoFacultyDropDownList"
								onchange="javascript:setTimeout('__doPostBack(\'ctl00$AppContent$CoFacultyDropDownList\',\'\')', 0)"
								id="ctl00_AppContent_CoFacultyDropDownList">
									<option selected="selected" value="-Any-">-Any-</option>
									<option value="9999999">-STAFF-</option>
									<option value="1203737">Abah, Adedayo O. (Dayo)</option>
									<option value="1623232">Abell, Scott P.</option>
									<option value="1713144">Abrams, Aaron D.</option>
									<option value="1443564">Abry, Andrea C.</option>
									<option value="0722917">Adams, Edward A.</option>
									<option value="1710319">Alexander, Raquel M.</option>
									<option value="0237204">Alty, Lisa T.</option>
									<option value="0540573">Anderson, Michael A.</option>
									<option value="1572965">Archer Lyle, Clover</option>
									<option value="0908870">Artwick, Claudette G.</option>
									<option value="0949327">Artwick, Thomas B. (Tom)</option>
									<option value="1639429">Ayoub, Nadia A.</option>
									<option value="1714217">Bai, Ge</option>
									<option value="1623186">Bailey, Matthew J.</option>
									<option value="0043130">Ballenger, Robert M. (Bob)</option>
									<option value="0475767">Barnett, Jeffrey C. (Jeff)</option>
									<option value="1066193">Beavers, Leigh A.</option>
									<option value="0004212">Beckley, Harlan R.</option>
									<option value="0145874">Bell, Alison K.</option>
									<option value="1410010">Bell, Melina C. (Melina)</option>
									<option value="1310661">Bello, David A.</option>
									<option value="1377009">Benefiel, Rebecca R.</option>
									<option value="0714479">Bent, George R.</option>
									<option value="1714213">Bini, Andrea</option>
									<option value="1447059">Blunch, Niels-Hugo (Hugo)</option>
									<option value="1694274">Blythe, Sarah N.</option>
									<option value="1485498">Botta, Monica B.</option>
									<option value="1478447">Bowden, Christa K.</option>
									<option value="1714699">Bowden, Jonathan L.</option>
									<option value="1044373">Boylan, Elizabeth A.</option>
									<option value="1003171">Boylan, Scott J.</option>
									<option value="0808543">Brodie, Laura F.</option>
									<option value="0770750">Brodsky, Anna</option>
									<option value="0236289">Brown, Alexandra R. (Alex)</option>
									<option value="0814941">Bunts, Joseph W., Jr.</option>
									<option value="1714216">Bush, Michael R.</option>
									<option value="1046826">Cabe, Paul R.</option>
									<option value="0089421">Campbell, Gwyn E.</option>
									<option value="0135386">Casey, James F. (Jim)</option>
									<option value="1713137">Chin, Lynn G. (Lynny)</option>
									<option value="1703652">Clancy, Christine K.</option>
									<option value="1703812">Cohen, Brian J.</option>
									<option value="1196654">Collins, Owen</option>
									<option value="0557625">Colliton, James G. (Gavin)</option>
									<option value="0125384">Connelly, William F., Jr.
										(Bill)</option>
									<option value="0860283">Conner, Marc C.</option>
									<option value="1008117">Connors, Christopher D.
										(Chris)</option>
									<option value="1020619">Cooper, Gregory J. (Greg)</option>
									<option value="1715926">Cowgill, Kimberly H. (Kim)</option>
									<option value="0620395">Crockett, Roger A.</option>
									<option value="0796168">Crotty, Kevin M.</option>
									<option value="0045953">Culpepper, Robert S. (Bobby)</option>
									<option value="1230626">Cumming, Douglas O.</option>
									<option value="1176240">Cunningham, Neil</option>
									<option value="1683168">Darznik, Jasmin</option>
									<option value="1485941">Davies, Jenefer M.</option>
									<option value="1683042">Davies, Martin H.</option>
									<option value="0027724">Dean, Roger A.</option>
									<option value="0004061">DeLaney, Theodore C., Jr.
										(Ted)</option>
									<option value="1707417">Demleitner, Nora V.</option>
									<option value="1713034">Denne, Elizabeth J.</option>
									<option value="0134387">Desjardins, Steven G. (Steve)</option>
									<option value="0912582">Detwiler, David A.</option>
									<option value="1199773">Dick, James</option>
									<option value="1310576">Dickovick, James T. (Tyler)</option>
									<option value="1343497">Diette, Timothy M. (Tim)</option>
									<option value="0102510">Dittman, D. Scott (Scott)</option>
									<option value="1376970">Dobin, Howard N. (Hank)</option>
									<option value="1714597">Doyle, Gregory E., Jr.</option>
									<option value="0914170">Dresden, Gregory P.</option>
									<option value="0004239">Dymacek, Wayne M.</option>
									<option value="1485500">Eastwood, Jonathan R. (Jon)</option>
									<option value="1639265">Erickson, Jonathan C. (Jon)</option>
									<option value="0251548">Evans, Shawn Paul</option>
									<option value="1478373">Fafatas, Stephan A.</option>
									<option value="1203773">Faundez-Reitsma, Ivelise</option>
									<option value="1005494">Feldman, Nathan S.</option>
									<option value="1499674">Finch, Carrie E.</option>
									<option value="1714700">Findlay, Pamela L.</option>
									<option value="0766983">France, Marcia B.</option>
									<option value="0004250">Franke, Gary R.</option>
									<option value="0868093">Fregnac-Clave, Francoise</option>
									<option value="1195597">Fu, Hongchu</option>
									<option value="1572785">Fuchs, Ronald</option>
									<option value="1347044">Fulcher, Megan</option>
									<option value="1552621">Gardner, Kateri A. (Kami)</option>
									<option value="0958955">Garvis, Dennis M. (Denny)</option>
									<option value="1044914">Gavaler, Christopher P.
										(Chris)</option>
									<option value="0597160">Gaylard, Catharine P.</option>
									<option value="0070893">Gaylard, Timothy R. (Tim)</option>
									<option value="1687194">Gaylord, Donald A.</option>
									<option value="1694287">Geissinger, John B., II</option>
									<option value="1279295">Gertz, Genelle C.</option>
									<option value="0721931">Gibbs, Philip A. (Phil)</option>
									<option value="1714218">Gildner, Robert M. (Matt)</option>
									<option value="1623181">Goldberg, Nathaniel J.</option>
									<option value="0539342">Goldsmith, Arthur H. (Art)</option>
									<option value="1006265">Goluboff, Sascha</option>
									<option value="1298576">Goudimova, Julia</option>
									<option value="1642074">Grajzl, Peter</option>
									<option value="1687449">Green, Leah N.</option>
									<option value="1235909">Greer, Mary L. (Lisa)</option>
									<option value="0004256">Grefe, Richard F. (Dick)</option>
									<option value="1703642">Gyscek, Peter J.</option>
									<option value="1134142">Hamilton, Eugene W., III
										(Bill)</option>
									<option value="0661835">Harbor, David J.</option>
									<option value="1370937">Harris, Rebecca C.</option>
									<option value="1575562">Herbert, Richard H. (Rick)</option>
									<option value="0697785">Hess, Megan F.</option>
									<option value="1714609">Higgs, Andrew T.</option>
									<option value="1219271">Hoey, Kristina (Kris)</option>
									<option value="1201894">Hoey, Nathan D. (Nate)</option>
									<option value="0717206">Hooks, Linda M.</option>
									<option value="1575541">Horowitz, Sarah</option>
									<option value="1279804">Humston, Robert</option>
									<option value="0719030">Hurd, Lawrence E. (Larry)</option>
									<option value="1281633">Hutchinson, Adam B.</option>
									<option value="0814229">I'Anson, Helen</option>
									<option value="1026952">Ikeda Yuba, Janet</option>
									<option value="0240461">Jasiewicz, Krzysztof</option>
									<option value="1194944">Jellison, Anastasia</option>
									<option value="1575411">Jennings, Christian</option>
									<option value="1308628">Jew, Kimberly M.</option>
									<option value="1686647">Johnson, Dan R.</option>
									<option value="0906671">Kahn, James R. (Jim)</option>
									<option value="0004282">Kaiser, Carl P.</option>
									<option value="1140523">Kamara, Mohamed</option>
									<option value="1699772">Kapuska, Alison L.</option>
									<option value="1715311">Kearney, Kimberley M.</option>
									<option value="0810629">Keen, Suzanne P.</option>
									<option value="1703625">Kerin, Melissa R.</option>
									<option value="1066077">Kester, George W.</option>
									<option value="0933458">Kiley, Kevin A.</option>
									<option value="1713871">King, Elliott H.</option>
									<option value="0345358">Kolman, Barry A.</option>
									<option value="1235712">Kosky, Jeffrey L.</option>
									<option value="1307099">Kuehner, Joel P.</option>
									<option value="0475781">Kuettner, Paul R. (Dick)</option>
									<option value="0089462">Lambert, Kenneth A. (Ken)</option>
									<option value="0089423">Lambeth, John A.</option>
									<option value="1296443">Lanier, Leah S.</option>
									<option value="1443913">LaRiviere, Frederick J. (Fred)</option>
									<option value="1714219">Laughy, Michael H., Jr.</option>
									<option value="0961356">Le Blanc, Robin M.</option>
									<option value="1703918">Leath, Nathan R.</option>
									<option value="1598709">Lepage, Andrea C.</option>
									<option value="1232679">LeRose, Garrett M.</option>
									<option value="1634371">Letourneau, Jaime H.</option>
									<option value="1193452">Levy, Simon D.</option>
									<option value="1622027">Locy, Toni R.</option>
									<option value="0348226">Lorig, Tyler S.</option>
									<option value="1687025">Low, Paul C.</option>
									<option value="0915267">Lubin, Timothy (Tim)</option>
									<option value="1140921">Luecke, Pamela K. (Pam)</option>
									<option value="1683141">Lynch, Shane M.</option>
									<option value="1046857">Mahon, James E.</option>
									<option value="1279329">Markowitz, Harvey J.</option>
									<option value="1047952">Marsh, David M.</option>
									<option value="0019816">Martinez, Joseph D.</option>
									<option value="0910165">Mayock, Ellen C.</option>
									<option value="1624615">Mazilu, Dan A.</option>
									<option value="1198990">Mazilu, Irina</option>
									<option value="0976096">McCabe, Eugene M. (Gene)</option>
									<option value="0004304">McCaughrin, Craig W.</option>
									<option value="0004818">McCorkle, William F., Jr.
										(Bill)</option>
									<option value="0913868">McRae, Alan</option>
									<option value="0004309">Merchant, J. H., Jr. (Holt)</option>
									<option value="1139964">Miller, Jessica R.</option>
									<option value="1346476">Miranda, Deborah A.</option>
									<option value="0538076">Mish, Robert W.</option>
									<option value="1006161">Morel, Lucas E.</option>
									<option value="1714688">Muir, Judith K. (Judi)</option>
									<option value="1713929">Munch, Vincent A.</option>
									<option value="1489275">Muncie, John F.</option>
									<option value="1419352">Murdock, Karla</option>
									<option value="1714954">Ness, Erin G.</option>
									<option value="0004313">Novack, David R.</option>
									<option value="1682921">O'Brien, Brendan W.</option>
									<option value="1492281">Ojure, Lenna P.</option>
									<option value="0619281">Oliver, Bill</option>
									<option value="0618142">Oliver, Elizabeth G.</option>
									<option value="0236984">Olson-Janjic, Kathleen</option>
									<option value="1166061">Orrison, Wendy C.</option>
									<option value="1436006">Overman, Michael M.</option>
									<option value="1716486">Parrish, William P., Jr.</option>
									<option value="1414056">Patch, William L., Jr. (Bill)</option>
									<option value="0642220">Penne, Cynthia S.</option>
									<option value="0124327">Peppers, Larry C.</option>
									<option value="1004525">Peterson, David S.</option>
									<option value="1083152">Petty, Byron W.</option>
									<option value="0642728">Petty, Shuko W.</option>
									<option value="1489104">Phillips, Robert M. (Matt)</option>
									<option value="1378159">Pickett, Holly C.</option>
									<option value="1623188">Pinto-Bailey, Ana C.
										(Cristina)</option>
									<option value="0004327">Piranian, Rolf G.</option>
									<option value="0004328">Pleva, Michael A. (Mike)</option>
									<option value="1630629">Pomeroy, Loren P.</option>
									<option value="1623319">Pratt, Renee M.</option>
									<option value="0661208">Radulescu, Domnica V.</option>
									<option value="1444912">Rahl, Jeffrey M.</option>
									<option value="1714837">Reep, Chad R.</option>
									<option value="1700546">Reyes, Antonio</option>
									<option value="0538577">Richardson, Brian E.</option>
									<option value="1703608">Riggs, Ryan D.</option>
									<option value="1710135">Rupke, Nicolaas A.</option>
									<option value="0537580">Rush, Mark E.</option>
									<option value="1557392">Saylor, Nancy E.</option>
									<option value="1478734">Schwartz, Adam L.</option>
									<option value="1714387">Scott, Domineque F.</option>
									<option value="0349517">Senechal, Roberta H.</option>
									<option value="1686643">Shay, Jeffrey P. (Jeff)</option>
									<option value="1702685">Shearer, Nathan W.</option>
									<option value="1702943">Shester, Katharine L.</option>
									<option value="1347499">Sigler, Haley W.</option>
									<option value="1699991">Silwal, Shikha B.</option>
									<option value="1347430">Simmons, Carolyn J.</option>
									<option value="0475873">Simurda, Maryanne C.</option>
									<option value="0812069">Smith, Rodney T.</option>
									<option value="0122576">Smitka, Michael J. (Mike)</option>
									<option value="0618130">Smout, Kary</option>
									<option value="0561727">Snyder, Bryan L.</option>
									<option value="0358959">Spice, Charles G. (Graham)</option>
									<option value="1501128">Sprenkle, Sara E.</option>
									<option value="1694571">St Laurent, Nathaniel R. (Nat)</option>
									<option value="0869403">Stewart, Robert E. (Bob)</option>
									<option value="0004916">Stickley, Mervin J. (Jeff)</option>
									<option value="1639441">Stough, Joshua V.</option>
									<option value="1052024">Straughan, Robert D. (Rob)</option>
									<option value="0087598">Stuart, Larry W.</option>
									<option value="1004498">Sukow, David W.</option>
									<option value="1092309">Taylor, Mark D.</option>
									<option value="1710463">Toporikova, Natalia</option>
									<option value="1642185">Touve, David C.</option>
									<option value="1162182">Trimmer, Philip C. (Phil)</option>
									<option value="0959191">Tuchler, Matthew F. (Matt)</option>
									<option value="0365464">Tucker, John N.</option>
									<option value="0717201">Uffelman, Erich S.</option>
									<option value="1307513">Uhl, Brandon J.</option>
									<option value="0475777">Ujie, Kenichi (Ken)</option>
									<option value="1714221">Vazquez Comesana, Javier</option>
									<option value="0767018">Velasquez, Eduardo A.</option>
									<option value="1623335">Verhage, Florentien</option>
									<option value="0851608">Vosbein, Terry</option>
									<option value="1597914">Watson, Fiona L.</option>
									<option value="0769919">Wheeler, Lesley M.</option>
									<option value="1694548">Wheeler, Rachel E.</option>
									<option value="1279792">Whiting, Wythe L., IV</option>
									<option value="1699126">Whitworth, Gregg B.</option>
									<option value="1703927">Widney, Jason B.</option>
									<option value="0004373">Wiest, David N. (Dave)</option>
									<option value="1348845">Williamson, Joshua D.</option>
									<option value="1686727">Winder, Charles T.</option>
									<option value="1615512">Winschel, Christine A.
										(Chrissy)</option>
									<option value="1050239">Woodzicka, Julie A.</option>
									<option value="0006286">Youngman, Paul A.</option>
									<option value="1687378">Zhu, Yanhong</option>

							</select></td>

							<td align="right"><b>Subject:</b></td>
							<td align="left" style="white-space: nowrap;"><select
								name="ctl00$AppContent$CoSubjectDropDownList"
								onchange="javascript:setTimeout('__doPostBack(\'ctl00$AppContent$CoSubjectDropDownList\',\'\')', 0)"
								id="ctl00_AppContent_CoSubjectDropDownList">
									<option selected="selected" value="-Any-">-Any-</option>
									<option value="ACCT">ACCT (20)</option>
									<option value="AFAM">AFAM (1)</option>
									<option value="ANTH">ANTH (12)</option>
									<option value="ARTH">ARTH (11)</option>
									<option value="ARTS">ARTS (12)</option>
									<option value="BIOL">BIOL (46)</option>
									<option value="BUS">BUS (28)</option>
									<option value="CHEM">CHEM (18)</option>
									<option value="CHIN">CHIN (6)</option>
									<option value="CLAS">CLAS (5)</option>
									<option value="CSCI">CSCI (9)</option>
									<option value="DANC">DANC (6)</option>
									<option value="EALL">EALL (2)</option>
									<option value="EAS">EAS (1)</option>
									<option value="ECON">ECON (37)</option>
									<option value="EDUC">EDUC (26)</option>
									<option value="ENGL">ENGL (23)</option>
									<option value="ENGN">ENGN (7)</option>
									<option value="ENV">ENV (13)</option>
									<option value="FREN">FREN (11)</option>
									<option value="GEOL">GEOL (11)</option>
									<option value="GERM">GERM (8)</option>
									<option value="GR">GR (3)</option>
									<option value="HIST">HIST (32)</option>
									<option value="INTR">INTR (16)</option>
									<option value="ITAL">ITAL (1)</option>
									<option value="JAPN">JAPN (4)</option>
									<option value="JOUR">JOUR (26)</option>
									<option value="LACS">LACS (1)</option>
									<option value="LATN">LATN (7)</option>
									<option value="LIT">LIT (6)</option>
									<option value="MATH">MATH (28)</option>
									<option value="MRST">MRST (3)</option>
									<option value="MS">MS (16)</option>
									<option value="MUS">MUS (124)</option>
									<option value="NEUR">NEUR (13)</option>
									<option value="PE">PE (56)</option>
									<option value="PHIL">PHIL (19)</option>
									<option value="PHYS">PHYS (19)</option>
									<option value="POL">POL (21)</option>
									<option value="PORT">PORT (1)</option>
									<option value="POV">POV (7)</option>
									<option value="PSYC">PSYC (30)</option>
									<option value="RAS">RAS (4)</option>
									<option value="REL">REL (12)</option>
									<option value="RUSS">RUSS (5)</option>
									<option value="SOC">SOC (13)</option>
									<option value="SPAN">SPAN (20)</option>
									<option value="THTR">THTR (20)</option>
									<option value="WRIT">WRIT (16)</option>

							</select></td>

							<td align="right"><b>FDR:</b></td>
							<td align="left" style="white-space: nowrap;"><select
								name="ctl00$AppContent$CoFDRDropDownList"
								onchange="javascript:setTimeout('__doPostBack(\'ctl00$AppContent$CoFDRDropDownList\',\'\')', 0)"
								id="ctl00_AppContent_CoFDRDropDownList">
									<option selected="selected" value="-Any-">-Any-</option>
									<option value="FL">FL (7)</option>
									<option value="FM">FM (11)</option>
									<option value="FP">FP (53)</option>
									<option value="FW">FW (16)</option>
									<option value="HA">HA (42)</option>
									<option value="HL">HL (31)</option>
									<option value="HU">HU (61)</option>
									<option value="SC">SC (11)</option>
									<option value="SL">SL (38)</option>
									<option value="SS1">SS1 (14)</option>
									<option value="SS2">SS2 (19)</option>
									<option value="SS3">SS3 (2)</option>
									<option value="SS4">SS4 (12)</option>
									<option value="SS5">SS5 (5)</option>

							</select></td>

							<td align="right">&nbsp;&nbsp;<b>Type:</b>
							</td>
							<td align="left" style="white-space: nowrap;"><select
								name="ctl00$AppContent$CoTypeDropDownList"
								onchange="javascript:setTimeout('__doPostBack(\'ctl00$AppContent$CoTypeDropDownList\',\'\')', 0)"
								id="ctl00_AppContent_CoTypeDropDownList">
									<option selected="selected" value="-Any-">-Any-</option>
									<option value="AFAM">AFAM (4)</option>
									<option value="AFY">AFY (306)</option>
									<option value="EAS">EAS (21)</option>
									<option value="ENV">ENV (15)</option>
									<option value="FS">FS (5)</option>
									<option value="LACS">LACS (9)</option>
									<option value="MRST">MRST (9)</option>
									<option value="NEUR">NEUR (16)</option>
									<option value="POV">POV (12)</option>
									<option value="RAS">RAS (11)</option>
									<option value="WGS">WGS (6)</option>

							</select></td>
						</tr>



						<tr>
							<td align="right"><b>Schedule:</b></td>
							<td align="left" style="white-space: nowrap;"><select
								name="ctl00$AppContent$CoScheduleDropDownList"
								onchange="javascript:setTimeout('__doPostBack(\'ctl00$AppContent$CoScheduleDropDownList\',\'\')', 0)"
								id="ctl00_AppContent_CoScheduleDropDownList">
									<option selected="selected" value="-Any-">-Any-</option>
									<option value="-ARR-">-ARR-</option>
									<option value="F 1:25p-2:20p">F 1:25p-2:20p</option>
									<option value="F 1:25p-5:35p">F 1:25p-5:35p</option>
									<option value="F 8:00a-8:55a">F 8:00a-8:55a</option>
									<option value="M 1:25p-2:20p">M 1:25p-2:20p</option>
									<option value="M 1:25p-4:30p">M 1:25p-4:30p</option>
									<option value="M 1:25p-5:25p">M 1:25p-5:25p</option>
									<option value="M 1:25p-5:35p">M 1:25p-5:35p</option>
									<option value="M 7:30p-10:00p">M 7:30p-10:00p</option>
									<option value="MTF 1:25p-2:20p">MTF 1:25p-2:20p</option>
									<option value="MTF 2:30p-3:25p">MTF 2:30p-3:25p</option>
									<option value="MTF 3:35p-4:30p">MTF 3:35p-4:30p</option>
									<option value="MTF 9:05a-10:00a">MTF 9:05a-10:00a</option>
									<option value="MTRF 1:25p-2:20p">MTRF 1:25p-2:20p</option>
									<option value="MTRF 12:20p-1:15p">MTRF 12:20p-1:15p</option>
									<option value="MTRF 2:30p-3:25p">MTRF 2:30p-3:25p</option>
									<option value="MTRF 3:35p-4:30p">MTRF 3:35p-4:30p</option>
									<option value="MTRF 4:40p-5:35p">MTRF 4:40p-5:35p</option>
									<option value="MTWF 10:10a-11:05a">MTWF 10:10a-11:05a</option>
									<option value="MTWF 11:15a-12:10p">MTWF 11:15a-12:10p</option>
									<option value="MTWF 12:20p-1:15p">MTWF 12:20p-1:15p</option>
									<option value="MTWF 8:00a-8:55a">MTWF 8:00a-8:55a</option>
									<option value="MTWF 9:05a-10:00a">MTWF 9:05a-10:00a</option>
									<option value="MTWR 4:00p-4:55p">MTWR 4:00p-4:55p</option>
									<option value="MTWR 5:00p-6:00p">MTWR 5:00p-6:00p</option>
									<option value="MTWRF 1:25p-2:20p">MTWRF 1:25p-2:20p</option>
									<option value="MTWRF 10:10a-11:05a">MTWRF
										10:10a-11:05a</option>
									<option value="MTWRF 11:15a-12:10p">MTWRF
										11:15a-12:10p</option>
									<option value="MTWRF 12:20p-1:15p">MTWRF 12:20p-1:15p</option>
									<option value="MTWRF 2:30p-3:25p">MTWRF 2:30p-3:25p</option>
									<option value="MTWRF 3:35p-4:30p">MTWRF 3:35p-4:30p</option>
									<option value="MTWRF 8:00a-8:55a">MTWRF 8:00a-8:55a</option>
									<option value="MTWRF 9:05a-10:00a">MTWRF 9:05a-10:00a</option>
									<option value="MTWRF 9:05a-10:10a">MTWRF 9:05a-10:10a</option>
									<option value="MW 1:25p-2:20p">MW 1:25p-2:20p</option>
									<option value="MW 1:25p-3:25p">MW 1:25p-3:25p</option>
									<option value="MW 1:25p-3:30p">MW 1:25p-3:30p</option>
									<option value="MW 10:10a-11:05a">MW 10:10a-11:05a</option>
									<option value="MW 10:10a-11:35a">MW 10:10a-11:35a</option>
									<option value="MW 10:10a-12:10p">MW 10:10a-12:10p</option>
									<option value="MW 11:15a-12:10p">MW 11:15a-12:10p</option>
									<option value="MW 12:20p-2:20p">MW 12:20p-2:20p</option>
									<option value="MW 2:30p-3:25p">MW 2:30p-3:25p</option>
									<option value="MW 2:30p-3:55p">MW 2:30p-3:55p</option>
									<option value="MW 2:30p-4:30p">MW 2:30p-4:30p</option>
									<option value="MW 3:35p-5:00p">MW 3:35p-5:00p</option>
									<option value="MW 8:00a-10:00a">MW 8:00a-10:00a</option>
									<option value="MW 8:00a-8:50a">MW 8:00a-8:50a</option>
									<option value="MW 8:00a-8:55a">MW 8:00a-8:55a</option>
									<option value="MW 8:30a-10:00a">MW 8:30a-10:00a</option>
									<option value="MW 8:35a-10:00a">MW 8:35a-10:00a</option>
									<option value="MW 9:05a-10:00a">MW 9:05a-10:00a</option>
									<option value="MWF 1:25p-2:20p">MWF 1:25p-2:20p</option>
									<option value="MWF 10:10a-11:05a">MWF 10:10a-11:05a</option>
									<option value="MWF 10:10a-12:10p">MWF 10:10a-12:10p</option>
									<option value="MWF 11:15a-12:10p">MWF 11:15a-12:10p</option>
									<option value="MWF 12:20p-1:15p">MWF 12:20p-1:15p</option>
									<option value="MWF 2:30p-3:25p">MWF 2:30p-3:25p</option>
									<option value="MWF 3:35p-4:25p">MWF 3:35p-4:25p</option>
									<option value="MWF 3:35p-4:30p">MWF 3:35p-4:30p</option>
									<option value="MWF 8:00a-8:55a">MWF 8:00a-8:55a</option>
									<option value="MWF 8:35a-10:00a">MWF 8:35a-10:00a</option>
									<option value="MWF 9:05a-10:00a">MWF 9:05a-10:00a</option>
									<option value="R 1:00p-2:15p">R 1:00p-2:15p</option>
									<option value="R 1:25p-2:20p">R 1:25p-2:20p</option>
									<option value="R 1:25p-4:30p">R 1:25p-4:30p</option>
									<option value="R 1:25p-5:25p">R 1:25p-5:25p</option>
									<option value="R 1:25p-5:35p">R 1:25p-5:35p</option>
									<option value="R 10:10a-11:05a">R 10:10a-11:05a</option>
									<option value="R 2:25p-3:50p">R 2:25p-3:50p</option>
									<option value="R 2:30p-4:00p">R 2:30p-4:00p</option>
									<option value="R 3:35p-4:30p">R 3:35p-4:30p</option>
									<option value="R 4:00p-5:30p">R 4:00p-5:30p</option>
									<option value="R 8:00a-12:00p">R 8:00a-12:00p</option>
									<option value="R 8:00a-12:10p">R 8:00a-12:10p</option>
									<option value="R 8:00a-9:15a">R 8:00a-9:15a</option>
									<option value="R 8:35a-11:40a">R 8:35a-11:40a</option>
									<option value="R 9:05a-12:10p">R 9:05a-12:10p</option>
									<option value="T 1:00p-2:15p">T 1:00p-2:15p</option>
									<option value="T 1:25p-2:15p">T 1:25p-2:15p</option>
									<option value="T 1:25p-2:50p">T 1:25p-2:50p</option>
									<option value="T 1:25p-4:30p">T 1:25p-4:30p</option>
									<option value="T 1:25p-5:25p">T 1:25p-5:25p</option>
									<option value="T 1:25p-5:35p">T 1:25p-5:35p</option>
									<option value="T 10:00a-11:55a">T 10:00a-11:55a</option>
									<option value="T 12:30p-4:30p">T 12:30p-4:30p</option>
									<option value="T 2:25p-3:50p">T 2:25p-3:50p</option>
									<option value="T 2:30p-5:35p">T 2:30p-5:35p</option>
									<option value="T 8:00a-8:55a">T 8:00a-8:55a</option>
									<option value="T 8:00a-9:15a">T 8:00a-9:15a</option>
									<option value="T 9:05a-12:10p">T 9:05a-12:10p</option>
									<option value="TF 4:40p-7:00p">TF 4:40p-7:00p</option>
									<option value="TR 1:25p-2:50p">TR 1:25p-2:50p</option>
									<option value="TR 1:25p-3:25p">TR 1:25p-3:25p</option>
									<option value="TR 1:25p-3:30p">TR 1:25p-3:30p</option>
									<option value="TR 1:25p-4:30p">TR 1:25p-4:30p</option>
									<option value="TR 10:10a-11:35a">TR 10:10a-11:35a</option>
									<option value="TR 10:10a-12:10p">TR 10:10a-12:10p</option>
									<option value="TR 11:00a-12:15p">TR 11:00a-12:15p</option>
									<option value="TR 11:50a-1:15p">TR 11:50a-1:15p</option>
									<option value="TR 12:20p-2:20p">TR 12:20p-2:20p</option>
									<option value="TR 2:30p-4:30p">TR 2:30p-4:30p</option>
									<option value="TR 3:00p-4:25p">TR 3:00p-4:25p</option>
									<option value="TR 6:30p-7:30p">TR 6:30p-7:30p</option>
									<option value="TR 8:00a-10:00a">TR 8:00a-10:00a</option>
									<option value="TR 8:00a-8:55a">TR 8:00a-8:55a</option>
									<option value="TR 8:30a-10:00a">TR 8:30a-10:00a</option>
									<option value="TR 8:35a-10:00a">TR 8:35a-10:00a</option>
									<option value="TR 9:05a-1:15p">TR 9:05a-1:15p</option>
									<option value="TR 9:05a-10:00a">TR 9:05a-10:00a</option>
									<option value="TR 9:25a-10:45a">TR 9:25a-10:45a</option>
									<option value="TR 9:30p-10:45p">TR 9:30p-10:45p</option>
									<option value="W 1:25p-2:20p">W 1:25p-2:20p</option>
									<option value="W 1:25p-4:30p">W 1:25p-4:30p</option>
									<option value="W 1:25p-5:25p">W 1:25p-5:25p</option>
									<option value="W 1:25p-5:35p">W 1:25p-5:35p</option>
									<option value="W 12:20p-1:15p">W 12:20p-1:15p</option>
									<option value="W 2:30p-3:25p">W 2:30p-3:25p</option>
									<option value="W 3:35p-4:30p">W 3:35p-4:30p</option>
									<option value="W 7:30p-9:30p">W 7:30p-9:30p</option>
									<option value="W 9:05a-10:00a">W 9:05a-10:00a</option>

							</select></td>

							<td align="right"><b>Building:</b></td>
							<td align="left" style="white-space: nowrap;"><select
								name="ctl00$AppContent$CoBuildingDropDownList"
								onchange="javascript:setTimeout('__doPostBack(\'ctl00$AppContent$CoBuildingDropDownList\',\'\')', 0)"
								id="ctl00_AppContent_CoBuildingDropDownList">
									<option selected="selected" value="-Any-">-Any-</option>
									<option value="109 South Jefferson Street">109 South
										Jefferson Street</option>
									<option value="17 Courthouse Square">17 Courthouse
										Square</option>
									<option value="Baker Hall">Baker Hall</option>
									<option value="Doremus/Warner Center">Doremus/Warner
										Center</option>
									<option value="duPont Hall">duPont Hall</option>
									<option value="Early-Fielding Mem Bldg">Early-Fielding
										Mem Bldg</option>
									<option value="East Asian Language Ctr">East Asian
										Language Ctr</option>
									<option value="Howe Hall">Howe Hall</option>
									<option value="Huntley Hall">Huntley Hall</option>
									<option value="James G. Leyburn Library">James G.
										Leyburn Library</option>
									<option value="Lenfest Hall">Lenfest Hall</option>
									<option value="Newcomb Hall">Newcomb Hall</option>
									<option value="Parmly Hall">Parmly Hall</option>
									<option value="Payne Hall">Payne Hall</option>
									<option value="Reeves Center">Reeves Center</option>
									<option value="Reid Hall">Reid Hall</option>
									<option value="Robinson Hall">Robinson Hall</option>
									<option value="Science Addition">Science Addition</option>
									<option value="SVU">SVU</option>
									<option value="Sydney Lewis Hall">Sydney Lewis Hall</option>
									<option value="Tucker Hall">Tucker Hall</option>
									<option value="VMI">VMI</option>
									<option value="Washington Hall">Washington Hall</option>
									<option value="Watson Pavillion">Watson Pavillion</option>
									<option value="Wilson Hall">Wilson Hall</option>

							</select></td>


						</tr>



						<tr>
							<td align="right" style="white-space: nowrap;"><b> </b></td>
							<td align="left" style="white-space: nowrap;"></td>

							<td align="right" style="white-space: nowrap;"><b> </b></td>
							<td align="left" style="white-space: nowrap;"></td>

							<td align="right" style="white-space: nowrap;"><b> </b></td>
							<td align="left" style="white-space: nowrap;"></td>
						</tr>

					</table> -->

					<br>

					<table
						class="main table-autosort table-autofilter table-autopage:250 table-stripeclass:alternate table-page-number:t1page table-page-count:t1pages table-filtered-rowcount:t1filtercount table-rowcount:t1allcount">
						<thead>
							<tr id="legend" class="lightGreen">
								<th scope="col" class="table-sortable:default course">Course</th>
								<th scope="col" class="table-sortable:default transcript">Transcript
									Title</th>
								<th scope="col" class="table-filterable table-sortable:numeric credit">Credit</th>
								<th scope="col" class="table-filterable table-sortable:default fdr">FDR</th>
								<th scope="col" class="table-filterable table-sortable:default type">Type</th>
								<th scope="col" class="table-filterable table-sortable:default faculty">Faculty</th>
								<th scope="col" class="table-filterable ic">Instructor<br>Consent
								</th>
								<th scope="col" class="table-sortable:numeric ec">Expected<br>Capacity
								</th>
								<th scope="col" class="table-filterable table-sortable:numeric schedule">Schedule</th>
								<th scope="col" class="table-filterable table-sortable:default location">Location</th>
								<th scope="col">Prefer</th>
							</tr>
						</thead>
						<tbody>
							<%!@SuppressWarnings("unchecked")%>
							<%
								ArrayList<Course> courses = (ArrayList<Course>) request
										.getAttribute("courses");

								String courseTable = "";

								for (int i = 0; i < courses.size(); i++) {
									Course course = courses.get(i);

									Integer id = course.getId();
									String title = course.getTitle();
									String dept = course.getDepartment();
									String num = course.getNumber();
									String sec = course.getSection();
									ArrayList<Time> times = course.getTimes();
									String cred = course.getCredits();
									String fdr = course.getFDR();
									String type = course.getType();
									String fac = course.getFaculty();
									String perm = course.getInstrConsent();
									Integer cap = course.getExpectCap();
									String loc = course.getLocation();

									boolean even = (i % 2 == 0 ? true : false);

									if (even) {
										courseTable += "<tr class=\"lightGreen\">\n";
									} else {
										courseTable += "<tr>\n";
									}

									courseTable += "<td class=\"course\" style=\"white-space: nowrap;\">" + dept
											+ "-" + num + "-" + sec + "</td>\n";
									courseTable += "<td class=\"transcript\" style=\"white-space: nowrap;\">" + title
											+ "</td>\n";
									courseTable += "<td class=\"credit\" align=\"center\">" + cred + "</td>\n"; //Credits
									courseTable += "<td class=\"fdr\" align=\"center\">" + fdr + "</td>\n"; //FDR
									courseTable += "<td class=\"type\" align=\"center\">" + type + "</td>\n"; //Type
									courseTable += "<td class=\"faculty\" align=\"center\">" + fac + "</td>\n"; //Faculty
									courseTable += "<td class=\"ic\" align=\"center\">" + perm + "</td>\n"; //Permision
									courseTable += "<td class=\"ec\" align=\"center\">" + cap + "</td>\n"; //Capacity
									courseTable += "<td class=\"schedule\" align=\"center\"></td>\n"; //Times**
									courseTable += "<td class=\"location\" align=\"center\">" + loc + "</td>\n"; //Location
									courseTable += "<td align=\"center\"><input type=\"checkbox\" name=\"prefIDs\" value=\""
											+ id + "\" ></td>\n"; //Checkbox
									courseTable += "</tr>\n\n";
								}
							%>

							<%=courseTable%>

						</tbody>
						<tfoot>
							<tr>
								<td>tfoot</td>
								<td>tfoot</td>
								<td>tfoot</td>
								<td>tfoot</td>
								<td>tfoot</td>
								<td>tfoot</td>
								<td>tfoot</td>
								<td>tfoot</td>
								<td>tfoot</td>
								<td>tfoot</td>
								<td>tfoot</td>
							</tr>
							<tr>
								<td class="table-page:previous" style="cursor: pointer;">&lt;
									&lt; Previous</td>
								<td colspan="9" style="text-align: center;">Page <span
									id="t1page"></span>&nbsp;of <span id="t1pages"></span></td>
								<td class="table-page:next" style="cursor: pointer;">Next
									&gt; &gt;</td>
							</tr>
							<tr>
								<td colspan="11"><span id="t1filtercount"></span>&nbsp;of <span
									id="t1allcount"></span>&nbsp;rows match filter(s)</td>
							</tr>
						</tfoot>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>