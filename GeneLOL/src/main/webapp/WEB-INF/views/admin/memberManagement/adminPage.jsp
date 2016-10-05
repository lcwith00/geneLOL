<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="../../resources/semantic-ui/semantic.min.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="../../resources/semantic-ui/semantic.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.ui.accordion').accordion();
		$('.menu .item').tab();
	});

	function loadVideoBoard() {
		$("#list").load("adminVideoBoard");
	};

	function loadInfoBoard() {
		$("#list").load("adminInformationBoard");
	};

	function loadUserStatistics() {
		$("#list").load("adminUserStatistics");
	};

	function loadMemberList() {
		$("#list").load("memberListManagement");
	};

	function loadSecessionList() {
		$("#list").load("secessionListManagement");
	};

	function loadadminList() {
		$("#list").load("adminListManagement");
	};
</script>
<style>
header {
	width: 100%;
	height: 50px;
}

#sideMenu {
	float: left;
	width: 20%;
	min-height: 400px;
	margin-top: 3%;
	margin-left: 3.5%;
}

#list {
	width: 70%;
	min-height: 600px;
	float: right;
	margin-top: 3%;
	margin-right: 3.5%;
}

#footer {
	clear: both;
	width: 100%;
	height: 50px;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../../common/header.jsp"%>
	</header>
	<div class="contents">
		<!-- side menu -->
		<div class="aside" id="sideMenu">
			<div class="ui styled accordion">
				<div class="active title">
					<i class="dropdown icon"></i>게시판 관리
				</div>
				<div class="active content">
					<ul>
						<li><a id="videoBoard" href="javascript:void(0)"
							onclick="loadVideoBoard()"><span>동영상 게시판</span></a></li>
						<li><a id="infoBoard" href="javascript:void(0)"
							onclick="loadInfoBoard()"><span>정보 게시판</span></a></li>
					</ul>
				</div>
				<div class="title">
					<i class="dropdown icon"></i> 통계
				</div>
				<div class="content">
					<ul>
						<li><a id="userStatistics" href="javascript:void(0)"
							onclick="loadUserStatistics()"> <span>방문자 통계</span></a></li>
					</ul>
				</div>
				<div class="title">
					<i class="dropdown icon"></i> 회원 관리
				</div>
				<div class="content">
					<ul>
						<li><a id="memberList" href="javascript:void(0)"
							onclick="loadMemberList()"> <span>회원 목록</span>
						</a></li>
						<li><a id="secessionList" href="javascript:void(0)"
							onclick="loadSecessionList()"><span>탈퇴 목록</span></a></li>
					</ul>
				</div>
				<div class="title">
					<i class="dropdown icon"></i> 관리자 관리
				</div>
				<div class="content">
					<ul>
						<li><a id="adminList" href="javascript:void(0)"
							onclick="loadadminList()"> <span>관리자 목록</span>
						</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- list -->
		<div id="list">관리자 메인이지롱</div>
	</div>

	<footer id="footer">
		<%@ include file="../../common/footer.jsp"%>
	</footer>
</body>
</html>