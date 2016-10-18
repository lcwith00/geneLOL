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

a {
	color: black;
}

#boardsearchimpormation {
	
}

#commentsearchimpormation {
	margin-top: 10px;
}

strong {
	font-size: 15px;
}
</style>
<script>
	function boardpage_click() {
		$('#commentpage').hide();
		$('#commentpage2').hide();
		$('#commentsearch').hide();
		$('#commentsearchimpormation').hide();
		$('#boardpage').show();
		$('#boardpage2').show();
		$('#boardsearch').show();
		$('#boardsearchimpormation').show();
	}
	boardsearch
	function commentpage_click() {
		$('#boardpage').hide();
		$('#boardpage2').hide();
		$('#boardsearch').hide();
		$('#boardsearchimpormation').hide();
		$('#commentpage').show();
		$('#commentpage2').show();
		$('#commentsearch').show();
		$('#commentsearchimpormation').show();
	}
	function allpage_click() {
		$('#boardpage').show();
		$('#boardpage2').show();
		$('#commentpage').show();
		$('#commentpage2').show();
		$('#boardsearch').show();
		$('#commentsearch').show();
		$('#boardsearchimpormation').show();
		$('#commentsearchimpormation').show();
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
			});
	$()
</script>
</head>
<body>
	<header>
		<%@ include file="../common/header.jsp"%>
	</header>
	</br></br></br></br></br>
	<div id="mypage">
		<!-- 메뉴판 -->
		<div class="ui three column grid" id="menu">
			<div class="three wide column"></div>
			<div class="three wide column">
				<button class="ui inverted teal button" id="boardbutton"
					onclick="allpage_click();">
					<strong>모두 보기</strong>
				</button>
			</div>
			<div class="three wide column">
				<button class="ui inverted blue button" id="boardbutton"
					onclick="boardpage_click();">
					<strong>내가 작성한 글</strong>
				</button>
			</div>
			<div class="four wide column">
				<button class="ui inverted green button" id="commentbutton"
					onclick="commentpage_click();">
					<strong>내가 작성한 댓글</strong>
				</button>
			</div>
			<div class="one wide column"></div>
		</div>


		<!--글 검색 -->
		<div class="ui three column grid">
			<div class="eight wide column" id="boardsearch">
				<form id="search_form" method="get">
				<select name="searchType">
					<option value="content">
						제목</option>
				</select>
					<input class="prompt" type="text" placeholder="검색"
						name="board_title">

					<button class="ui inverted basic button" type="submit"
						id="submit_search">
						<i class="black search icon"></i>
					</button>
				</form>
			</div>
			<div class="seven wide column" id="boardsearchimpormation">
				<strong>제목을 클릭하세요 게시물을 확인할 수 있습니다.</strong>
			</div>
		</div>
		<!--  내가 작성한 글 메뉴-->
		<!--  총 16 1 5 1 1  3 2 3 -->
		<div class="ui three column grid" id="boardpage">
			<div class="one wide column"></div>
			<div class="three wide column">
				<strong>제목</strong>
			</div>
			<div class="two wide column">
				<strong>추천</strong>
			</div>
			<div class="two wide column">
				<strong>댓글</strong>
			</div>
			<div class="two wide column">
				<strong>시간</strong>
			</div>
			<div class="two wide column">
				<strong>조회</strong>
			</div>
			<div class="three wide column">
				<strong>관리</strong>
			</div>
		</div>

		<c:forEach items="${mypageList}" var="UserVideoBoardVO">
		<div class="ui three column grid" id="boardpage2">
			<div class="one wide column"></div>
			<div class="three wide column">
				<a href="http://www.naver.com">${UserVideoBoardVO.board_title}</a>
			</div>
			<div class="two wide column">${UserVideoBoardVO.board_recomm}</div>
			<div class="two wide column">${UserVideoBoardVO.board_content}</div>
			<div class="two wide column">
				<fmt:formatDate pattern="YYYY-MM-DD HH24:MI:SS"
					value="${UserVideoBoardVO.board_date}"/>
			</div>
			<div class="two wide column">${UserVideoBoardVO.board_count}</div>
			<div class="three wide column">
			</div>
		</div>
		</br>
		</c:forEach>
		<!-- //내가 작성한 글 내용-->
			<%--<!--  보드페이징 -->
		 <!-- 이전페이지 -->
		
		<c:if test="${pageMaker.prev}">
		<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
	</c:if>
	<!-- 시작페이지,끝페이지 -->
		<c:forEach begin="${pageMaker.startPage }"
		end="${pageMaker.endPage }" var="idx">
	<li	<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
	<a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
	</c:forEach>
	<!-- 다음페이지 -->
	<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
	<li><a href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
	</c:if> --%>

		<!--댓글 검색 -->
		<div class="ui three column grid">
			<div class="eight wide column" id="commentsearch">
				<select name="searchType">
					<option value="content"
						<c:out value="${cri.searchType eq 'content'?'selected':''}"/>>
						내용</option>
				</select><i class="search icon"></i><input type="text" name='keyword'
					id="keywordInput" value='${cri.keyword }'>

				<button id='searchBtn'>Search</button>
			</div>
			<div class="seven wide column" id="commentsearchimpormation">
				<strong>내용을 클릭하세요 댓글을 확인할 수 있습니다</strong>
			</div>
		</div>

		<!--  내가 작성한 댓글 메뉴-->
		<div class="ui three column grid" id="commentpage">
			<div class="one wide column"></div>
			<div class="three wide column">
				<strong>내용</strong>
			</div>
			<div class="three wide column">
				<strong>시간</strong>
			</div>
			<div class="three wide column">
				<strong>관리</strong>
			</div>
		</div>
		<!--  내가 작성한 댓글 내용-->
		<%-- <c:forEach items="${mypage}" var="UserVideoBoardVO"> --%>
		<div class="ui three column grid" id="commentpage2">
			<div class="one wide column"></div>
			<div class="three wide column">
				<a href="http://www.naver.com">${CommentVO.comment_Content}내용</a>
			</div>
			<div class="three wide column">
				<fmt:formatDate pattern="yyyy-mm-dd HH:MM"
					value="${CommentVO.comment_Date}" />
				시간
			</div>
			<div class="three wide column">
			
			</div>
		</div>
		<%-- </c:forEach> --%>
		<!--댓글페이징 -->
	</div>
	<footer id="footer">
		<%-- 	<%@ include file="../common/footer.jsp"%> --%>
	</footer>

</body>
</html>