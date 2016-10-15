<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="resources/semantic-ui/semantic.min.css">
<script src="resources/semantic-ui/semantic.min.js"></script>
<script src="resources/jquery.paging.js"></script>
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

#btn_List, #btn_Modify, #btn_Delete {
	float: right;
}

#page_navi {
	text-align: center;
}

#searchSelection {
	min-width: 7em !important;
}

#videoBoardList {
	text-align: center;
}

#title {
	text-align: left;
}

#videoBoardDelete {
	float: left;
}

#videoBoardSearch {
	float: right;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$('.menu .item').tab();
		$('.ui.dropdown').dropdown();
		listAll();
		page();

		$('#searchButton').click(function() {
			var searchType = $('#searchBox option:selected').val();
			if (searchType == "all") {
				$('#page_navi').html("");
				$("#videoList").html("");
				var searchtext = $("#searchInput").val();
				listSearch(searchType, page, searchtext);
				searchPage(searchType, searchtext);
			} else if (searchType == "writer") {
				$('#page_navi').html("");
				$("#videoList").html("");
				var searchtext = $("#searchInput").val();
				listSearch(searchType, page, searchtext);
				searchPage(searchType, searchtext);
			} else if (searchType == "subject") {
				$('#page_navi').html("");
				$("#videoList").html("");
				var searchtext = $("#searchInput").val();
				listSearch(searchType, page, searchtext);
				searchPage(searchType, searchtext);
			}

		});
	});

	function searchPage(str1, str2) {
		var searchType = str1;
		var searchtext = str2;
		var url = "/videoboard/searchcount/" + searchType + "/" + searchtext;
		$.getJSON(url, function(data) {
			$(data).each(function() {
				var searchCount = this.searchCount;
				resultCount = searchCount / 10
				resultCount = Math.ceil(resultCount);
				$('#page_navi').paging({
					current : 1,
					max : resultCount,
					onclick : function(e, page) {
						listSearch(searchType, page, searchtext);
					}
				});
			});
		});
	}

	function page() {
		$('#page_navi').html("");
		var url = "/videoboard/totalcount";
		$.getJSON(url, function(data) {
			$(data).each(function() {
				var videoCount = this.videoCount;
				resultCount = videoCount / 10
				resultCount = Math.ceil(resultCount);
				$('#page_navi').paging({
					current : 1,
					max : resultCount,
					onclick : function(e, page) {
						listAll(page);
					}
				});
			});
		});
	}
	function listSearch(str1, str2, str3) {
		var searchtype = str1;
		var page = 1;
		var searchtext = str3
		if (str2 > 1) {
			page = str2;
		}
		var start_no = (page - 1) * 10;
		var url = "/videoboard/article/" + searchtype + "/" + searchtext + "/"
				+ start_no;
		$.getJSON(url, function(data) {
			console.log(data.length);
			$(data).each(
					function() {
						var board_no = this.board_no;
						var board_title = this.board_title;
						var username = this.username;
						var board_date = this.board_date;
						var board_count = this.board_count;
						var board_recomm = this.board_recomm;
						addSearchItem(board_no, board_title, username,
								board_date, board_count, board_recomm);
					});
		});
	}

	function listAll(str) {
		$("#videoList").html("");
		var page = 1;
		if (str > 1) {
			page = str;
		}
		var start_no = (page - 1) * 10;
		var url = "/videoboard/article/" + start_no;
		$.getJSON(url, function(data) {
			console.log(data.length);

			$(data).each(
					function() {
						var board_no = this.board_no;
						var board_title = this.board_title;
						var username = this.username;
						var board_date = this.board_date;
						var board_count = this.board_count;
						var board_recomm = this.board_recomm;
						addNewItem(board_no, board_title, username, board_date,
								board_count, board_recomm);
					});
		});

	}

	function addSearchItem(board_no, board_title, username, board_date,
			board_count, board_recomm) {

		var new_div = $("<div class='ui seven column grid'>");

		var checked_div = $("<div class='one wide column'>");
		checked_div.html("첵");

		var board_no_div = $("<div class='two wide column'>");
		board_no_div.html(board_no);

		var board_title_div = $("<div class='five wide column' id='title'>");
		board_title_div.html("<a href='javascript:void(0);' onclick='read("
				+ board_no + ")'>" + board_title + "</a>");

		var username_div = $("<div class='two wide column'>");
		username_div.html(username);

		var board_date_div = $("<div class='two wide column'>");
		board_date_div.html(board_date);

		var board_count_div = $("<div class='two wide column'>");
		board_count_div.html(board_count)

		var board_recomm_div = $("<div class='two wide column'>");
		board_recomm_div.html(board_recomm);

		new_div.append(checked_div).append(board_no_div)
				.append(board_title_div).append(username_div).append(
						board_date_div).append(board_count_div).append(
						board_recomm_div);

		$("#videoList").append(new_div);
	}

	function addNewItem(board_no, board_title, username, board_date,
			board_count, board_recomm) {

		var new_div = $("<div class='ui seven column grid'>");

		var checked_div = $("<div class='one wide column'>");
		checked_div.html("첵");

		var board_no_div = $("<div class='two wide column'>");
		board_no_div.html(board_no);

		var board_title_div = $("<div class='five wide column' id='title'>");
		board_title_div.html("<a href='javascript:void(0);' onclick='read("
				+ board_no + ")'>" + board_title + "</a>");

		var username_div = $("<div class='two wide column'>");
		username_div.html(username);

		var board_date_div = $("<div class='two wide column'>");
		board_date_div.html(board_date);

		var board_count_div = $("<div class='two wide column'>");
		board_count_div.html(board_count)

		var board_recomm_div = $("<div class='two wide column'>");
		board_recomm_div.html(board_recomm);

		new_div.append(checked_div).append(board_no_div)
				.append(board_title_div).append(username_div).append(
						board_date_div).append(board_count_div).append(
						board_recomm_div);

		$("#videoList").append(new_div);
	}

	function read(str) {
		var board_no = str;
		var url = "/videoboard/read/" + board_no;
		$.getJSON(url, function(data) {
			$(data).each(
					function() {
						var board_no = this.board_no;
						var board_title = this.board_title;
						var username = this.username;
						var board_date = this.board_date;
						var board_count = this.board_count;
						var board_recomm = this.board_recomm;
						$("#video_title").html(board_title);
						$("#video_writer").html("작성자 : " + username);
						$("#view_Cnt").html(
								"<i class='unhide icon'></i>" + board_count);
						$("#like").html("Like " + board_recomm);
					});
		});
		$('#readVideo').modal('show');
	}
