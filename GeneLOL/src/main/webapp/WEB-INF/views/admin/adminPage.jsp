<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>

<!DOCTYPE html>
<html>
<head>
<title>Admin Page</title>
<link rel="stylesheet" type="text/css"
	href="resources/semantic-ui/semantic.min.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="resources/semantic-ui/semantic.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.ui.accordion').accordion();
	});

	function loadVideoBoard() {
		$("#list").load("adminvideoboard")
	}

	function loadInfoBoard() {
		$("#list").load("admininformationboard");
	}

	function loadTrashBoard() {
		$("#list").load("admintrashboard");
	}

	function loadUserStatistics() {
		$("#list").load("adminUserStatistics");
	}

	function loadMemberList() {
		$("#list").load("memberlistmanagement");
	}

	function loadSecessionList() {
		$("#list").load("secessionlistmanagement");
	}

	function loadAdminList() {
		$("#list").load("operatorlistmanagement");
	}
</script>
<style>
header {
	width: 100%;
	height: 50px;
}

#adminContents {
	height: 100% !important;
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
		<%@ include file="../common/header.jsp"%>
	</header>
	<div class="contents" id="adminContents">
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
						<li><a id="trashBoard" href="javascript:void(0)"
							onclick="loadTrashBoard()"><span>휴지통</span></a></li>
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
							onclick="loadMemberList()"><span>회원 목록</span> </a></li>
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
							onclick="loadAdminList()"> <span>관리자 목록</span>
						</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- list -->
		<div id="list">
			<h1>관리자 페이지</h1>
		</div>
	</div>
	<footer id="footer">
		<%@ include file="../common/footer.jsp"%>
	</footer>
</body>
</html>