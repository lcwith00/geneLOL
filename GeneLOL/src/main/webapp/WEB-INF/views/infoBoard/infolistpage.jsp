<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>infoList</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="/resources/semantic-ui/semantic.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/semantic-ui/semantic.min.css">
<script type="text/javascript">
$(document)
			.ready(
					function() {
						$('#registInfo').click(function() {
							$('#register_info').modal('show');
						
						});
					});
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
				<button class="positive ui button" id="registInfo">글 등록</button>
				<div class="ui modal info" id="register_info">
					<%@ include file="../infoBoard/inforegister.jsp"%>
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


		<!-- ======================Detail=============================== -->
		<div class="row">
			<div class="ui four column doubling stackable grid container">
				<c:forEach items="${infoList}" var="UserinfoBoardVO">
					<div class="column">
						<div class="ui card">
							<!--board_no  -->
							<input type="hidden" id="last_board_no" name="info_no"
								value="${UserinfoBoardVO.board_no}">
							<div class="content">
								<!--board_count  -->
								<div class="right floated meta">조회수 :
									${UserinfoBoardVO.board_count}</div>
								<!--board_no  -->
								<label id="info_no" data-board_no="${UserinfoBoardVO.board_no }">no.${UserinfoBoardVO.board_no }</label>
								<br> <label id="info_title">
									${UserinfoBoardVO.board_title } </label>

								<div class="right floated meta">

									<!-- 날짜가져오기 -->
									<fmt:formatDate pattern="yyyy-MM-dd"
										value="${UserinfoBoardVO.board_date}" />
								</div>
							</div>

							<div class="image" id="btnimg"
								onclick="read(${UserinfoBoardVO.board_no})">
								<a
									href="http://localhost:8080/info/infoDetail?board_no=${UserinfoBoardVO.board_no}">
									<img
									src="http://img.youtube.com/vi/${UserinfoBoardVO.board_content}/1.jpg">
								</a>
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
			<div class="ui modal Detail" id="infoRead">
				<%@ include file="../infoBoard/infodetail.jsp"%>
			</div>


		</div>
	</div>
	<!-- ===================================================== -->
	<footer>
		<%@ include file="../common/footer.jsp"%>
	</footer>
</body>


</html>