</script>
<!-- list -->
<div id="videoBoardlist">
	<div class="ui top attached tabular menu">
		<a class="item active" data-tab="first">전체글 보기</a> <a class="item"
			data-tab="second">전체 댓글 보기</a> <a class="item" data-tab="third">공지글
			관리</a>
	</div>
	<div class="ui bottom attached tab segment active" data-tab="first"
		id="videoBoardList">
		<div id="videoBoardMenu">
			<div id="videoBoardDelete">선택삭제</div>
			<div class="ui action input" id="videoBoardSearch">
				<select class="ui compact selection dropdown" id="searchBox">
					<option value="all" selected="">전체</option>
					<option value="writer">작성자</option>
					<option value="subject">제목</option>
				</select> <input type="text" placeholder="Search..." id="searchInput">
				<div class="ui button" id="searchButton">Search</div>
			</div>
		</div>
		<br /> <br /> <br />
		<div class="ui seven column grid">
			<div class="one wide column">첵</div>
			<div class="two wide column">번호</div>
			<div class="five wide column">제목</div>
			<div class="two wide column">작성자</div>
			<div class="two wide column">작성일</div>
			<div class="two wide column">조회수</div>
			<div class="two wide column">좋아요</div>
		</div>
		<div id="videoList"></div>
		<br>
		<div id="page_navi"></div>
	</div>
	<div class="ui bottom attached tab segment" data-tab="second">
		Second</div>
	<div class="ui bottom attached tab segment" data-tab="third">
		Third</div>
</div>


<!-- modal -->
<div class="ui modal" id="readVideo">
	<div class="form-group">
		<h3 class="ui block header"></h3>

		<h3 class="ui top attached header" id="video_title"></h3>
		<div id="video_writer"></div>
		<div class="ui attached segment" id="bg">


			<a class="ui black label">Content</a>
			<div class='embed-container'>

				<div id="video_play">
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
		</div>

		<div class="ui labeled button" tabindex="0">

			<div class="ui button">
				<div id="view_Cnt"></div>
			</div>

			<div class="ui button">
				<i class="heart icon"></i>
				<p id="like"></p>
			</div>

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
					<a class="avatar"> </a>
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
</div>