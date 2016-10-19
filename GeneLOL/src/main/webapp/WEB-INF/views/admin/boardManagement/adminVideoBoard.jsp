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

#first {
	text-align: center;
}

#articleList {
	text-align: center;
}

#title {
	text-align: left;
}

#selectArticleDelete {
	float: left;
}

#articleListSearch {
	float: right;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$('.menu .item').tab();
		$('.ui.dropdown').dropdown();

		$('#articleListSearchButton').click(function() {
			var searchType = $('#articleListSearchBox option:selected').val();
			if (searchType == "all") {
				$('#articleListPageNavi').html("");
				$("#articleList").html("");
				var searchtext = $("#articleListSearchInput").val();
				listSearch(searchType, page, searchtext);
				searchPage(searchType, searchtext);
			} else if (searchType == "writer") {
				$('#articleListPageNavi').html("");
				$("#articleList").html("");
				var searchtext = $("#articleListSearchInput").val();
				listSearch(searchType, page, searchtext);
				searchPage(searchType, searchtext);
			} else if (searchType == "subject") {
				$('#articleListPageNavi').html("");
				$("#articleList").html("");
				var searchtext = $("#articleListSearchInput").val();
				listSearch(searchType, page, searchtext);
				searchPage(searchType, searchtext);
			}

		});

		//삭제처리
		$('#selectArticleDelete').click(function() {
			if ($('.chkclass :checked').size() < 1) {
				alert("삭제할 게시물을 선택하세요.");
				return false;
			} else {
				var checkArr = [];
				$('.chkclass :checked').each(function() {
					checkArr.push($(this).val());
				});
				$.ajax({
					async : false,
					method : "POST",
					url : "/videoboard/deleteprocess",
					data : {
						'board_no' : checkArr
					},
				});
			}

			$('#articleListPageNavi').html("");
			$("#articleList").html("");
			listAll();
			page();
			$('#allCheck').prop("checked", false);
		});

		listAll();
		page();

	});

	function allChk(obj) {
		var chkObj = document.getElementsByName("rowCheck");
		var rowCnt = chkObj.length - 1;
		var check = obj.checked;
		if (check) {
			for (var i = 0; i <= rowCnt; i++) {
				if (chkObj[i].type == "checkbox")
					chkObj[i].checked = true;
			}
		} else {
			for (var i = 0; i <= rowCnt; i++) {
				if (chkObj[i].type == "checkbox") {
					chkObj[i].checked = false;
				}
			}
		}
	}

	function searchPage(str1, str2) {
		var searchType = str1;
		var searchtext = str2;
		var url = "/videoboard/searchcount/" + searchType + "/" + searchtext;
		$.getJSON(url, function(data) {
			$(data).each(function() {
				var searchCount = this.searchCount;
				var resultCount = searchCount / 10
				resultCount = Math.ceil(resultCount);
				$('#articleListPageNavi').paging({
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
		$('#articleListPageNavi').html("");
		var url = "/videoboard/totalcount";
		$.getJSON(url, function(data) {
			$(data).each(function() {
				var videoCount = this.totalCount;
				var resultCount = videoCount / 10
				resultCount = Math.ceil(resultCount);
				$('#articleListPageNavi').paging({
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
			$(data)
					.each(
							function() {
								var board_no = this.board_no;
								var board_id = this.board_id;
								var board_title = this.board_title;
								var username = this.username;
								var board_date = this.board_date;
								var board_count = this.board_count;
								var board_recomm = this.board_recomm;
								addSearchItem(board_no, board_id, board_title,
										username, board_date, board_count,
										board_recomm);
							});
		});
	}

	function listAll(str) {
		$("#articleList").html("");
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
						var board_id = this.board_id;
						var board_title = this.board_title;
						var username = this.username;
						var board_date = this.board_date;
						var board_count = this.board_count;
						var board_recomm = this.board_recomm;
						addNewItem(board_no, board_id, board_title, username,
								board_date, board_count, board_recomm);
					});
		});
	}

	function addSearchItem(board_no, board_id, board_title, username,
			board_date, board_count, board_recomm) {

		var new_div = $("<div class='ui fifteen column grid'>");

		var checked_div = $("<div class='one wide column chkclass'>");
		checked_div
				.html("<input type='checkbox' name='rowCheck' value='" + board_no + "'>");

		var board_no_div = $("<div class='one wide column'>");
		board_no_div.html(board_no);

		var board_id_div = $("<div class='one wide column'>");
		if (board_id == "videofun")
			board_id_div.html(board_id);

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

		new_div.append(checked_div).append(board_no_div).append(board_id_div)
				.append(board_title_div).append(username_div).append(
						board_date_div).append(board_count_div).append(
						board_recomm_div);

		$("#articleList").append(new_div);
	}

	function addNewItem(board_no, board_id, board_title, username, board_date,
			board_count, board_recomm) {

		var new_div = $("<div class='ui fifteen column grid'>");

		var checked_div = $("<div class='one wide column chkclass'>");
		checked_div
				.html("<input type='checkbox' name='rowCheck' value='" + board_no + "'>");

		var board_no_div = $("<div class='one wide column'>");
		board_no_div.html(board_no);

		var board_id_div = $("<div class='two wide column'>");
		board_id_div.html(board_id);

		var board_title_div = $("<div class='four wide column' id='title'>");
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

		new_div.append(checked_div).append(board_no_div).append(board_id_div)
				.append(board_title_div).append(username_div).append(
						board_date_div).append(board_count_div).append(
						board_recomm_div);

		$("#articleList").append(new_div);
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
						$("#video_title_modal").html(board_title);
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
		<a class="item active" data-tab="first">게시물 관리</a> <a class="item"
			data-tab="second">댓글 관리</a>
	</div>
	<div class="ui bottom attached tab segment active" data-tab="first"
		id="first">
		<div id="articleListMenu">
			<div class="ui button" id="selectArticleDelete">선택삭제</div>
			<div class="ui action input" id="articleListSearch">
				<select class="ui compact selection dropdown"
					id="articleListSearchBox">
					<option value="all" selected="">전체</option>
					<option value="writer">작성자</option>
					<option value="subject">제목</option>
				</select> <input type="text" placeholder="Search..."
					id="articleListSearchInput">
				<div class="ui button" id="articleListSearchButton">Search</div>
			</div>
		</div>
		<br /> <br /> <br />
		<div class="ui fifteen column grid">
			<div class="one wide column">
				<input type="checkbox" onclick="allChk(this)" id="allCheck"><label></label>
			</div>
			<div class="one wide column">번호</div>
			<div class="two wide column">분류</div>
			<div class="four wide column">제목</div>
			<div class="two wide column">작성자</div>
			<div class="two wide column">작성일</div>
			<div class="two wide column">조회수</div>
			<div class="two wide column">좋아요</div>
		</div>
		<div id="articleList"></div>
		<br>
		<div id="articleListPageNavi"></div>
	</div>
	<div class="ui bottom attached tab segment" data-tab="second"
		id="second"></div>
</div>


<!-- modal -->
<div class="ui modal" id="readVideo">
	<jsp:include page="../../videoBoard/videodetail.jsp"></jsp:include>
</div>