<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="resources/semantic-ui/semantic.min.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="resources/semantic-ui/semantic.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#a').click(function() {
			$('#list').load('adminVideoBoard.jsp');
		});
		$('#b').click(function() {
			$('#list').load('informationBoard.jsp');
		});
		$('.ui.accordion').accordion();
		$('.menu .item').tab();

	});
</script>

<style>
header {
	width: 100%;
	height: 80px;
	background-color: gray;
}

.aside {
	left: 30px;
	float: left;
	width: 20%;
	min-height: 400px;
	margin-left: 10%;
}

#list {
	width: 60%;
	min-height: 600px;
	float: right;
	margin-right: 10%;
}

footer {
	clear: both;
	top: 700px;
	width: 100%;
	min-height: 80px;
	background-color: red;
}
</style>
</head>
<body>
	<header>
	<h1>header</h1>
	</header>
	<form>
		<div class="nav"></div>
		<div class="contents">
			<!-- side menu -->
			<div class="aside">
				<div class="ui styled accordion">
					<div class="active title">
						<i class="dropdown icon"></i>게시판 관리
					</div>
					<div class="active content">
						<ul>
							<li><a href='#' id="a"><span>-동영상 게시판</span></a></li>
							<li><a href='#' id="b"><span>-정보 게시판</span></a></li>
						</ul>
						<a target="list" href="/admin/memberManagement/videoBoard.jsp">-동영상
							게시판</a></br> <a target="list" href="informationBoard.jsp">-정보 게시판</a>
					</div>
					<div class="title">
						<i class="dropdown icon"></i> 통계
					</div>
					<div class="content">
						<a>-방문자 통계</a>
					</div>
					<div class="title">
						<i class="dropdown icon"></i> 회원 관리
					</div>
					<div class="content">
						<a>-회원 목록</a> <a>-탈퇴 목록</a>
					</div>
					<div class="title">
						<i class="dropdown icon"></i> 관리자 관리
					</div>
					<div class="content">
						<p>-관리자 목록</p>
					</div>
				</div>
			</div>
			<!-- content -->
			<div id="list">
				<!-- <div class="ui top attached tabular menu">
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
					Third</div> -->
			</div>
		</div>
	</form>
	<footer>
	<h1>FOOTER</h1>
	</footer>
</body>
</html>