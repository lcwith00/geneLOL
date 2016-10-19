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
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
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
	
	
	var bno = 123239;
	
	getPageList(1);

	function getAllList() {

		$
				.getJSON(
						"/comment/all/" + board_NO,
						function(data) {

							//console.log(data.length);

							var str = "";

							$(data)
									.each(
											function() {
												str += "<li data-comment_NO='"+this.comment_NO+"' class='commentLi'>"
														+ this.comment_NO
														+ ":"
														+ this.comment_Content
														+ "<button>MOD</button></li>";
											});
							$("#comment").html(str);
						});
	}
	$("#comment").on("click", ".commentLi button", function() {

		var comment = $(this).parent();

		var comment_NO = reply.attr("data-comment_NO");
		var comment_Content = reply.text();

		$(".modal-title").html(rno);
		$("#comment_Content").val(comment_Content);
		$("#modDiv").show("slow");

	});

	
	function getPageList(page){
		
	  $.getJSON("/comment/"+board_NO+"/"+page , function(data){
		  
		  console.log(data.list.length);
		  
		  var str ="";
		  
		  $(data.list).each(function(){
			  str+= "<li data-comment_NO='"+this.comment_NO+"' class='commentLi'>" 
			  +this.comment_NO+":"+ this.comment_Content+
			  "<button>MOD</button></li>";
		  });
		  
		  $("#comment").html(str);
		  
		  printPaging(data.pageMakerVO);
		  
	  });
  }		
	
	  
	function printPaging(pageMakerVO){
		
		var str = "";
		
		if(pageMakerVO.prev){
			str += "<li><a href='"+(pageMakerVO.startPage-1)+"'> << </a></li>";
		}
		
		for(var i=pageMakerVO.startPage, len = pageMakerVO.endPage; i <= len; i++){				
				var strClass= pageMakerVO.paging.page == i?'class=active':'';
			  str += "<li "+strClass+"><a href='"+i+"'>"+i+"</a></li>";
		}
		
		if(pageMakerVO.next){
			str += "<li><a href='"+(pageMakerVO.endPage + 1)+"'> >> </a></li>";
		}
		$('.pagination').html(str);				
	}
	
	var commentPage = 1;
	
	$(".pagination").on("click", "li a", function(event){
		
		event.preventDefault();
		
		commentPage = $(this).attr("href");
		
		getPageList(commentPage);
		
	});
	
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
				
			</div>
			<div class="three wide column">
				<button class="ui inverted blue button" id="boardbutton"
					onclick="boardpage_click();">
					<strong>내가 작성한 댓글</strong>
				</button>
			</div>
			<div class="four wide column">
				
			</div>
			<div class="one wide column"></div>
		</div>
		
		<!--댓글 검색 -->
		<div class="ui three column grid">
			<div class="eight wide column" id="commentsearch">
				<form id="search_form" method="get">
					<input class="prompt" type="text" placeholder="검색"
						name="board_title">

					<button class="ui inverted basic button" type="submit"
						id="submit_search">
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
				<strong>관리</strong>
			</div>
		</div>
		<!--  내가 작성한 댓글 내용-->
		<div class="ui three column grid" id="commentpage2">
			<div class="one wide column"></div>
			<div class="three wide column">
				<a href="http://www.naver.com"><ul id="comment">
	</ul>
	
	<ul class='pagination'>
	</ul>	
</a>
			</div>
			<div class="three wide column">
				
			</div>
			<div class="three wide column">
	
			</div>
		</div>
	</div>
	
	<ul id="comment">
	</ul>
	
	<ul class='pagination'>
	</ul>	
	
	
	
	
	
	
	<footer id="footer">
		<%-- 	<%@ include file="../common/footer.jsp"%> --%>
	</footer>

</body>
</html>