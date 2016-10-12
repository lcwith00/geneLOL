<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="resources/semantic-ui/semantic.min.css">
<script src="resources/semantic-ui/semantic.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.menu .item').tab();
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.menu .item').tab();
	});
</script>
</head>
<body>
	<div class="contents">
		<!-- list -->
		<div id="videoBoardlist">
			<div class="ui top attached tabular menu">
				<a class="item active" data-tab="first">전체글 보기</a> <a class="item"
					data-tab="second">전체 댓글 보기</a> <a class="item" data-tab="third">공지글
					관리</a>
				<div class="right menu">
					<div class="item">
						<div class="ui transparent icon input">
							<input type="text" placeholder="Search users..."> <i
								class="search link icon"></i>
						</div>
					</div>
				</div>
			</div>
			<div class="ui bottom attached tab segment active" data-tab="first">
				First</div>
			<div class="ui bottom attached tab segment" data-tab="second">
				Second</div>
			<div class="ui bottom attached tab segment" data-tab="third">
				Third</div>
		</div>
	</div>
</body>
</html>