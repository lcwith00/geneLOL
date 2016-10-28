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

.tierInfo, .statInfo {
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

.rankedStat>.column {
	padding: 0 !important;
}

.champName {
	text-overflow: ellipsis;
	white-space: nowrap;
	word-wrap: normal;
	overflow: hidden;
}

.attached.ui.five.item.menu {
	border: none !important;
}

.attached.ui.five.item.menu>.item {
	padding: 0 !important;
}

.attached.ui.five.item.menu>.item>img, .mychamp>img {
	border-radius: 50% !important;
}

.attached.ui.five.item.menu>.item:before {
	width: 0px !important;
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
					<div class="ui middle aligned two column grid">
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
					<c:forEach var="champion" items="${rankedStats.champions}">
						<c:if test="${champion.id != 0}">
							<div class="ui segment">
								<div class="ui middle aligned two column grid">
									<div class="ui four wide column mychamp">
										<img class="ui tiny image"
											src="http://ddragon.leagueoflegends.com/cdn/6.21.1/img/champion/${champions[champion.id].key}.png " />
									</div>
									<div
										class="ui center aligned twelve wide column grid rankedChamp">
										<div class="row rankedStat">
											<div class="left floated six wide column champName">${champions[champion.id].name}</div>
											<div class="six wide column">
												<c:set
													value="${(champion.stats.totalChampionKills+champion.stats.totalAssists)/champion.stats.totalDeathsPerSession}"
													var="statsPoint"></c:set>
												<c:set var="grade_color" value="color: #879292"></c:set>
												<c:if test="${champion.stats.totalDeathsPerSession !=0}">
													<c:choose>
														<c:when test="${statsPoint>=3 && statsPoint<4}">
															<c:set var="grade_color" value="color: green"></c:set>
														</c:when>
														<c:when test="${statsPoint>=4 && statsPoint<5}">
															<c:set var="grade_color" value="color: dodgerblue"></c:set>
														</c:when>
														<c:when test="${statsPoint>=5}">
															<c:set var="grade_color" value="color: gold"></c:set>
														</c:when>
													</c:choose>
													<span style="${grade_color}; font-size:1.1rem;"><fmt:formatNumber
															value="${statsPoint}" pattern=".00" type="" />:1 평점</span>
												</c:if>
												<c:if test="${champion.stats.totalDeathsPerSession ==0}">
													<c:set var="grade_color" value="color: gold"></c:set>
													<span style="${grade_color}; font-size:1.1rem;">Perfect!</span>
												</c:if>
											</div>
											<div class="right floated four wide column">
												<c:set
													value="${champion.stats.totalSessionsWon/champion.stats.totalSessionsPlayed}"
													var="winRate"></c:set>
												<c:set var="winRate_color" value="color: #879292"></c:set>
												<c:if test="${winRate>0.6}">
													<c:set var="winRate_color" value="color: red"></c:set>
												</c:if>
												<span style="${winRate_color}"><fmt:formatNumber
														value="${winRate}" pattern="" type="percent" /></span>
											</div>
										</div>
										<div class="row rankedStat statInfo">
											<div class="left floated six wide column">
												<span>CS <fmt:formatNumber
														value="${champion.stats.totalMinionKills/champion.stats.totalSessionsPlayed}"
														pattern="0.0" type="" /></span>
											</div>
											<div class="six wide column">
												<span><fmt:formatNumber
														value="${champion.stats.totalChampionKills/champion.stats.totalSessionsPlayed}"
														pattern="0.0" type="" />/<fmt:formatNumber
														value="${champion.stats.totalDeathsPerSession/champion.stats.totalSessionsPlayed}"
														pattern="0.0" type="" />/<fmt:formatNumber
														value="${champion.stats.totalAssists/champion.stats.totalSessionsPlayed}"
														pattern="0.0" type="" /></span>
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
					<span>최근전적 : 10전 <%=winRate%>승 <%=10-winRate %>패</span>
				</aside>
				<section class="ui segment">
					<c:forEach var="game" items="${recentGames}">
						<c:choose>
							<c:when test="${game.stats.win}">
								<c:set value="lightskyblue " var="winBg"></c:set>
							</c:when>
							<c:otherwise>
								<c:set value="lightpink " var="winBg"></c:set>
							</c:otherwise>
						</c:choose>

						<div class="ui segment" style="background-color:${winBg}">
							<div class="ui middle aligned five column grid">
								<div class="three wide column">
									<c:choose>
										<c:when test="${game.stats.win}">승리</c:when>
										<c:otherwise>패배</c:otherwise>
									</c:choose>
									<br> <span> <fmt:formatNumber
											value="${game.stats.timePlayed/60}" pattern="0" type=""></fmt:formatNumber>분
										<fmt:formatNumber value="${game.stats.timePlayed%60}"
											pattern="0" type=""></fmt:formatNumber>초
									</span>
								</div>
								<div class="three wide column mychamp">
									<img class="ui tiny image"
										src="http://ddragon.leagueoflegends.com/cdn/6.21.1/img/champion/${champions[game.championId].key}.png " />
								</div>
								<div class="three wide column">
									<span>${champions[game.championId].name}</span><br> <span>${game.stats.championsKilled }/${game.stats.numDeaths }/${game.stats.assists }</span><br>
									<span><fmt:formatNumber
											value="${(game.stats.championsKilled+game.stats.assists)/game.stats.numDeaths}"
											pattern="0.00" type="" />:1 평점</span>
								</div>
								<div class="six wide column">
									<div class="top attached ui five item menu"
										style="background-color:${winBg}">
										<div class="item" style="background-color:${winBg}">
											<img class="ui tiny image"
												src="http://ddragon.leagueoflegends.com/cdn/6.21.1/img/champion/${champions[game.championId].key}.png " />
										</div>
										<c:forEach var="fellowPlayers" items="${game.fellowPlayers}">
											<c:if test="${game.teamId==fellowPlayers.teamId }">
												<div class="item" style="background-color:${winBg}">
													<img class="ui tiny image"
														src="http://ddragon.leagueoflegends.com/cdn/6.21.1/img/champion/${champions[fellowPlayers.championId].key}.png " />
												</div>
											</c:if>
										</c:forEach>
									</div>
									<div class="attached ui five item menu"
										style="background-color:${winBg}">
										<c:forEach var="fellowPlayers" items="${game.fellowPlayers}">
											<c:if test="${game.teamId!=fellowPlayers.teamId }">
												<div class="item" style="background-color:${winBg}">
													<img class="ui tiny image"
														src="http://ddragon.leagueoflegends.com/cdn/6.21.1/img/champion/${champions[fellowPlayers.championId].key}.png " />
												</div>
											</c:if>
										</c:forEach>
									</div>
								</div>
								<div class="one wide column"></div>
							</div>


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