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
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js">
	
</script>
<script type="text/javascript">
	function allChk(obj) {
		var chkObj = document.getElementsByName("rowCheck");
		var rowCnt = chkObj.length - 1;
		var check = obj.checked;
		if (check) {
			for (var i = 0; i <= rowCnt; i++) {
				if (chkObj[i].type == "checkbox")
					chkObj[i].checked = true;
			}
		} else {
			for (var i = 0; i <= rowCnt; i++) {
				if (chkObj[i].type == "checkbox") {
					chkObj[i].checked = false;
				}
			}
		}
	}﻿
</script>
<style type="text/css">
.button {
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
					<div class="ui bottom attached tab segment active" data-tab="first">
						<div class="ui five column grid">
							<div class="one wide column">
								<div class="ui master checkbox">
									<input type="checkbox" onclick="allChk(this)" id="allCheck"><label></label>
								</div>
							</div>
							<div class="one wide column">번호</div>
							<div class="two wide column">이름</div>
							<div class="four wide column">이메일</div>
							<div class="three wide column">가입일</div>
							<div class="one wide column">인증</div>
						</div>
						<c:forEach items="${list}" var="UserVO">
							<div class="ui five column grid">
								<div class="one wide column">
									<div class="ui child checkbox">
										<input type="checkbox" name="rowCheck"
											value="${UserVO.userID}"><label></label>
									</div>
								</div>
								<div class="one wide column">${UserVO.userID}</div>
								<div class="two wide column">${UserVO.userName}</div>
								<div class="four wide column">${UserVO.userMail}</div>
								<div class="three wide column">${UserVO.joinDate}</div>
								<div class="one wide column">${UserVO.userType}</div>
							</div>
						</c:forEach>
						<div class="buttons">
							<button class="ui red basic button" id="btn_Delete"
								onclick="btn_delete">DELETE</button>
							<button class="ui yellow basic button" id="btn_Modify">MODIFY</button>
							<button class="ui blue basic button" id="btn_List">List
								ALL</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>