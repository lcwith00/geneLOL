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
<script type="text/javascript">
	function read(str) {
		document.getElementById("btn_submit").style.visibility="hidden"; 
		 document.getElementById("btn_cancel").style.visibility="hidden"; 
		 hide_modify();
		 var board_no = str;
		var url = "/videoboard/read/" + board_no;
		$
				.getJSON(
						url,
						function(data) {
							$(data)
									.each(
											function() {
												var board_no = this.board_no;
												var board_title = this.board_title;
												var username = this.username;
												var board_date = this.board_date;
												var board_content = this.board_content;
												var board_count = this.board_count;
												var board_recomm = this.board_recomm;
												$("#board_no_send_modal").html(
														board_no);
												$("#video_title_modal").html(
														board_title);
												$("#video_content_play")
														.html(
																"<iframe src="+"http://www.youtube.com/embed/"+board_content+" frameborder="+"'0'"+ "allowfullscreen>"
																		+ "</iframe>");
												$("#video_writer").html(
														"작성자 : " + username);
												$("#view_Cnt").html(
														"<i class='unhide icon'></i>"
																+ board_count);
												$("#likeConut").html(
														board_recomm);
												$("#date").html(board_date);
											});
						});
		$('#videoRead').modal('show');
	}
	function hide_modify(){
	    document.getElementById("video_title_modify").style.visibility="hidden"; 
	}
</script>
</head>
<body>
	<header>
		<%@ include file="common/header.jsp"%>
	</header>
	<div id="contents" class="ui text container">
		<aside class="ui center aligned container">
			<img alt="" src="/resources/images/mainlogo.png" id="logo">
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
						<div class="ui middle aligned two column centered grid listitem"
							onclick="read(${board.board_no})">
							<div class="four wide column thumbnail">
								<c:choose>
									<c:when test="${board.board_id == 'info' }">
										<c:set var="hrefVal" value="/info/infoList"></c:set>
										<a href="${hrefVal }"> <img class="ui small image"
											src="/resources/images/infoimg.png">
										</a>
									</c:when>
									<c:otherwise>
										<c:set var="hrefVal" value="/video/videoList"></c:set>
										<a href="${hrefVal }"> <img class="ui small image"
											src="http://img.youtube.com/vi/${board.board_content}/1.jpg">
										</a>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="twelve wide left aligned column">
								<span>${board.board_title}</span>
								<p>조회수 : ${board.board_count}</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</section>
	</div>
	<div class="ui modal Detail" id="videoRead">
		<%@ include file="videoBoard/videodetail.jsp"%>
	</div>
	<footer>
		<%@ include file="common/footer.jsp"%>
	</footer>
</body>
</html>
