<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<title>m_header.jsp</title>

<spring:url value="/resources/css/basic.css" var="basicCss" />
<spring:url value="/resources/images/logo3.png" var="logo" />
<spring:url value="/resources/images/searchicon.png" var="searchicon" />

<link href="https://fonts.googleapis.com/css?family=Nunito&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="${basicCss }">

<style>
*, *:before, *:after {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}



/* MAIN VARIABLES FOR CUSTOMIZATION */
/* -------------------------------- */
.nav {
  overflow: hidden;
  position: absolute;
  width: auto;
  height: 90px;
  right : -20px;
  background: #fff;
  border-radius: 5px;
  -webkit-transform: translate3d(-50%, 0, 0);
          transform: translate3d(-50%, 0, 0);
  box-shadow: 0 10px 35px rgba(0, 0, 0, 0.2);
}
.nav__cb {
  z-index: -1000;
  position: absolute;
  left: 0;
  top: 0;
  opacity: 0;
  pointer-events: none;
}
.nav__content {
  position: relative;
  width: 90px;
  height: 100%;
  -webkit-transition: width 1s cubic-bezier(0.49, -0.3, 0.68, 1.23);
  transition: width 1s cubic-bezier(0.49, -0.3, 0.68, 1.23);
}
.nav__cb:checked ~ .nav__content {
  -webkit-transition: width 1s cubic-bezier(0.48, 0.43, 0.29, 1.3);
  transition: width 1s cubic-bezier(0.48, 0.43, 0.29, 1.3);
  width: 410px;
}
.nav__items {
  position: relative;
  width: 410px;
  height: 100%;
  padding-left: 20px;
  padding-right: 110px;
  list-style-type: none;
  font-size: 0;
}
.nav__item {
  display: inline-block;
  vertical-align: top;
  width: 85px;
  text-align: center;
  color: #6C7784;
  font-size: 16px;
  line-height: 90px;
  font-family: Helvetica, Arial, sans-serif;
  font-weight: bold;
  -webkit-perspective: 1000px;
          perspective: 1000px;
  -webkit-transition: color 0.3s;
  transition: color 0.3s;
  cursor: pointer;
}
.nav__item:hover {
  color: #00bdea;
}
.nav__item-text {
  display: block;
  height: 100%;
  -webkit-transform: rotateY(-70deg);
          transform: rotateY(-70deg);
  opacity: 0;
  -webkit-transition: opacity 0.7s, -webkit-transform 0.7s cubic-bezier(0.48, 0.43, 0.7, 2.5);
  transition: opacity 0.7s, -webkit-transform 0.7s cubic-bezier(0.48, 0.43, 0.7, 2.5);
  transition: transform 0.7s cubic-bezier(0.48, 0.43, 0.7, 2.5), opacity 0.7s;
  transition: transform 0.7s cubic-bezier(0.48, 0.43, 0.7, 2.5), opacity 0.7s, -webkit-transform 0.7s cubic-bezier(0.48, 0.43, 0.7, 2.5);
}
.nav__cb:checked ~ .nav__content .nav__item-text {
  -webkit-transform: rotateY(0);
          transform: rotateY(0);
  opacity: 1;
  -webkit-transition: opacity 0.2s, -webkit-transform 0.7s cubic-bezier(0.48, 0.43, 0.7, 2.5);
  transition: opacity 0.2s, -webkit-transform 0.7s cubic-bezier(0.48, 0.43, 0.7, 2.5);
  transition: transform 0.7s cubic-bezier(0.48, 0.43, 0.7, 2.5), opacity 0.2s;
  transition: transform 0.7s cubic-bezier(0.48, 0.43, 0.7, 2.5), opacity 0.2s, -webkit-transform 0.7s cubic-bezier(0.48, 0.43, 0.7, 2.5);
}
.nav__item:nth-child(1) .nav__item-text {
  -webkit-transition-delay: 0.3s;
          transition-delay: 0.3s;
}
.nav__cb:checked ~ .nav__content .nav__item:nth-child(1) .nav__item-text {
  -webkit-transition-delay: 0s;
          transition-delay: 0s;
}
.nav__item:nth-child(2) .nav__item-text {
  -webkit-transition-delay: 0.2s;
          transition-delay: 0.2s;
}
.nav__cb:checked ~ .nav__content .nav__item:nth-child(2) .nav__item-text {
  -webkit-transition-delay: 0.1s;
          transition-delay: 0.1s;
}
.nav__item:nth-child(3) .nav__item-text {
  -webkit-transition-delay: 0.1s;
          transition-delay: 0.1s;
}
.nav__cb:checked ~ .nav__content .nav__item:nth-child(3) .nav__item-text {
  -webkit-transition-delay: 0.2s;
          transition-delay: 0.2s;
}
.nav__item:nth-child(4) .nav__item-text {
  -webkit-transition-delay: 0s;
          transition-delay: 0s;
}
.nav__cb:checked ~ .nav__content .nav__item:nth-child(4) .nav__item-text {
  -webkit-transition-delay: 0.3s;
          transition-delay: 0.3s;
}
.nav__btn {
  position: absolute;
  right: 0;
  top: 0;
  width: 90px;
  height: 90px;
  padding: 36px 31px;
  cursor: pointer;
}
.nav__btn:before, .nav__btn:after {
  content: "";
  display: block;
  width: 28px;
  height: 4px;
  border-radius: 2px;
  background: #096DD3;
  -webkit-transform-origin: 50% 50%;
          transform-origin: 50% 50%;
  -webkit-transition: background-color 0.3s, -webkit-transform 1s cubic-bezier(0.48, 0.43, 0.29, 1.3);
  transition: background-color 0.3s, -webkit-transform 1s cubic-bezier(0.48, 0.43, 0.29, 1.3);
  transition: transform 1s cubic-bezier(0.48, 0.43, 0.29, 1.3), background-color 0.3s;
  transition: transform 1s cubic-bezier(0.48, 0.43, 0.29, 1.3), background-color 0.3s, -webkit-transform 1s cubic-bezier(0.48, 0.43, 0.29, 1.3);
}
.nav__btn:before {
  margin-bottom: 10px;
}
.nav__btn:hover:before, .nav__btn:hover:after {
  background: #00bdea;
}
.nav__cb:checked ~ .nav__btn:before {
  -webkit-transform: translateY(7px) rotate(-225deg);
          transform: translateY(7px) rotate(-225deg);
}
.nav__cb:checked ~ .nav__btn:after {
  -webkit-transform: translateY(-7px) rotate(225deg);
          transform: translateY(-7px) rotate(225deg);
}


