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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[role='form']");
			
		$('#btn_List').click(function() {
			location.href = "http://localhost:8080/video/videoList"
		});
		$('#btn_cancel').click(function() {
			location.href = "http://localhost:8080/video/videoList"
		});
		
		$("#btn_submit").on("click", function() {
			var board_no = $("#board_no_send_modal").html();
			$('input[name=board_no]').attr('value', board_no);
			var board_title = $("#video_title_modify_val").val();
			$('input[name=board_title]').attr('value', board_title);
			var board_contentA = $("#video_content_modify_val").val();
			var board_contentB = board_contentA.substr(board_contentA.length -11,11);
			$('input[name=board_content]').attr('value',board_contentB); 
			$('#func').attr({
				'action' : '/video/videoUpdate',
				'method' : 'post'
			});
			$('#func').submit();
		});

		$("#btn_Delete").on("click", function() {
			var board_no = $("#board_no_send_modal").html();
			$('input[name=board_no]').attr('value', board_no);
			
			if (confirm("정말 삭제하시겠습니까?") == true) {
				$('#func').attr({
					'action' : '/video/videoDelete',
					'method' : 'post'
				});
				$('#func').submit();
			} else {
				return;
			}
		});

		$("#likeBtn").click(function() {


			$.ajax({
				type : "POST",
				url : "/video/videoLike",
				dataType : 'text', // 서버로부터 되돌려받는 데이터의 타입을 명시하는 것이다.
				data : { // 서버로 보낼 데이터 명시 
					board_no : $("#board_no_send_modal").html(),
				},
				success : function() {
					alert("좋아요완료!");
					location.reload();
				}
			});
		});

	});
</script>

<script type="text/javascript">
	
</script>

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

#btn_List, #btn_Modify, #btn_Delete, #btn_submit, #btn_cancel {
	float: right;
}

#viewCount {
	float: right;
}
</style>

<title>videoDetail</title>
</head>
<body>

	<div class="form-group">
		<form id="func">
			<!-- 삭제, 수정을 위한 form -->
			<h3 class="ui block header" id="board_no_send_modal"></h3>
			<input type="hidden" name="board_no" id="board_no_view">
			<h3 class="ui top attached header" id="video_title_modal"></h3>
			<h3 class="ui top attached header" id="video_title_modify">
				<label>제목 : </label> <input id="video_title_modify_val" type="text"
					name="modify_title_val" size="70"> <input type="hidden"
					name="board_title">
			</h3>
			<div id="video_writer"></div>
			<div class="ui attached segment">


				<div class='embed-container'>

					<div id="video_content_modify">
						<label>링크 : </label><input id="video_content_modify_val"
							type="text" size="100" name="modify_content_val">
						<input type="hidden" name="board_content">
					</div>
					<div class="video_play" id="video_content_play"></div>
				</div>
				<br>
			</div>
		</form>
		<div>
			<form id="like_data" method="get">
				<div class="ui labeled button" tabindex="0" id="likeBtn">
			<div class="ui red button">
				<i class="heart icon"></i> Like
			</div>

			<a class="ui basic red left pointing label" id="likeConut">
				${UserInfoBoardVO.board_recomm } </a>

		</div>
			</form>
		</div>
		<!-- ================reply start================== -->
		<div class="ui threaded comments">

			<div >
				<h3 class="ui dividing header">댓글</h3>
				<div class="comment">
					<div class="content"></div>
					<div class="comment"></div>
				</div>
				<div class="comment">
					<div class="content">
						<div class="metadata">
							<span class="date">${UserVideoBoardVO.board_date }</span>
						</div>
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
		<div class="buttons">
			<button class="ui blue basic button" id="btn_List">LIST ALL</button>
			<button class="ui yellow basic button" id="btn_Modify">MODIFY</button>
			<button class="ui red basic button" id="btn_Delete">DELETE</button>
			<button class="ui green basic button" id="btn_submit">SUBMIT</button>
			<button class="ui red basic button" id="btn_cancel">CANCEL</button>
		</div>
	</div>
	<!--  /.div-body -->
</body>
</html>