<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 목록</title>
<link rel="stylesheet" type="text/css"
	href="resources/semantic-ui/semantic.min.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="resources/semantic-ui/semantic.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.ui.accordion').accordion();
		$('.menu .item').tab();
	});
</script>

<style>
header {
	width: 100%;
	height: 50px;
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
	min-height: 644px;
	float: right;
	margin-right: 10%;
}

.contents {
	margin-top: 3px;
}

footer {
	clear: both;
	width: 100%;
	height: 50px;
}

.input {
background-color: white;
}
</style>
</head>
<body>
	<header><%@ include file="../../common/header.jsp"%>
	</header>
	<div class="contents">
		<!-- side menu -->
		<div class="aside">
			<div class="ui styled accordion">
				<div class="title">
					<i class="dropdown icon"></i>게시판 관리
				</div>
				<div class="content">
					<ul>
						<li><a href="/adminVideoBoard"> <span>동영상 게시판</span>
						</a></li>
						<li><a href="/adminInformationBoard"><span>정보 게시판</span></a></li>
					</ul>
				</div>
				<div class="title">
					<i class="dropdown icon"></i> 통계
				</div>
				<div class="content">
					<ul>
						<li><a href="/xxx"> <span>방문자 통계</span>
						</a></li>
					</ul>
				</div>
				<div class="active title">
					<i class="dropdown icon"></i> 회원 관리
				</div>
				<div class="active content">
					<ul>
						<li><a href="/memberListManagement"> <span>회원 목록</span>
						</a></li>
						<li><a href="/secessionListManagement"><span>탈퇴 목록</span></a></li>
					</ul>
				</div>
				<div class="title">
					<i class="dropdown icon"></i> 관리자 관리
				</div>
				<div class="content">
					<ul>
						<li><a href="/adminListManagement"> <span>관리자 목록</span>
						</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- list -->
		<div id="list">
			<div class="ui top attached tabular menu">
				<a class="item active" data-tab="first">관리자 목록</a>
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
				목록.....</div>
		</div>
	</div>
	<footer><%@ include file="../../common/footer.jsp"%></footer>
</body>
</html>