<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@page import="javafx.scene.control.Alert"%>
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
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="../resources/semantic-ui/semantic.min.css">
<script src="../resources/semantic-ui/semantic.min.js"></script>



<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[role='form']");

		$("#btn_Modify").on("click", function() {
			formObj.attr("action", "/video/videoUpdateView");
			formObj.attr("method", "get");
			formObj.submit();
		});
		$("#btn_Delete").on("click", function() {
			formObj.attr("action", "/video/videoDelete");
			formObj.attr("method", "post");
			formObj.submit();
		});

		/* 	$("#like_input_data").val("1");
			$("#like_data").attr("action", "/video/videoDetail");
			$("#like_data").attr("method", "get");
			$("#like_data").submit();
		 */
		$("#likebtn").on("click", function() {
			$.ajax({
				type : "POST",
				url : "/video/videoLike",
				dataType : 'text', // 서버로부터 되돌려받는 데이터의 타입을 명시하는 것이다.
				data : { // 서버로 보낼 데이터 명시 
					board_no : $("#board_id_for_like").val(),
					board_recomm : $("#like_input_data").val()
				},
				success : function() {
					alert("전송완료");
				}

			});

		});

	});
</script>

<script type="text/javascript">
	// Add contents for max height
<%String like = "";

			try {
				Cookie[] cookies = request.getCookies();

				if (cookies != null) {
					for (int i = 0; i < cookies.length; i++) {
						if (cookies[i].getName().equals("like")) {
							like = cookies[i].getValue();
						}
					}

					if (like.equals("1")) {
						out.println("추천됨");
					}

				} else {
					response.sendRedirect("videolistpage.jsp");
				}

			} catch (Exception e) {
			}%>
	$(document).ready(function() {

	});
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

#btn_List, #btn_Modify, #btn_Delete {
	float: right;
}

#viewCount {
	float: right;
}
</style>

<title>videoDetail</title>
</head>
<body>

	<form role="form" method="post" action="/video/videoDetail">
		<input type='hidden' name='board_no' id="board_id_for_like"> <input
			type='hidden' name='board_no' id='board_no'
			value="${UserVideoBoardVO.board_no }">
	</form>

	<div class="form-group">
		<h3 class="ui block header"></h3>

		<h3 class="ui top attached header">${UserVideoBoardVO.board_title }

		</h3>
		<div id="writer">글쓴이 : ${UserVideoBoardVO.userid }</div>
		<div class="ui attached segment" id="bg">


			<a class="ui black label">Content</a>
			<div class='embed-container'>

				<div class="video_play">
					<iframe
						src='http://www.youtube.com/embed/${UserVideoBoardVO.board_content }'
						frameborder='0' allowfullscreen></iframe>
				</div>
			</div>
			<br>
		</div>
		<div>
			<form id="like_data" method="get">
				<div class="ui labeled button" tabindex="0">
					<div class="ui button" id="likebtn">
						<i class="heart icon"></i> Like <input type="hidden"
							name="board_recomm" value="1" id="like_input_data">
					</div>
					<a class="ui basic label"> ${UserVideoBoardVO.board_recomm } </a>
				</div>

				<div class="ui blue labels" id="viewCount">
					<a class="ui label"> 조회수 : ${UserVideoBoardVO.board_count}</a>
				</div>

			</form>

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
							<span class="date">${UserVideoBoardVO.board_date }</span>
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
</body>
</html>