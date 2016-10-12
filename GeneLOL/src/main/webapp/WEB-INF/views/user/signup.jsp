<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="resources/semantic-ui/semantic.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="resources/semantic-ui/semantic.min.js"></script>
<style type="text/css">
#modal_body {
	background-color: #DADADA !important;
}

#modal_body>.grid {
	height: 100% !important;
}

#send-mail {
	width: 45% !important;
	float: left !important;
}

#back {
	width: 45% !important;
	float: right !important;
}

#resetP {
	margin-bottom: 0px !important;
}

#resetBack:link {
	color: white;
	text-decoration: none;
}

#resetButton {
	height: 30px !important;
}
</style>
<script>
	$(document)
			.ready(
					function() {
						$('.menu .item').tab();
						$('.ui.form')
								.form(
										{
											fields : {
												userName : {
													identifier : 'userName',
													rules : [ {
														type : 'regExp[/^[a-z]{1}[a-z0-9]{3,15}$/]',
														prompt : 'ID는 알파벳 소문자로 시작하는 4-16자의 알파벳 소문자/숫자로 입력해주세요.'
													} ]
												},
												userMail : {
													identifier : 'userMail',
													rules : [ {
														type : '/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/',
														prompt : '유효하지 않은 이메일입니다.'
													} ]
												},
												userPassword : {
													identifier : 'userPassword',
													rules : [ {
														type : 'length[6]',
														prompt : '비밀번호는 최소 6자리 이상 입력해주세요.'
													} ]
												},
												acceptTerms : {
													identifier : 'acceptTerms',
													rules : [ {
														type : 'checked',
														prompt : '약관을 읽고 동의해주세요.'
													} ]
												}

											}
										});

						$('#userName').focusout(function() {
							$.ajax({
								url : "/user/idcheck",
								type : "post",
								data : {
									userName : $("#userName").val()
								},
								dataType : "json",
								success : function(data) {
									if (data.result == "success") {
										$('#duplicatedID').val("Y");
									} else {
										$('#duplicatedID').val("N");
									}
								}
							});
						});

						$('#userMail').focusout(function() {
							$.ajax({
								url : "/user/mailcheck",
								type : "post",
								data : {
									userMail : $("#userMail").val()
								},
								dataType : "json",
								success : function(data) {
									if (data.result == "success") {
										$('#duplicatedMail').val("Y");
									} else {
										$('#duplicatedMail').val("N");
									}
								}
							});
						});
					});

	function insertUser() {

		var idRegExp = /^[a-z]{1}[a-z0-9]{3,15}$/;
		var id = document.getElementById('userName');
		var mailRegExp = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
		var mail = document.getElementById('userMail');
		var password = document.getElementById('userPassword');

		if (id.value == "" || id.value == null) {
			return false;
		}

		if (!idRegExp.test($('#userName').val())) {
			return false;
		}

		if (mail.value == "" || mail.value == null) {
			return false;
		}

		if (!mailRegExp.test($('#userMail').val())) {
			return false;
		}

		if (password.value == "" || password.value == null
				|| password.value.length < 6) {
			return false;
		}

		if ($("input:checkbox[id='acceptTerms']").is(':checked') == false) {
			return false;
		}

		if ($('#duplicatedID').val() == "N") {
			alert($('#userName').val() + "은 이미 사용중인 ID입니다.")
			return false;
		}

		if ($('#duplicatedMail').val() == "N") {
			alert($('#userMail').val() + "은 이미 사용중인 이메일입니다.")
			return false;
		}

		else {
			alert("가입이 완료되었습니다. 다시 로그인해주세요.")
			var insert = document.getElementById('insertUserForm');
			insert.submit();
		}
	}

	function reset() {
		$('#reset-passwordTab').addClass('active');
		$('#signin').removeClass('active');
		$('#signinTab').removeClass('active');
	}

	function resetBack() {
		var element = document.getElementById("reset-password");
		element.style.visibility = "hidden";
		$('#signin').addClass('active');
		$('#signinTab').addClass('active');
		$('#reset-password').removeClass('active');
		$('#reset-passwordTab').removeClass('active');
	}
</script>

<div id="modal_body">
	<div class="ui top attached tabular menu" style="max-width: 450px">
		<a class="item active" id="signin" data-tab="signin">로그인</a> <a
			class="item" data-tab="signup">회원가입</a> <a class="item"
			data-tab="reset-password" id="reset-password"
			style="visibility: hidden">비밀번호 초기화</a>
	</div>
	<div class="ui bottom attached tab segment active" data-tab="signin"
		id="signinTab">
		<div class="ui middle aligned center aligned grid">
			<div class="column" id="modal_column">
				<form class="ui large form" method="post" action="/user/login">
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
					<p id="resetP">
						<a href="javascript:void(0);" onclick="reset();" id="reset">비밀번호를
							잊으셨나요?</a>
					</p>
					<div class="ui error message"></div>
				</form>
			</div>
		</div>
		<<<<<<< HEAD
	</div>
	<div class="ui bottom attached tab segment" data-tab="reset-password"
		id="reset-passwordTab">
		<div class="ui middle aligned center aligned grid">
			<div class="column">
				<form class="ui large form" id="reset-password" method="post">
					<div class="ui stacked segment" id="resetUI">
						<div class="field">비밀번호 초기화</div>
						<div class="field">
							<div class="ui left icon input">
								<i class="user icon"></i> <input type="text" name="userMail"
									placeholder="Email">
							</div>
							<div class="field" id="resetButton">
								<div class="ui fluid teal button" id="send-mail">메일발송</div>
								<div class="ui fluid teal button" id="back">
									<a href="javascript:void(0);" onclick="resetBack();"
										id="resetBack">돌아가기</a>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="ui bottom attached tab segment" data-tab="signup">
		<div class="ui middle aligned center aligned grid">
			<div class="column">
				<form class="ui large form" id="insertUserForm" method="post"
					action="/user/signup" onsubmit="return insertUser()">
					<div class="field">
						<input type="hidden" id="duplicatedID" name="duplicatedID"
							value="Y"> <input type="hidden" id="duplicatedMail"
							name="duplicatedMail" value="Y">
					</div>
					<div class="ui stacked segment">
						<div class="field" id="divUserName">
							<div class="ui left icon input" id="inputUserName">
								<i class="user icon"></i> <input type="text" name="userName"
									id="userName" placeholder="ID">
							</div>
						</div>
						<div class="field">
							<div class="ui left icon input">
								<i class="user icon"></i> <input type="text" name="userMail"
									id="userMail" placeholder="Email">
							</div>
						</div>
						<div class="field">
							<div class="ui left icon input">
								<i class="lock icon"></i> <input type="password"
									id="userPassword" name="userPassword" placeholder="password">
							</div>
						</div>
						<div class="field">
							<div class="ui checkbox">
								<input name="acceptTerms" type="checkbox" id="acceptTerms">
								<label><a href="/agreement" target="_blank">약관</a>을 모두
									읽고 동의합니다.</label>
							</div>
						</div>
						<div class="field">
							<div class="ui fluid large teal submit button" id="insertButton">회원가입</div>
						</div>
					</div>

					<div class="ui error message" id="error"></div>
				</form>
			</div>
		</div>
	</div>
</div>
