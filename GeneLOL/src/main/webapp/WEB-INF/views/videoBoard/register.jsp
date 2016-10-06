<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en" class="no-js">
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
		$('#LOLbtn').click(function() {
			$('#clickBtn').val("videoLOL");
		});
		$('#Funbtn').click(function() {
			$('#clickBtn').val("videoFun");
		});
		$('#Etcbtn').click(function() {
			$('#clickBtn').val("videoEtc");
		});
		$('#registBtn').click(function() {
			alert("등록완료");
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
	<div class="ui top attached label" id="top">링크 등록</div>

	<div id="type">
		<a class="ui tag label">분류 </a>
		<div class="ui blue basic button" id="LOLbtn">LOL</div>
		<div class="ui violet basic button" id="Funbtn">FUN</div>
		<div class="ui purple basic button" id="Etcbtn">Etc</div>
	</div>

	<form class="ui form" id="registForm" method="post" action="/video/register">
		<input type="hidden" value="test" id="clickBtn" name="board_id">
		<div class="field">
			<label>VideoLink</label> <input type="text" name="board_content"
				placeholder="Video Link" id="board_content" value="http://">
		</div>
		<div class="field">
			<label>VideoTitle</label> <input type="text" name="board_title"
				id="board_title">
		</div>
		<input type="hidden" name="userid" value="1">
	
		<div class="field">
			<div class="ui checkbox">
				<input type="checkbox" tabindex="0" class="hidden"> <label>I
					agree to the Terms and Conditions</label>
			</div>
		</div>
		<button class="ui green button" type="submit" id="registBtn">Submit</button>
		<div class="ui red button" id="cancle">Cancle</div>
	</form>
</body>
</html>