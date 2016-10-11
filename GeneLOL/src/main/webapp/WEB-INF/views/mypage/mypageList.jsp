<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>
<link rel="stylesheet" type="text/css"
	href="resources/semantic-ui/semantic.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="resources/semantic-ui/semantic.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="./Grid Example - Semantic_files/reset.css">
<link rel="stylesheet" type="text/css"
	href="./Grid Example - Semantic_files/site.css">

<link rel="stylesheet" type="text/css"
	href="./Grid Example - Semantic_files/container.css">
<link rel="stylesheet" type="text/css"
	href="./Grid Example - Semantic_files/divider.css">
<link rel="stylesheet" type="text/css"
	href="./Grid Example - Semantic_files/grid.css">
<link rel="stylesheet" type="text/css"
	href="./Grid Example - Semantic_files/header.css">
<style type="text/css">
.two.wide.column {
	word-wrap: break-word;
	text-align: center;
}

.three.wide.column {
	word-wrap: break-word;
	text-align: center;
	min-width: 179px;
}

.ui.three.column.grid {
	min-width: 825px;
}

#boardpage {
	border: 3px solid #00B4DB;
	width: 90%;
	margin-left: 10px;
}

#boardpage2 {
	border-bottom: 3px solid #00B4DB;
	width: 90%;
	margin-left: 10px;
	border-left: 3px solid #00B4DB;
	border-right: 3px solid #00B4DB;
}

#commentpage {
	border: 3px solid #74D36D;
	width: 90%;
	margin-left: 10px;
}

#commentpage2 {
	border-bottom: 3px solid #74D36D;
	border-left: 3px solid #74D36D;
	margin-left: 10px;
	border-right: 3px solid #74D36D;
	width: 90%;
}

#mypage {
	border: 3px solid red;
	width: 90%;
	min-height: 600px;
	min-width: 840px;
}

#boardsearch {
	min-width: 400px;
	margin-left: 10px;
}

#commentsearch {
	min-width: 400px;
	margin-left: 10px;
	margin-top: 10px;
}
#boardsearch
</style>
<script>
	function boardpage_click() {
		$('#commentpage').hide();
		$('#commentpage2').hide();
		$('#commentsearch').hide();
		$('#boardpage').show();
		$('#boardpage2').show();
		$('#boardsearch').show();
	}
	boardsearch
	function commentpage_click() {
		$('#boardpage').hide();
		$('#boardpage2').hide();
		$('#boardsearch').hide();
		$('#commentpage').show();
		$('#commentpage2').show();
		$('#commentsearch').show();
	}
	function allpage_click() {
		$('#boardpage').show();
		$('#boardpage2').show();
		$('#commentpage').show();
		$('#commentpage2').show();
		$('#boardsearch').show();
		$('#commentsearch').show();
	}

	$(document).ready(
			function() {
				$('#searchBtn').on(
						"click",
						function(event) {

							self.location = "list"
									+ '${mypagePagingVO.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();
						});
				$('#newBtn').on("click", function(evt) {
					self.location = "register";
				});

			});
</script>
</head>
<body>
<header>
<%@ include file="../common/header.jsp"%>
	</header>
	<div id="mypage">
		<!-- 메뉴판 -->
		<div class="ui three column grid" id="menu">
			<div class="three wide column"></div>
			<div class="three wide column">
				<button class="ui inverted teal button" id="boardbutton"
					onclick="allpage_click();">모두 보기</button>
			</div>
			<div class="three wide column">
				<button class="ui inverted blue button" id="boardbutton"
					onclick="boardpage_click();">내가 작성한 글</button>
			</div>
			<div class="three wide column">
				<button class="ui inverted green button" id="commentbutton"
					onclick="commentpage_click();">내가 작성한 댓글</button>
			</div>
			<div class="one wide column"></div>
		</div>


		<!--글 검색 -->
		<div class="ui three column grid">
			<div class="six wide column" id="boardsearch">
				<select name="searchType">
					<option value="title"
						<c:out value="${cri.searchType eq 'title'?'selected':''}"/>>
						제목</option>
				</select> <input type="text" name='keyword' id="keywordInput"
					value='${cri.keyword }'>
				<button id='searchBtn'>Search</button>
				<button id='newBtn'>New Board</button>
			</div>
		</div>
		<!--  내가 작성한 글 메뉴-->
		<!--  총 16 1 5 1 1  3 2 3 -->
		<div class="ui three column grid" id="boardpage">
			<div class="one wide column"></div>
			<div class="three wide column">제목</div>
			<div class="two wide column">추천</div>
			<div class="two wide column">댓글</div>
			<div class="two wide column">시간</div>
			<div class="two wide column">조회</div>
			<div class="three wide column">관리</div>
		</div>

		<!--  내가 작성한 글 내용-->
		<c:forEach items="${mypage}" var="UserVideoBoardVO">
			<div class="ui three column grid" id="boardpage2">
				<div class="one wide column"></div>
				<div class="three wide column">${UserVideoBoardVO.board_Title}제목</div>
				<div class="two wide column">${UserVideoBoardVO.board_Recomm}추천</div>
				<div class="two wide column">${UserVideoBoardVO.board_Content}댓글</div>
				<div class="two wide column">
					<fmt:formatDate pattern="yyyy-mm-dd HH:MM"
						value="${UserVideoBoardVO.board_Date}"/>작성일</div>
				<div class="two wide column">${UserVideoBoardVO.board_Count}조회</div>
				<div class="three wide column">
					<input type="button" value="수정" size="" class="positive ui button">
					<input type="button" value="삭제" size="" class="negative ui button">
				</div>

			</div>
			</br>
		</c:forEach>
		<!-- //내가 작성한 글 내용-->
		<!--  보드페이징 -->


		<!--댓글 검색 -->
		<div class="ui three column grid">
			<div class="eight wide column" id="commentsearch">
				<select name="searchType">
					<option value="content"
						<c:out value="${cri.searchType eq 'content'?'selected':''}"/>>
						내용</option>
				</select> <input type="text" name='keyword' id="keywordInput"
					value='${cri.keyword }'>

				<button id='searchBtn'>Search</button>
				<button id='newBtn'>New Board</button>
			</div>
		</div>
		<!--  내가 작성한 댓글 메뉴-->
		<div class="ui three column grid" id="commentpage">
			<div class="one wide column"></div>
			<div class="three wide column">내용</div>
			<div class="three wide column">시간</div>
			<div class="three wide column">관리</div>
		</div>
		<!--  내가 작성한 댓글 내용-->
		<div class="ui three column grid" id="commentpage2">
			<div class="one wide column"></div>
			<div class="three wide column">내용</div>
			<div class="three wide column">시간</div>
			<div class="three wide column">
				<input type="button" value="수정" size="" class="positive ui button">
				<input type="button" value="삭제" size="" class="negative ui button">
			</div>
		</div>
		<!--댓글페이징 -->
	</div>
	<footer id="footer">
		<%@ include file="../common/footer.jsp"%>
	</footer>

</body>
</html>