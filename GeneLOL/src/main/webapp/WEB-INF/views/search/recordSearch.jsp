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
	margin-top: 3rem;
	margin-bottom: 3rem;
	padding-left: 5%;
	padding-right: 5%;
	min-height: 1000px;
}

.summonerName {
	margin-bottom: 1rem !important;
}

.ui.center.aligned.container.two.column.grid {
	margin-top: 1rem !important;
}

.ui.center.aligned.container.two.column.grid>.column {
	padding: 0;
}

.six.wide.column {
	padding-right: 0.5rem !important;
}

.ten.wide.column {
	padding-left: 0.5rem !important;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../common/header.jsp"%>
	</header>
	<div id="contents" class="ui container">
		<aside class="ui center aligned container">
			<div class="ui segment">
				<div class="ui middle aligned three column centered grid">
					<div class="three wide column">
						<img class="ui small image"
							src="http://ddragon.leagueoflegends.com/cdn/6.21.1/img/profileicon/${summoner.profileIconId}.png">
					</div>
					<div class="six wide column">
						<span class="ui black basic big label summonerName">${summoner.name }</span>
						<div class="ui align center column">
							<div class="ui blue button">전적 갱신</div>
							<div class="ui blue basic button">인게임 정보</div>
						</div>
					</div>
					<div class="right floated four wide column"></div>
				</div>
			</div>
		</aside>
		<section class="ui center aligned container two column grid">
			<section class="six wide column">
				<aside class="ui segment">
					<img class="ui small image"
						src="resources/images/tier_icons/base_icons/${league.tier}.png">
					<span>${league.tier} ${league.entries[0].division}
						${league.entries[0].leaguePoints}</span>
				</aside>
				<section class="ui segment">
					<c:forEach var="champion" items="${rankedStats.champions}">
						<c:if test="${champion.id != 0}">
							<div class="ui segment">${champions[champion.id].name}:
								${champion.stats.totalSessionsPlayed }</div>
						</c:if>
					</c:forEach>
				</section>
			</section>
			<section class="ten wide column">
				<aside class="ui segment">
					<%
						int winRate = 0;
					%>
					<c:forEach var="game" items="${recentGames}">
						<c:if test="${game.stats.win}">
							<%
								winRate = winRate + 1;
							%>
						</c:if>
					</c:forEach>
					<%=winRate%>
				</aside>
				<section class="ui segment">
					<c:forEach var="game" items="${recentGames}">
						<div class="ui segment">
							<c:forEach var="player" items="${game.fellowPlayers}">
								${players[player.summonerId].name }
								<br>
							</c:forEach>
						</div>
					</c:forEach>
				</section>
			</section>
		</section>

	</div>

	<footer>
		<%@ include file="../common/footer.jsp"%>
	</footer>
</body>
</html>