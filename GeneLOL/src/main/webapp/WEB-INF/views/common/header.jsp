<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>

<!DOCTYPE HTML>
<HTML>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="/resources/semantic-ui/semantic.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/semantic-ui/semantic.min.css">
<script type="text/javascript">
	$(document).ready(function() {
		$('#login').click(function() {
			$('#signup_modal').modal('show')
		});
	});
</script>
<style type="text/css">
#signup_modal {
	margin-left: -15% !important;
	margin-right: 0% !important;
	max-width: 307px;
	min-width: 307px;
}
</style>
<title>header</title>
<style type="text/css">
.ui.top.inverted.menu {
	min-width: 1024px;
	margin-top: 0 !important;
}

#mySettingIcon {
	margin: 0 !important;
	margin-left: 0.428571em !important;
}

.item.mySettingLink>a {
	color: rgba(0, 0, 0, .87) !important;
}

.menu.mySettingList, .item.mySettingLink {
	text-align: center !important;
}

.nav {
	min-width: 1024px;
}

#submit_btn_nav {
	position: absolute;
	top: 5%;
	right: 1px;
	margin-right: 0px;
	height: 90%;
	padding-right: 1em;
	border: 0;
}
</style>
</head>
<body>
	<div class="ui top inverted menu">
		<div class="ui container nav">
			<a href="/" class="header item"> <img class="logo"
				src="/resources/images/logo.png">GeneLoL
			</a> <a href="#" class="item">랭킹</a>
			<div class="ui simple dropdown item">
				<span class="text">통계</span> <i class="dropdown icon"></i>
				<div class="menu">
					<div class="item">챔피언 별</div>
					<div class="item">티어 별</div>
				</div>
			</div>
			<a href="/video/videoList" class="item">동영상</a> <a
				href="/info/infoList" class="item">정보</a>
			<div class="right menu">
				<c:set value="/WEB-INF/views/home.jsp" var="homeURL"></c:set>
				<c:if test="${pageContext.request.requestURI!= homeURL}">
					<div class="item">
						<div class="ui inverted icon input">
							<form class="ui form" method="get" action="/summoner">
								<input type="text" placeholder="Search" name="summonerName">
								<button class="ui basic button" type="submit"
									id="submit_btn_nav">
									<i class="search icon"></i>
								</button>
							</form>
						</div>
					</div>
				</c:if>
				<c:choose>
					<c:when test="${login.userName!=null}">
						<div class="ui right simple dropdown item">
							<div class="ui inverted button">
								<span class="text">${login.userName}</span><i
									class="dropdown icon" id="mySettingIcon"></i>
							</div>
							<div class="menu mySettingList">
								<div class="item mySettingLink">
									<a>개인 설정</a>
								</div>
								<div class="item mySettingLink">
									<a href="/mypageList">내가 쓴 글</a>
								</div>
								<div class="item mySettingLink">
									<a href="/user/logout">Log Out</a>
								</div>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="ui right item">
							<div class="ui inverted button" id="login">로그인</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>

	<div class="ui modal" id="signup_modal">
		<%@ include file="../user/signup.jsp"%>
	</div>
</body>
</HTML>