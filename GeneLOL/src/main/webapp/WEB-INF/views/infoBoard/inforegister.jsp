<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko" class="no-js">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/semantic-ui/semantic.min.css">
<script src="/resources/semantic-ui/semantic.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$('#registBtn').click(function() {

		});

	});
</script>


<style type="text/css">
div #top {
	position: relative;
}

div #type {
	position: relative;
}

div #buttons {
	float: right;
}
</style>
<title>videoWrite</title>
</head>
<body>
	<form class="ui form" id="registForm" method="post"
		action="/info/register">
		<input type="hidden" value="info" name="board_id">
		<div class="field">
			<label>제목</label> <input type="text" name="board_title"
				id="board_title">
		</div>
		<div class="ui form">
			<div class="field">
				<label>내용</label>
				<textarea name="board_content"></textarea>
			</div>
		</div>

		<input type="hidden" name="userid" value="${login.userID }"> file : <input
			type="file" name="filename">

		<button class="ui green button" type="submit" id="registBtn">Submit</button>
		<div class="ui red button" id="cancle">Cancle</div>
	</form>
</body>
</html>