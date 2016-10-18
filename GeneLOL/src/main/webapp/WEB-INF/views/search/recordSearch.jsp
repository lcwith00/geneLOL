<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="resources/semantic-ui/semantic.min.css">
<script src="resources/semantic-ui/semantic.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/common.css">
<style type="text/css">
#contents {
	margin-bottom: 3rem;
	padding-left: 5%;
	padding-right: 5%;
	min-height: 1000px;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../common/header.jsp"%>
	</header>
	<div id="contents">
		${summoner.name }<br>
		<c:forEach items="${recentGames}" var="recent">
	${recent.gameId }
	<br>
		</c:forEach>
		<c:forEach items="${players}" var="player">
			${player.value.name}<br>
		</c:forEach>
		${league.name} <br> ${rankedStats.champions[1].id}

	</div>

	<footer>
		<%@ include file="../common/footer.jsp"%>
	</footer>
</body>
</html>