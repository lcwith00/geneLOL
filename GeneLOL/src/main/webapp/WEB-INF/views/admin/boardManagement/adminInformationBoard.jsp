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
<script type="text/javascript"
	src="resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
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

#infoBoardList {
	text-align: center;
}

#title {
	text-align: left;
}

#selectArticleDelete, #insertArticle {
	float: left;
}

#infoBoardSearch {
	float: right;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$('.menu .item').tab();
		$('.ui.dropdown').dropdown();

		$('#searchButton').click(function() {
			var searchType = $('#searchBox option:selected').val();
			if (searchType == "all") {
				$('#page_navi').html("");
				$("#infoList").html("");
				var searchtext = $("#searchInput").val();
				listSearch(searchType, page, searchtext);
				searchPage(searchType, searchtext);
			} else if (searchType == "writer") {
				$('#page_navi').html("");
				$("#infoList").html("");
				var searchtext = $("#searchInput").val();
				listSearch(searchType, page, searchtext);
				searchPage(searchType, searchtext);
			} else if (searchType == "subject") {
				$('#page_navi').html("");
				$("#infoList").html("");
				var searchtext = $("#searchInput").val();
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
					url : "/infoboard/deleteprocess",
					data : {
						'board_no' : checkArr
					},
				});
			}

			$('#page_navi').html("");
			$("#infoList").html("");
			listAll();
			page();
			$('#allCheck').prop("checked", false);
		});

		$("#insertArticle").click(function() {
			$('#insertArticleModal').modal('show');
		})

		var obj = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : obj,
			elPlaceHolder : "editor",
			sSkinURI : "/resources/smarteditor/SmartEditor2Skin.html",
			htParams : {
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true
			}
		});

		$("#insertArticleButton").click(function() {
			obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
			$('#insertArticleModal').modal('hide');
			var formData = $("#frm").serialize();

			$.ajax({
				type : "post",
				url : "/infoboard/insert",
				async : false,
				data : formData,
			})

			$('#subject').empty();
			$('#content').empty();
			$('#page_navi').html("");
			$("#infoList").html("");
			listAll();
			page();

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
		var url = "/infoboard/searchcount/" + searchType + "/" + searchtext;
		$.getJSON(url, function(data) {
			$(data).each(function() {
				var searchCount = this.searchCount;
				var resultCount = searchCount / 10
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
		var url = "/infoboard/totalcount";
		$.getJSON(url, function(data) {
			$(data).each(function() {
				var infoCount = this.totalCount;
				var resultCount = infoCount / 10
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
		var url = "/infoboard/article/" + searchtype + "/" + searchtext + "/"
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
		$("#infoList").html("");
		var page = 1;
		if (str > 1) {
			page = str;
		}
		var start_no = (page - 1) * 10;
		var url = "/infoboard/article/" + start_no;
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

		var checked_div = $("<div class='one wide column chkclass'>");
		checked_div
				.html("<input type='checkbox' name='rowCheck' value='" + board_no + "'>");

		var board_no_div = $("<div class='one wide column'>");
		board_no_div.html(board_no);

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

		var board_update_div = $("<div class='two wide column'>");
		board_update_div
				.html("<div class='ui button updateArticle' id='" + board_no + "'>수정 </div>");

		new_div.append(checked_div).append(board_no_div)
				.append(board_title_div).append(username_div).append(
						board_date_div).append(board_count_div).append(
						board_recomm_div).append(board_update_div);

		$("#infoList").append(new_div);
	}

	function addNewItem(board_no, board_title, username, board_date,
			board_count, board_recomm) {

		var new_div = $("<div class='ui seven column grid'>");

		var checked_div = $("<div class='one wide column chkclass'>");
		checked_div
				.html("<input type='checkbox' name='rowCheck' value='" + board_no + "'>");

		var board_no_div = $("<div class='one wide column'>");
		board_no_div.html(board_no);

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

		var board_update_div = $("<div class='two wide column'>");
		board_update_div
				.html("<div class='ui button updateArticle' id='" + board_no + "'>수정</div>");

		new_div.append(checked_div).append(board_no_div)
				.append(board_title_div).append(username_div).append(
						board_date_div).append(board_count_div).append(
						board_recomm_div).append(board_update_div);

		$("#infoList").append(new_div);
	}

	function read(str) {
		var board_no = str;
		var url = "/infoboard/read/" + board_no;
		$.getJSON(url, function(data) {
			$(data).each(
					function() {
						var board_no = this.board_no;
						var board_title = this.board_title;
						var board_content = this.board_content;
						var username = this.username;
						var board_date = this.board_date;
						var board_count = this.board_count;
						var board_recomm = this.board_recomm;
						$("#info_title").html(board_title);
						$("#info_writer").html("작성자 : " + username);
						$("#content").html(board_content);
						$("#view_Cnt").html(
								"<i class='unhide icon'></i>" + board_count);
						$("#like").html("Like " + board_recomm);
					});
		});
		$('#readinfo').modal('show');
	}
</script>
<!-- list -->
<div id="infoBoardlist">
	<div>정보 게시판</div>
	<div class="ui top attached tabular menu">
		<a class="item active" data-tab="first">게시물 관리</a> <a class="item"
			data-tab="second">댓글 관리</a>
	</div>
	<div class="ui bottom attached tab segment active" data-tab="first"
		id="infoBoardList">
		<div id="infoBoardMenu">
			<div class="ui button" id="selectArticleDelete">선택삭제</div>
			<div class="ui button" id="insertArticle">등록</div>
			<div class="ui action input" id="infoBoardSearch">
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
			<div class="one wide column">
				<input type="checkbox" onclick="allChk(this)" id="allCheck"><label></label>
			</div>
			<div class="one wide column">번호</div>
			<div class="four wide column">제목</div>
			<div class="two wide column">작성자</div>
			<div class="two wide column">작성일</div>
			<div class="two wide column">조회수</div>
			<div class="two wide column">좋아요</div>
			<div class="two wide column"></div>
		</div>
		<div id="infoList"></div>
		<br>
		<div id="page_navi"></div>
	</div>
	<div class="ui bottom attached tab segment" data-tab="second">
		Second</div>
</div>
<!-- modal -->
<div class="ui modal" id="readinfo"></div>

<div class="ui modal" id="insertArticleModal">
	<jsp:include page="insertArticle.jsp"></jsp:include>
</div>