<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<title>Home</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="resources/semantic-ui/semantic.min.css">
<script src="resources/semantic-ui/semantic.min.js"></script>

<script type="text/javascript">
	/* 비디오 게시판 버튼 클릭 시 처리 이벤트*/
	$(document).ready(function() {
		$("#userVideoBoardForm").click(function() {
			location.href = "/videoBoard/videoWriteForm.do";
		});
		$('.ui.pointing.dropdown').dropdown();
	});
</script>
<style type="text/css">
body, html {
	margin: 0;
	padding: 0;
	height: 100%;
	width: 100%;
	min-width: 600px;
	overflow-x: scroll;
	font-size: 16px;
}

header, footer {
	width: 100%;
	min-height: 50px;
}

#contents {
	margin-bottom: 3rem;
	padding-left: 5%;
	padding-right: 5%;
	padding-left: 5%;
}

#logo {
	width: 100%;
	margin-top: 3rem;
	margin-bottom: 1rem;
}

.prompt {
	font-size: 1.3rem !important;
}

.twelve.wide.left.aligned.column {
	text-overflow: ellipsis;
	white-space: nowrap;
	word-wrap: normal;
	overflow: hidden;
}

.twelve.wide.left.aligned.column>a {
	color: black;
	font-size: 1.5rem;
}

.twelve.wide.left.aligned.column>p {
	font-size: 0.75rem;
	color: #707070;
}

.twelve.wide.left.aligned.column>a:HOVER {
	color: #0E6EB8;
}

#submit_btn {
	position: absolute;
	top: 5%;
	right: 1px;
	margin-right: 0px;
	height: 90%;
	padding-right: 1em;
}

.ui.segment.listitems {
	padding: 10px 10px !important;
}

.ui.middle.aligned.two.column.centered.grid.listitem {
	padding: -10px -10px !important;
}

.four.wide.column.thumbnail {
	padding: 10px 10px !important;
}
</style>
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
			<form class="ui form" method="get">
				<div class="field">
					<div class="ui icon input">
						<input class="prompt" type="text" placeholder="소환사 명을 입력하세요.">
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
								<a href="http://google.com"> <img class="ui small image"
									src="/resources/images/empty_thumbnail.png">
								</a>
							</div>
							<div class="twelve wide left aligned column">
								<a href="http://google.com"><span>${board.board_title}</span>
								</a>
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
