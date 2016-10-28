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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<script>

	function boardpage_click() {
		$('#commentPageDiv').hide();
		$('#boardPageDiv').show();
	}
	function commentpage_click() {
		$('#boardPageDiv').hide();
		$('#commentPageDiv').show();
		
	}
	function allpage_click() {
		$('#boardPageDiv').show();
		$('#commentPageDiv').show();
		
	}
	</script>
	
	<script>
	$(document).ready(
			function() {
				$('#searchButton').on(
						"click",
						function(event) {

							self.location = "list"
									+ '${mypagePagingVO.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();
						});
			});
	</script>
	<script>
    function fn_movePage(val){
        jQuery("input[name=pageNo]").val(val);
        jQuery("form[name=frm]").attr("method", "post");
        jQuery("form[name=frm]").attr("action","").submit();
    }	
	
	var board_NO = 1;
	$.getJSON("/comment/all/" + board_NO,
			function(data) {
			//console.log(data.length);
			$(data).each(function() {
			str += "<li data-comment_NO='"+this.comment_NO+"' class='commentLi'>"
			+ this.comment_NO+":"+ this.comment_Content
		+ "</li>";
				});
			$("#comment").html(str);
		});
	
	
	$("#commentAddButton").on("click", function() {
		var userID = $("#userID").val();
		var comment_listno = $("#comment_listno").val();
		var comment_parent = $("#comment_parent").val();
		var comment_depth = $("#comment_depth").val();
		var comment_recomm = $("#comment_recomm").val();
		var comment_date = $("#comment_date").val();
		var comment_Content = $("#comment_Content").val();

		$.ajax({
			type : 'post',
			url : '/comment',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'text',
			data : JSON.stringify({
				board_NO : board_NO,
				userID : userID,
				comment_Content : comment_Content,
				comment_listno : comment_listno,
				comment_parent : comment_parent,
				comment_depth : comment_depth,
				comment_recomm : comment_recomm,
				comment_date : comment_date
			}),
			sucess : function(result) {
				if (result == 'SUCESS') {
					alert("등록 되었습니다.");
				}
			}
		});
	});

	$("#comment").on("click", ".commentLi button", function() {

		var comment = $(this).parent();

		var comment_NO = comment.attr("data-comment_NO");
		var comment_Content = comment.text();

		/* <button type="button" id="commentModBtn">수정</button>
		<button type="button" id="commentDelBtn">삭제</button>
		<button type="button" id="closeBtn">취소</button>	 */
		
		$("#model-title").html(comment_no)
		$("#comment_Content").val(comment_Content);
		$("#modDiv").show("slow");
		alert(comment_NO + ":" + comment_Content);

	}); 

</script>



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

#mypage {
	margin: 100px;
}
</style>

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

		<div id="boardPageDiv">
		<div>
			<form name="frm">
				<input type="hidden" name="pageNo" />
				<!-- //페이지 번호 -->
				<input type="hidden" name="userid"
					value="${UserVideoBoardVO.userid}">
				<!--글 검색 -->

				<div class="ui three column grid">
					<div class="eight wide column" id="boardsearch">
						<form id="search_form" method="get">
							 <input class="prompt" type="hidden" placeholder="검색"
								name="board_title">

							<button class="ui inverted basic button" type="hidden"
								id="submit_search">
					
							</button>
						</form>
						<form id="search_form" method="get">
						<select name="searchType">
								<option value="content">제목</option>
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
				<!--글 검색 종료-->
				<!--  내가 작성한 글 메뉴-->
				<!--  총 16 1 5 1 1  3 2 3 -->

				<div class="ui three column grid" id="boardpage">
					<div class="one wide column"></div>
					<div class="three wide column">
						<strong>게시판 분류</strong>
					</div>
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
				</div>

				<c:forEach items="${mypageList}" var="UserVideoBoardVO">
					<div class="ui three column grid" id="boardpage2">
						<div class="one wide column">${UserVideoBoardVO.board_no}</div>
						<div class="three wide column">${UserVideoBoardVO.board_id}</div>
						<div class="three wide column">
							<a href="http:localhost:8080/videoBoard/videoDetail?board_no=${UserVideoBoardVO.board_no}">${UserVideoBoardVO.board_title}</a>
						</div>
						<div class="two wide column">${UserVideoBoardVO.board_recomm}</div>
						<div class="two wide column">${UserVideoBoardVO.board_content}</div>
						<div class="two wide column">
							<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss"
								value="${UserVideoBoardVO.board_date}" />
						</div>
						<div class="two wide column">${UserVideoBoardVO.board_count}</div>
					</div>
					</br>
				</c:forEach>
				<!-- //내가 작성한 글 내용-->
				<!--  보드페이징 -->
				<div id="page">
					<c:if test="${pageVO.pageNo != 0}">
						<c:if test="${pageVO.pageNo > pageVO.pageBlock}">
							<a href="javascript:fn_movePage(${pageVO.firstPageNo})"
								style="text-decoration: none;">[첫 페이지]</a>
						</c:if>
						<c:if test="${pageVO.pageNo != 1}">
							<a href="javascript:fn_movePage(${pageVO.prevPageNo})"
								style="text-decoration: none;">[이전]</a>
						</c:if>
						<span> <c:forEach var="i" begin="${pageVO.startPageNo}"
								end="${pageVO.endPageNo}" step="1">
								<c:choose>
									<c:when test="${i eq pageVO.pageNo}">
										<a href="javascript:fn_movePage(${i})"
											style="text-decoration: none;"> <font
											style="font-weight: bold;">${i}</font>
										</a>
									</c:when>
									<c:otherwise>
										<a href="javascript:fn_movePage(${i})"
											style="text-decoration: none;">[${i+1}]</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</span>
						<c:if test="${pageVO.pageNo != pageVO.finalPageNo }">
							<a href="javascript:fn_movePage(${pageVO.nextPageNo})"
								style="text-decoration: none;">[다음]</a>
						</c:if>
						<c:if test="${pageVO.endPageNo < pageVO.finalPageNo }">
							<a href="javascript:fn_movePage(${pageVO.finalPageNo})"
								style="text-decoration: none;">[마지막 페이지]</a>
						</c:if>
					</c:if>
				</div>
			</form>
			</div>
		</div>
		<!--댓글 검색 -->
		<div id="commentPageDiv">
			<div class="ui three column grid">
				<div class="eight wide column" id="commentsearch">
					<form id="comment_search" method="get">
						<select name="searchType">
							<option value="content">내용</option>
						</select><input type="text" name='keyword' id="keywordInput"
							value='${paging.keyword }'>

						<button class="ui inverted basic button" type="submit"
							id="submit_search2">
							<i class="black search icon"></i>
						</button>
					</form>
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
					<strong>좋아요 수</strong>
				</div>
			</div>
			<!--  내가 작성한 댓글 내용-->
			<c:forEach items="${CommentList}" var="CommentVO">
				<div class="ui three column grid" id="commentpage2">
					<div class="one wide column"></div>
					<div class="three wide column">
						<span id="comment">${CommentVO.comment_NO}"/></span>
					</div>
					<div class="three wide column">
						<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss"
							value="${CommentVO.comment_Date}" />
					</div>
					<div class="three wide column">${CommentVO.comment_Recomm}</div>
				</div>
			</c:forEach>
			<!--댓글페이징 -->
		</div>
	</div>
	
	<footer id="footer">
		<%-- 	<%@ include file="../common/footer.jsp"%> --%>
	</footer>

</body>
</html>