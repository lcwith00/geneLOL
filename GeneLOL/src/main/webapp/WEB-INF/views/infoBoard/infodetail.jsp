<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!doctype html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="/resources/semantic-ui/semantic.min.css">
<script src="/resources/semantic-ui/semantic.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#btn_List').click(function() {
			location.href = "http://localhost:8080/info/infoList"
		});
		$("#btn_submit").on("click", function() {

			var board_no = $("#board_no_modal").html();
			alert(board_no);
			$('input[name=board_no]').attr('value', board_no);

			var board_title = $("#title_modify").val();
			alert(board_title);
			$('input[name=board_title]').attr('value', board_title);

			var board_content = $("#board_content_modify").val();
			alert(board_content);
			$('input[name=board_content]').attr('value', board_content);

			$('#func').attr({
				'action' : '/info/infoUpdate',
				'method' : 'post'
			});
			$('#func').submit();

		});
		$("#likeBtn").click(function() {

			alert("test");

			$.ajax({
				type : "POST",
				url : "/info/likeUpdate",
				dataType : 'text', // 서버로부터 되돌려받는 데이터의 타입을 명시하는 것이다.
				data : { // 서버로 보낼 데이터 명시 

					board_no : $("#board_no").html(),
				},
				success : function() {
					alert("전송완료");
					location.reload();
				}

			});
		});

		function like_count() {
			var board_no = $("#board_no").html();
		}

	});
</script>

<script type="text/javascript">
	
</script>

<style type="text/css">
#header {
	position: relative;
}

.ui raised very padded text container segment {
	position: relative;
}

#writer {
	text-align: right;
}

#btn_List, #likeBtn {
	float: right;
}
</style>

<title>videoDetail</title>
</head>
<body>

	<div class="ui raised very padded text container segment">
		<form id="func">
			no.<label id="board_no_modal"></label> <input type="hidden"
				id="board_no" name="board_no">
			<div id="date"></div>

			<h3 class="ui block header" id="title"></h3>
			<input type="text" name="title_modify" id="title_modify"
				class="ui block header" size="71"> <input type="hidden"
				id="board_title" name="board_title">

			<div id="writer">글쓴이 :</div>

			<div class="ui attached segment" id="board_content_modal"></div>
			<div class="ui form" id="text_area_modify">
				<div class="field">
					<label>내용</label>
					<textarea id="board_content_modify" name="board_content_modify"></textarea>
				</div>
			</div>
			<input type="hidden" id="board_content" name="board_content">

			<div id="file_Modify">
				file : <input type="file" name="filename">
			</div>

		</form>

		<div class="ui labeled button" tabindex="0" id="likeBtn">
			<div class="ui red button">
				<i class="heart icon"></i> Like
			</div>

			<a class="ui basic red left pointing label" id="likeConut">
				${UserInfoBoardVO.board_recomm } </a>

		</div>

		<!-- ================reply start================== -->
		<div class="ui threaded comments" id="reply_form">

			<div>
				<h3 class="ui dividing header">댓글</h3>
				<div class="comment">
					<a class="avatar"> </a>
					<div class="content">
						<div class="metadata">
							<span class="date">${UserVideoBoardVO.board_date }</span>
						</div>
						<div class="actions"></div>
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


		<div class="buttons">

			<div class="ui blue labels" id="view_Cnt"></div>

			<button class="ui blue basic button" id="btn_List">LIST ALL</button>
			<button class="ui yellow basic button" id="btn_Modify">MODIFY</button>
			<button class="ui green basic button" id="btn_submit">SUBMIT</button>
		</div>
		<!--  /.div-body -->
	</div>
	<footer>
		<%@ include file="../common/footer.jsp"%>
	</footer>
</body>
</html>