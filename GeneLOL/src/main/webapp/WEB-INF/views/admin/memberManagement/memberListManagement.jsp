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
<style>
.search .link.icon {
	background-color: white;
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
				목록.....</div>
		</div>
	</div>
</body>
</html>