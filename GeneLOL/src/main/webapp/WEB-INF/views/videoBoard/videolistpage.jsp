<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js">
	
</script>
<link rel="stylesheet" type="text/css"
	href="../resources/semantic-ui/semantic.min.css">
<script src="../resources/semantic-ui/semantic.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {

		$('#registLink').click(function() {
			$('.ui.modal.link').modal('show');
		});
		$('#videoRead').click(function() {

			$('.ui.modal.Detail').modal('show');

		});
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

div #bg {
	width: 90%;
	min-height: 700px;
	background-color: gray;
	margin: 50px;
}

div #popularVideo {
	width: 55%;
	min-height: 200px;
	background-color: black;
	margin: 40px;
	float: left;
}

div #popularRank {
	width: 30%;
	min-height: 200px;
	background-color: black;
	margin: 40px;
	position: relative;
	float: left;
}

div #for_search_Div {
	width: 90%;
	height: 48px;
	background-color: white;
	position: relative;
	float: left;
	margin: auto;
}

#submit_search {
	position: absolute;
	top: 5%;
	right: 1px;
	margin-right: 0px;
	height: 90%;
	padding-right: 1em;
}

#search {
	float: right;
}

div #tap_container {
	width: 90%;
	min-height: 500px;
	margin: auto;
}

div #tab_column {
	margin: auto;
}

#register_modal {
	width: 60%;
	margin: auto;
}
#v
</style>
<title>Insert title here</title>
</head>
<body>
	<header> <%@ include file="../common/header.jsp"%>
	</header>
	<!-- 배경 div -->
	<div id="bg">
		<div id="popularVideo"></div>
		<div id="popularRank"></div>

		<div id="for_search_Div">
			<div class=" ui icon input" id="search">
				<button class="positive ui button" id="registLink">링크 등록</button>
				<div class="ui modal link" id="register_link">
					<%@ include file="../videoBoard/register.jsp"%>
				</div>


				<input class="prompt" type="text" placeholder="검색">
				<button class="ui inverted basic button" type="submit"
					id="submit_search">
					<i class="black search icon"></i>
				</button>
			</div>
		</div>

		<div class="ui top attached tabular menu" id="manu_tap">
			<a class="item active" data-tab="ALL">ALL</a> <a class="item"
				data-tab="LOL">LOL</a> <a class="item" data-tab="FUN">FUN</a><a
				class="item " data-tab="ETC">Etc</a>
		</div>
		<div class="ui tap" data-tab="ALL" id="tap_container">
			<p></p>
			<p></p>
			<!-- ======================Detail=============================== -->


			<form method="get" action="/video/videoDetail" id="sendDetail">
				<div class="ui four column doubling stackable grid container">
					<c:forEach items="${videoList}" var="UserVideoBoardVO">

						<div class="column" id="tab_column">
							<div class="ui card">
								<div class="content">
									<div class="right floated meta">조회수 :
										${UserVideoBoardVO.board_count}</div>
									<label id="video_no">no.${UserVideoBoardVO.board_no }</label> <br>
									<label> ${UserVideoBoardVO.board_title } </label>



									<div class="right floated meta">

										<!-- 날짜가져오기 -->
										<fmt:formatDate pattern="yyyy-MM-dd"
											value="${UserVideoBoardVO.board_date}" />

									</div>
								</div>
								<div class="image" id="videoRead">
									<a
										href="http://localhost:8080/video/videoDetail?board_no=${UserVideoBoardVO.board_no}
									"
										class="ui medium image"> <input type="hidden"
										name="board_no" value="${UserVideoBoardVO.board_no}">
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
										</c:choose> <img src="http://img.youtube.com/vi/${videoLinkImgB}/1.jpg">
									</a>
									<c:out value="${videoLinkImgB}"></c:out>


								</div>
								<div class="content">
									<span class="right floated"> <i
										class="heart outline like icon"></i> <!-- 좋아요수 -->likes${UserVideoBoardVO.board_recomm}
									</span> <i class="comment icon"></i>
									<!-- 댓글수 -->
									comments
								</div>
								<div class="extra content">
									<div class="ui large transparent left icon input">작성자 :
										${UserVideoBoardVO.userid}</div>
								</div>
							</div>
						</div>
					</c:forEach>
					<div class="ui modal Detail" id="videoRead">

						<%@ include file="../videoBoard/videodetail.jsp"%>

					</div>
				</div>
			</form>
		</div>
		<!-- ===================================================== -->



	</div>
	<div class="ui bottom attached tab segment" data-tab="LOL">
		Second</div>
	<div class="ui bottom attached tab segment " data-tab="FUN">
		Third</div>
	<div class="ui bottom attached tab segment " data-tab="ETC">
		Third</div>

</body>
</html>