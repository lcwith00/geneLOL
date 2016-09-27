<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="resources/signup/css/reset.css">
<!-- CSS reset -->
<link rel="stylesheet" href="resources/signup/css/style.css">
<!-- Gem style -->
<script src="resources/signup/js/modernizr.js"></script>
<!-- Modernizr -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="resources/signup/js/main.js"></script>
<!-- Gem jQuery -->
<script type="text/javascript">
	function insert() {
		var str = document.getElementById('insertUserForm');
		str.submit();
	}
</script>
</head>
<body>
	<header role="banner">
		<nav class="main-nav-left">
			<ul>
				<!-- insert more links here -->

			</ul>
		</nav>
		<nav class="main-nav">
			<ul>
				<!-- insert more links here -->
				<li><a class="cd-ranking" href="#0">랭킹</a></li>
				<li><a class="cd-statistics" href="#0">통계</a></li>
				<li><a class="cd-video" href="#0">동영상</a></li>
				<li><a class="cd-info" href="#0">정보</a></li>
				<li><a class="cd-signin" href="#signin">로그인</a></li>
				<li><a class="cd-signup" href="#signup">회원가입</a></li>
			</ul>
		</nav>
	</header>

	<div class="cd-user-modal">
		<!-- this is the entire modal form, including the background -->
		<div class="cd-user-modal-container">
			<!-- this is the container wrapper -->
			<ul class="cd-switcher">
				<li><a href="#signin">로그인</a></li>
				<li><a href="#signup">회원가입</a></li>
			</ul>

			<div id="cd-login">
				<!-- log in form -->
				<form class="cd-form">
					<p class="fieldset">
						<label class="image-replace cd-email" for="signin-email">E-mail</label>
						<input class="full-width has-padding has-border" id="signin-email"
							type="email" placeholder="E-mail"> <span
							class="cd-error-message">E-mail을 입력해주세요!</span>
					</p>

					<p class="fieldset">
						<label class="image-replace cd-password" for="signin-password">Password</label>
						<input class="full-width has-padding has-border"
							id="signin-password" type="password" placeholder="Password">
						<span class="cd-error-message">비밀번호를 정확하게 입력해주세요!</span>
					</p>

					<p class="fieldset">
						<input class="full-width" type="submit" value="로그인">
					</p>
				</form>

				<p class="cd-form-bottom-message">
					<a href="#0">비밀번호를 잊으셨나요?</a>
				</p>
				<!-- <a href="#0" class="cd-close-form">Close</a> -->
			</div>
			<!-- cd-login -->

			<div id="cd-signup">
				<!-- sign up form -->
				<form class="cd-form" id="insertUserForm" method="post">
					<p class="fieldset">
						<label class="image-replace cd-username" for="signup-username">Username</label>
						<input class="full-width has-padding has-border" name="userName"
							id="signup-username" type="text" placeholder="닉네임"> <span
							class="cd-error-message">Error message here!</span>
					</p>

					<p class="fieldset">
						<label class="image-replace cd-email" for="signup-email">E-mail</label>
						<input class="full-width has-padding has-border" id="signup-email"
							name="userMail" type="email" placeholder="E-mail"> <span
							class="cd-error-message">Error message here!</span>
					</p>

					<p class="fieldset">
						<label class="image-replace cd-password" for="signup-password">Password</label>
						<input class="full-width has-padding has-border"
							name="userPassword" id="signup-password" type="password"
							placeholder="Password"> <span class="cd-error-message">Error
							message here!</span>
					</p>

					<p class="fieldset">
						<input type="checkbox" id="accept-terms"> <label
							for="accept-terms"><a href="#0">약관</a>을 모두 읽고 동의합니다.</label>
					</p>

					<p class="fieldset">
						<input class="full-width has-padding" type="submit" value="회원가입"
							onclick="javascript:insert">
					</p>
				</form>

				<!-- <a href="#0" class="cd-close-form">Close</a> -->
			</div>
			<!-- cd-signup -->

			<div id="cd-reset-password">
				<!-- reset password form -->
				<p class="cd-form-message">비밀번호 초기화</p>

				<form class="cd-form">
					<p class="fieldset">
						<label class="image-replace cd-email" for="reset-email">E-mail</label>
						<input class="full-width has-padding has-border" id="reset-email"
							type="email" placeholder="E-mail"> <span
							class="cd-error-message">Error message here!</span>
					</p>

					<p class="fieldset">
						<input class="full-width has-padding" type="submit" value="메일 발송">
					</p>
				</form>

				<p class="cd-form-bottom-message">
					<a href="#0">돌아가기</a>
				</p>
			</div>
			<!-- cd-reset-password -->
			<a href="#0" class="cd-close-form">Close</a>
		</div>
		<!-- cd-user-modal-container -->
	</div>
	<!-- cd-user-modal -->
</body>
</html>