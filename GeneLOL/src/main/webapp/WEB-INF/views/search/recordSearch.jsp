<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/semantic-ui/semantic.min.css">
<script src="/resources/semantic-ui/semantic.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<title>소환사 검색 결과</title>
<style type="text/css">
#contents {
	margin-top: 3rem;
	margin-bottom: 3rem;
	padding-left: 5%;
	padding-right: 5%;
	min-height: 1000px;
	min-width: 1024px !important;
}

#contents>aside, #contents>section {
	width: 100% !important;
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

.summonerInfo {
	padding-left: 0 !important;
}

.profileIcon {
	min-width: 120px !important;
}

.tier {
	color: #1f8ecd;
	font-size: 1.1rem;
}

.tierInfo {
	color: #879292;
}

.rankedChamp {
	margin: 0 !important;
	padding-left: 0 !important;
}

.row.rankedStat {
	padding-top: 0.5rem !important;
	padding-bottom: 0.5rem !important;
}

.champName {
	text-overflow: ellipsis;
	white-space: nowrap;
	word-wrap: normal;
	overflow: hidden;
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
				<div class="ui middle aligned two column left grid">
					<div class="three wide column profileIcon">
						<img class="ui small image"
							src="http://ddragon.leagueoflegends.com/cdn/6.21.1/img/profileicon/${summoner.profileIconId}.png">
					</div>
					<div class="ten wide left aligned column summonerInfo">
						<span class="ui black basic big label summonerName">${summoner.name }</span>
						<div class="ui column">
							<div class="ui blue button">전적 갱신</div>
							<div class="ui blue basic button">인게임 정보</div>
						</div>
					</div>
				</div>
			</div>
		</aside>
		<section class="ui center aligned container two column grid">
			<section class="six wide column">
				<aside class="ui segment tierInfoAside">
					<div class="ui middle aligned two column left grid">
						<div class="six wide column">
							<c:choose>
								<c:when test="${league.tier == null }">
									<img class="ui small image"
										src="/resources/images/tier_icons/tier_icons/UNRANKED.png">
								</c:when>
								<c:otherwise>
									<img class="ui small image"
										src="/resources/images/tier_icons/tier_icons/${league.tier}_${league.entries[0].division}.png">
								</c:otherwise>
							</c:choose>
						</div>
						<div class="ten wide centered aligned column tierInfos">
							<c:choose>
								<c:when test="${league.tier == null }">
									<span class="tier">Unranked</span>
								</c:when>
								<c:otherwise>
									<span class="tier">${league.tier}
										${league.entries[0].division}</span>
									<br>
									<span>${league.entries[0].leaguePoints}LP / </span>
									<span class="tierInfo">${league.entries[0].wins}승
										${league.entries[0].losses}패</span>
									<br>
									<span class="tierInfo">승률 : <fmt:formatNumber
											value="${(league.entries[0].wins)/(league.entries[0].wins+league.entries[0].losses) }"
											pattern="" type="percent" />
									</span>
									<br>
									<span class="tierInfo">${league.name}</span>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</aside>
				<section class="ui segments">
					<c:forEach var="champion" items="${rankedStats.champions}"
						begin="0" end="6">
						<c:if test="${champion.id != 0}">
							<div class="ui segment">
								<div class="ui middle aligned two column grid">
									<div class="ui four wide column">
										<img class="ui tiny image"
											src="http://ddragon.leagueoflegends.com/cdn/6.21.1/img/champion/${champions[champion.id].key}.png " />
									</div>
									<div class="ui twelve wide column grid rankedChamp">
										<div class="row rankedStat">
											<div class="left floated six wide column champName">${champions[champion.id].name}</div>
											<div class="six wide column">
												<span><fmt:formatNumber
														value="${(champion.stats.totalChampionKills+champion.stats.totalAssists)/champion.stats.totalDeathsPerSession}"
														pattern=".00" type="" />:1 평점</span>
											</div>
											<div class="right floated four wide column">
												<span><fmt:formatNumber
														value="${champion.stats.totalSessionsWon/champion.stats.totalSessionsPlayed}"
														pattern="" type="percent" /></span>
											</div>
										</div>
										<div class="row rankedStat">
											<div class="left floated six wide column">
												<span>CS<fmt:formatNumber
														value="${champion.stats.totalMinionKills/champion.stats.totalSessionsPlayed}"
														pattern=".0" type="" /></span>
											</div>
											<div class="six wide column">
												<span><fmt:formatNumber
														value="${champion.stats.totalChampionKills/champion.stats.totalSessionsPlayed}"
														pattern=".0" type="" />/<fmt:formatNumber
														value="${champion.stats.totalDeathsPerSession/champion.stats.totalSessionsPlayed}"
														pattern=".0" type="" />/<fmt:formatNumber
														value="${champion.stats.totalAssists/champion.stats.totalSessionsPlayed}"
														pattern=".0" type="" /></span>
											</div>
											<div class="right floated four wide column">
												<span>${champion.stats.totalSessionsPlayed} 게임</span>
											</div>
										</div>
									</div>
								</div>
							</div>
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
				<section class="ui segments">
					<c:forEach var="game" items="${recentGames}">
						<div class="ui segment">
							<%-- <c:forEach var="player" items="${game.fellowPlayers}">
								${players[player.summonerId].name }
								<br>
							</c:forEach> --%>
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