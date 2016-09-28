<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
<link rel="stylesheet" type="text/css"
	href="resources/semantic-ui/semantic.min.css">
<script src="resources/semantic-ui/semantic.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript">
	/* 비디오 게시판 버튼 클릭 시 처리 이벤트*/
	$(document).ready(function() {
		$("#userVideoBoardForm").click(function() {
			location.href = "/videoBoard/videoWriteForm.do";
		});
		$('.ui.pointing.dropdown').dropdown();
	});
</script>
<style type="text/css">
body {
	margin: 0 auto;
	width: 100%;
	height: 100vh;
}

#contents {
	max-width: 1024px;
	min-height: 1000px;
}
</style>
</head>
<body>
	<header>
		<%@ include file="common/header.jsp"%>
	</header>
	<div id="contents">
		<h1>Hello world!</h1>
		<input type="button" id="userVideoBoardForm" value="링크달기">
		<P>The time on the server is ${serverTime}.</P>
		<div class="ui button">여기에 시맨틱 UI관련 테스트를 해보세요!!</div>
	</div>
	<footer>
		<%@ include file="common/footer.jsp"%>
	</footer>
</body>
</html>
