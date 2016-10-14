<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 목록</title>
<link rel="stylesheet" type="text/css"
	href="resources/semantic-ui/semantic.min.css">
<script src="resources/semantic-ui/semantic.min.js"></script>
<style type="text/css">
#button {
	float: right;
}
</style>
</head>
<body>
<<<<<<< HEAD
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
							게시판</a><br> <a target="list" href="informationBoard.jsp">-정보
							게시판</a>
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
=======
	<div class="contents">-->
				<!-- list -->
				<div id="memberList">
					<div class="ui top attached tabular menu">
						<a class="item active" data-tab="first">회원 목록</a>
						<div class="right menu">
							<div class="item">
								<div class="ui transparent icon input">
									<input type="text" placeholder="Search users..."> <i
										class="search link icon"></i>
								</div>
							</div>
=======
	<div class="contents">
		<!-- list -->
		<div id="memberList">
			<div class="ui top attached tabular menu">
				<a class="item active" data-tab="first">회원 목록</a>
				<div class="right menu">
					<div class="item">
						<div class="ui transparent icon input">
							<input type="text" placeholder="Search users..."> <i
								class="search link icon"></i>
>>>>>>> bcb32f8c442fc184674e3b57694710bc4099907b
						</div>
					</div>
					<div class="ui bottom attached tab segment active" data-tab="first">
						목록.....</div>
				</div>

			</div>
<<<<<<< HEAD
=======
			<div class="ui bottom attached tab segment active" data-tab="first">
				<div class="ui five column grid">
					<div class="one wide column">번호</div>
					<div class="two wide column">이름</div>
					<div class="four wide column">이메일</div>
					<div class="three wide column">가입일</div>
					<div class="one wide column">인증</div>
				</div>
				<c:forEach items="${list}" var="UserVO">
					<div class="ui five column grid">
						<div class="one wide column">${UserVO.userID}</div>
						<div class="two wide column">${UserVO.userName}</div>
						<div class="four wide column">${UserVO.userMail}</div>
						<div class="three wide column">${UserVO.joinDate}</div>
						<div class="one wide column">${UserVO.userType}</div>
					</div>
				</c:forEach>
				<div id="button">
					<input type="button" value="탈퇴" id="secession">
				</div>
			</div>
		</div>
	</div>
>>>>>>> bcb32f8c442fc184674e3b57694710bc4099907b
</body>
</html>