/*=======================================  */
.headerbody {
	display: flex;
	width: 1900px;
}

.wrapper {
	min-width: 100%;
	display: flex;
	margin-right: 0;
	left: 0;
	right: 0;
	flex: 1 1 auto;
}

.header-wrapper {
	top: 0;
	background-color: #78A9ED;
	height: 95px;
	display: flex;
	flex-flow: row;
	border-bottom-style: solid;
	border-bottom-width: 5px;
	border-color: #2F4F4F;
	flex: 1 0 100%;
}

.img-container {
	order: 1;
	display: flex;
	margin-left: 2%;
	margin-top: 1%;
}

.logo {
	display: block;
	margin: 0 auto;
	border-radius: 5px;
	flex: 1 1 auto;
}

.logo:hover {
	cursor: pointer;
}

.title-container {
	order: 2;
	margin-top: 1%;
	margin-left: 1%;
	display: flex;
}

.title {
	font-size: 32pt;
	color: white;
	flex: 1 0 auto;
}

.title:hover {
	cursor: pointer;
	font-weight: bold;
}

.search-container {
	order: 2;
	margin: auto;
	margin-top: 1%;
	width:1000px;
	display: flex;
	flex-flow: row;
}

#sFrm {
	margin-left: 10px;
	height : 50px;
	display: flex;
	flex-flow: row;
}

.search-bar-container {
	height : 50px;
	order: 1;
	width: 35%;
	flex: 0 1 auto;
}

.search-bar {
	height: 50px;
	width: 28em;
	font-size: 16pt;
}

.search-button-container {
	order: 2;
	margin-left: 49.5%;
	width: 50px;
	height: 50px;
	color: blue;
}

.search-button {
	margin-top: 10px;
	margin-left:10px;
	width: 30px;
	height: 30px;
	flex: 0 1 auto;
}



a {
	text-decoration: none;
	font-size: 12pt;
	text-align: center;
	color: white;
}


.whitespace {
	order: 5;
	width: 1%;
	margin-right: 0;
}




</style>

<script>
	function searchFunc(){
		var frm = document.getElementById("sFrm");
		frm.submit();
	}
	function friendpage(){
		location.href="f_page";
	}
	function mypage(){
		location.href="mypage";
	}
	function logout(){
		location.href="everylogout";
	}
</script>
<script type="text/javascript" src="resources/jquery-3.2.1.min.js"></script>

</head>
<body>

	<div class="headerbody">
		<div class="header-wrapper">

			<div class="img-container">
				<a href="main"><img class="logo" src="${logo }" width="50px"
					height="50px"></a>
			</div>
			<div class="title-container">
				<a href="main"><span class="title">Tea Time</span></a>
			</div>



			<div class="whitespace"></div>

		</div>
	</div>
</body>
</html>