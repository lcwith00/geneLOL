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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="resources/semantic-ui/semantic.min.js"></script>
<style type="text/css">
body {
	background-color: #DADADA;
}

body>.grid {
	height: 100%;
}

.image {
	margin-top: -100px;
}

.column {
	max-width: 450px;
}
</style>
<script>
	$(document).ready(function() {
		$('.menu .item').tab();
		$('.ui.form').form({
			fields : {
				email : {
					identifier : 'email',
					rules : [ {
						type : 'empty',
						prompt : 'Please enter your e-mail'
					}, {
						type : 'email',
						prompt : 'Please enter a valid e-mail'
					} ]
				},
				password : {
					identifier : 'password',
					rules : [ {
						type : 'empty',
						prompt : 'Please enter your password'
					}, {
						type : 'length[6]',
						prompt : 'Your password must be at least 6 characters'
					} ]
				}
			}
		});
	});
	
	function insert() {
		var str = document.getElementById('insertUserForm');
		str.submit();
	}
</script>
<style type="text/css">
.lastpassClearHidden::-ms-clear {
	display: none;
}
</style>
</head>
<body>
	<div class="ui top attached tabular menu" style="max-width: 450px">
		<a class="item" data-tab="signin"> 로그인 </a> <a class="item active"
			data-tab="signup"> 회원가입 </a>
	</div>
	<div class="ui bottom attached tab segment" data-tab="signin">
		<div class="ui middle aligned center aligned grid">
			<div class="column">

				<form class="ui large form">
					<div class="ui stacked segment">
						<div class="field">
							<div class="ui left icon input">
								<i class="user icon"></i> <input type="text" name="userMail"
									placeholder="Email">
							</div>
						</div>
						<div class="field">
							<div class="ui left icon input">
								<i class="lock icon"></i> <input type="password"
									name="userPassword" placeholder="password">
							</div>
						</div>
						<div class="ui fluid large teal submit button">로그인</div>
					</div>

					<div class="ui error message"></div>

				</form>
			</div>
		</div>
	</div>
	<div class="ui bottom attached tab segment active" data-tab="signup">
		<div class="ui middle aligned center aligned grid">
			<div class="column">

				<form class="ui large form">
					<div class="ui stacked segment">
						<div class="field">
							<div class="ui left icon input">
								<i class="user icon"></i> <input type="text" name="userName"
									placeholder="ID">
							</div>
						</div>
						<div class="field">
							<div class="ui left icon input">
								<i class="user icon"></i> <input type="text" name="userMail"
									placeholder="Email">
							</div>
						</div>
						<div class="field">
							<div class="ui left icon input">
								<i class="lock icon"></i> <input type="password"
									name="userPassword" placeholder="password">
							</div>
						</div>
						<div>
							<input type="checkbox" id="accept-terms"> 
							<label for="accept-terms"><a href="#0">약관</a>을 모두 읽고 동의합니다.</label>
						</div>
						<div class="ui fluid large teal submit button">회원가입</div>
					</div>

					<div class="ui error message"></div>

				</form>
			</div>
		</div>
	</div>
</body>
</html>