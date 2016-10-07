<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="../resources/semantic-ui/semantic.min.css">
<script src="../resources/semantic-ui/semantic.min.js"></script>
<script type="text/javascript">
	
</script>
<style type="text/css">
.embed-container {
	position: relative;
	padding-bottom: 56.25%;
	height: 0;
	overflow: hidden;
	max-width: 100%;
}

.embed-container iframe, .embed-container object, .embed-container embed
	{
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}

div #bg {
	background-color: black;
}

#writer {
	text-align: right;
}
#btn_List, #btn_Modify, #btn_Delete{
float: right;
}
</style>

<title>videoDetail</title>
</head>
<body>

	<form role="form" method="post" action="/video/videoDetail">
		<input type='hidden' name='board_no'
			value="${UserVideoBoardVO.board_no }">
	</form>

	<div class="form-group">
		<h3 class="ui block header"></h3>

		<h3 class="ui top attached header">${UserVideoBoardVO.board_title }

		</h3>
		<div id="writer">글쓴이 : ${UserVideoBoardVO.userid }</div>
		<div class="ui attached segment" id="bg">


			<a class="ui black label">Content</a>
			<div class='embed-container'>

				<div class="video_play">
					<c:choose>
						<c:when test="${UserVideoBoardVO.board_content.length()==28}">
							<c:set var="videoLinkImgA"
								value="${UserVideoBoardVO.board_content}" />
							<c:set var="videoLinkImgB"
								value="${fn:substring(videoLinkImgA, 17,28)}" />
						</c:when>
						<c:when test="${UserVideoBoardVO.board_content.length()==43}">
							<c:set var="videoLinkImgA"
								value="${UserVideoBoardVO.board_content}" />
							<c:set var="videoLinkImgB"
								value="${fn:substring(videoLinkImgA, 32,43)}" />
						</c:when>
						<c:otherwise>
							<c:set var="videoLinkImgB" value="notFoundImg" />
						</c:otherwise>
					</c:choose>

					<iframe src='http://www.youtube.com/embed/${videoLinkImgB}'
						frameborder='0' allowfullscreen></iframe>
					<c:out value="${userVideoBoardVO.board_content}"></c:out>
					<c:out value="${videoLinkImgB}"></c:out>


				</div>
			</div>
			<div id="view_Cnt">
				<i class="unhide icon"></i>${UserVideoBoard.board_count }
			</div>
			<br>
		</div>

		<div class="ui labeled button" tabindex="0">

			<div class="ui button">
				<i class="heart icon"></i> Like
			</div>
			<a class="ui basic label"> 2,048 </a>
		</div>
		<!-- ================reply start================== -->
		<div class="ui threaded comments">

			<div>
				<h3 class="ui dividing header">댓글</h3>
				<div class="comment">
					<div class="content"></div>
					<div class="comment"></div>
				</div>
				<div class="comment">
					<a class="avatar"> <img src="/images/avatar/small/joe.jpg">
					</a>
					<div class="content">
						<a class="author">Joe Henderson</a>
						<div class="metadata">
							<span class="date">5 days ago</span>
						</div>
						<div class="text">Dude, this is awesome. Thanks so much</div>
						<div class="actions">
							<a class="reply">Reply</a>
						</div>
					</div>
				</div>
				<form class="ui reply form">
					<div class="field">
						<textarea></textarea>
					</div>
					<div class="ui blue labeled submit icon button">
						<i class="icon edit"></i> Add Reply
					</div>
				</form>
			</div>
			<!-- ================reply end================== -->
		</div>

	</div>
	<!--  /.div-body -->
	<div class="buttons">
		<button class="ui blue basic button" id="btn_List">List ALL</button>
		<button class="ui yellow basic button" id="btn_Modify">MODIFY</button>
		<button class="ui red basic button" id="btn_Delete">DELETE</button>
	</div>
</body>
</html>