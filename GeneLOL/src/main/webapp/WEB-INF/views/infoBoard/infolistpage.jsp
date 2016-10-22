<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="true"%>
<html>
<head>
<title>videoList</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/semantic-ui/semantic.min.css">
<script src="/resources/semantic-ui/semantic.min.js"></script>

<script type="text/javascript">
	// Add contents for max height

</script>
<style type="text/css">
body, html {
	margin: 0;
	padding: 0;
	width: 100%;
	min-width: 600px;
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
</style>
</head>
<body>
	<header>
		<%@ include file="../common/header.jsp"%>
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

				<form id="search_form" method="get">
					<input class="prompt" type="text" placeholder="검색"
						name="board_title">

					<button class="ui inverted basic button" type="submit"
						id="submit_search">
						<i class="black search icon"></i>
					</button>
				</form>
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


			<div class="row">
				<div class="ui four column doubling stackable grid container">
					<c:forEach items="${infoList}" var="UserinfoBoardVO">

						<div class="column" id="tab_column">
							<div class="ui card">

								<!--board_no  -->
								<input type="hidden" id="last_board_no" name="board_no"
									value="${UserinfoBoardVO.board_no}">
								<div class="content">
									<!--board_count  -->
									<div class="right floated meta">조회수 :
										${UserinfoBoardVO.board_count}</div>
									<!--board_no  -->
									<label id="video_no"
										data-board_no="${UserinfoBoardVO.board_no }">no.${UserinfoBoardVO.board_no }</label>
									<br> <label id="video_title">
										${UserinfoBoardVO.board_title } </label>

									<div class="right floated meta">

										<!-- 날짜가져오기 -->
										<fmt:formatDate pattern="yyyy-MM-dd"
											value="${UserinfoBoardVO.board_date}" />

									</div>
								</div>
								<div class="image" id="btnimg"
									onclick="read(${UserinfoBoardVO.board_no})">

									<img
										src="http://img.youtube.com/vi/${UserinfoBoardVO.board_content}/1.jpg">
								</div>
								<div class="content">
									<span class="right floated"> <i
										class="heart outline like icon"></i> <!-- 좋아요수 -->likes
										${UserinfoBoardVO.board_recomm}
									</span> <i class="comment icon"></i>
									<!-- 댓글수 -->
									comments
								</div>
								<div class="extra content">
									<div class="ui large transparent left icon input">작성자 :
										${UserinfoBoardVO.userid}</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				

			</div>
		</div>





		<!-- ===================================================== -->



	</div>

	<!-- 	<form id="tab_type" method="get">
		<div class="ui bottom attached tab segment" data-tab="LOL"
			id="btn_tab_LoL">
			<input type="hidden" name="board_id" value="test" id="type_Tap">
			Third
		</div>
	</form>
	<div class="ui bottom attached tab segment " data-tab="FUN"
		id="btn_tab_Fun"></div>
	<div class="ui bottom attached tab segment " data-tab="ETC"
		id="btn_tab_Etc"></div>


 -->
</body>


</html>
