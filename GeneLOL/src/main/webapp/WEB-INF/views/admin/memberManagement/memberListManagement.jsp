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
						</div>
					</div>
				</div>

			</div>
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
</body>
</html>