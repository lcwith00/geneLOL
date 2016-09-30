<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">



<link rel="stylesheet" type="text/css"
	href="../resources/semantic-ui/semantic.min.css">
<script src="../resources/semantic-ui/semantic.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#registBtn").click( //등록 버튼 클릭 시 처리 이벤트
		function() { //입력값 체크
			$("#board_title").val();
			$("#board_content").val();
			$("#userid").val();

			
			
		});
	});
</script>
<title>videoWrite</title>
</head>
<body>

	<form class="ui form" id="registForm" method="post">
		<a class="ui tag label">분류</a>
		<button class="ui teal basic button">ALL</button>
		<button class="ui blue basic button">LOL</button>
		<button class="ui violet basic button">FUN</button>
		<button class="ui purple basic button">Etc</button>
		<div class="field">
			<label>VideoLink</label> <input type="text" name="board_content"
				placeholder="Video Link" id="board_content" name="">
		</div>
		<div class="field">
			<label>VideoTitle</label> <input type="text" name="board_title"
				placeholder="Video Title" id="board_title">
		</div>
		<div class="field">
			<label>UserID</label> <input type="text" name="userID"
				placeholder="User Name" id="userID">
		</div>
		<div class="field">
			<label>password</label> <input type="text" name="last-name"
				placeholder="Password" id="passwd">
		</div>
		<div class="field">
			<div class="ui checkbox">
				<input type="checkbox" tabindex="0" class="hidden"> <label>I
					agree to the Terms and Conditions</label>
			</div>
		</div>
		<button class="ui button" type="submit" id="registBtn">Submit</button>
		<button class="ui button" type="reset" id="cancle">Cancle</button>
	</form>
</body>
</html>