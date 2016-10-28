<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="true"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="resources/semantic-ui/semantic.min.css">
<script src="resources/semantic-ui/semantic.min.js"></script>

<link rel="stylesheet" type="text/css" href="resources/css/common.css">
<link rel="stylesheet" type="text/css" href="resources/css/home.css">

</head>
<body>
	<header>
		<%@ include file="common/header.jsp"%>
	</header>
	<div id="contents" class="ui text container">
		<aside class="ui center aligned container">
			<img alt="" src="/resources/images/testlogo.png" id="logo">
		</aside>
		<section class="ui center aligned container">
			<form class="ui form" method="get" action="/summoner">
				<div class="field">
					<div class="ui icon input">
						<input class="prompt" type="text" placeholder="소환사 명을 입력하세요."
							name="summonerName">
						<button class="ui inverted basic button" type="submit"
							id="submit_btn">
							<i class="black search icon"></i>
						</button>
					</div>
				</div>
			</form>
		</section>
		<section class="ui center aligned container">
			<div class="ui segments">
				<c:forEach var="board" items="${popularBoardVoList}">
					<div class="ui segment listitems">
						<div class="ui middle aligned two column centered grid listitem">
							<div class="four wide column thumbnail">
								<c:choose>
									<c:when test="${board.board_id == 'info' }">
										<c:set var="hrefVal"
											value="http://localhost:8080/info/infoList"></c:set>
									</c:when>
									<c:otherwise>
										<c:set var="hrefVal"
											value="http://localhost:8080/video/videoList"></c:set>
									</c:otherwise>
								</c:choose>
								<a href="${hrefVal }"> <img class="ui small image"
									src="http://img.youtube.com/vi/${board.board_content}/1.jpg">
								</a>
							</div>
							<div class="twelve wide left aligned column">
								<a href="${hrefVal }"><span>${board.board_title}</span> </a>
								<p>${board.userid}</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</section>
	</div>
	<footer>
		<%@ include file="common/footer.jsp"%>
	</footer>
</body>
</html>
