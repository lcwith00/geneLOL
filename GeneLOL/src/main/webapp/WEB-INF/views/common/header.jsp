<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#login').click(function() {
			$('.ui.modal').modal('show');
		});
	});
</script>
<style type="text/css">
.ui.modal {
	width: 40% !important;
	margin-left: -20% !important;
}
</style>
<title>header</title>
<style type="text/css">
.ui.top.inverted.menu {
	min-width: 600px;
	overflow-x: scroll !important;
	margin-top: 0 !important;
}
</style>
</head>
<body>
	<div class="ui top inverted menu">
		<div class="ui container">
			<a href="#" class="header item"> <img class="logo"
				src="resources/images/logo.png">&nbsp&nbspGeneLoL
			</a> <a href="#" class="item">랭킹</a>
			<div class="ui simple dropdown item">
				<span class="text">통계</span>
				<div class="menu">
					<div class="item">챔피언 별</div>
					<div class="item">티어 별</div>
				</div>
			</div>
			<a href="#" class="item">동영상</a> <a href="#" class="item">정보</a>
			<div class="ui right item">
				<div class="ui inverted button" id="login">로그인</div>
			</div>
		</div>
	</div>
	<div class="ui modal">
		<%@ include file="signup.jsp"%>
	</div>
</body>
</html>