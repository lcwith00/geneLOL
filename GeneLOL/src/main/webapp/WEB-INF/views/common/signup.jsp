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
#modal_body {
	background-color: #DADADA;
}

#modal_body>.grid {
	height: 100%;
}

#modal_column {
	max-width: 450px;
}
</style>
<script>
	$(document).ready(function() {
		$('.menu .item').tab();
		$('.ui.form').form({
			fields : {
				userName : {
					identifier : 'userName',
					rules : [ {
						type : 'empty',
						prompt : 'ID를 입력해주세요.'
					}, {
						type : 'regExp[/^[a-z]{1}[a-z0-9]{3,15}$/]',
						prompt : 'ID는 알파벳 소문자로 시작하는 4-16자의 알파벳 소문자/숫자로 입력해주세요.'
					} ]
				},
				userMail : {
					identifier : 'userMail',
					rules : [ {
						type : 'empty',
						prompt : '이메일 주소를 입력해주세요.'
					}, {
						type : 'email',
						prompt : '유효하지 않은 이메일입니다.'
					} ]
				},
				userPassword : {
					identifier : 'userPassword',
					rules : [ {
						type : 'empty',
						prompt : '비밀번호를 입력해주세요.'
					}, {
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
		var idText = $("#userName").val();
		var id = document.getElementById('userName');
		var mailRegExp = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		var mailText = $("#userMail").val();
		var mail = document.getElementById('userMail');
		var password = document.getElementById('userPassword');

		if (id.value == "" || id.value == null) {
			alert("1")
			return false;
		}

		if (!idRegExp.test($("input[name='userName']").val())) {
			alert("2")
			return false;
		}

		if (mail.value == "" || mail.value == null) {
			alert("3")
			return false;
		}

		/* if (mail == '' || !mailRegExp.test($("input[name='userMail']").val())) {
			alert("4")
			return false;
		} */

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
			var insert = document.getElementById('insertUserForm');
			insert.submit();
		}
	}
</script>
</head>
<body id="modal_body">
	<div class="ui top attached tabular menu" style="max-width: 450px">
		<a class="item active" data-tab="signin">로그인</a> <a class="item"
			data-tab="signup">회원가입</a>
	</div>
	<div class="ui bottom attached tab segment active" data-tab="signin">
		<div class="ui middle aligned center aligned grid">
			<div class="column" id="modal_column">
				<form class="ui large form" method="post">
					<div class="ui stacked segment">
						<div class="field">
							<div class="ui left icon input">
								<i class="user icon"></i> <input type="text" name="userMail"
									placeholder="Email">

							</div>
							<div class="field">
								<div class="ui left icon input">
									<i class="lock icon"></i> <input type="password"
										name="userPassword" placeholder="password">
								</div>
							</div>
							<div class="ui fluid large teal submit button">로그인</div>
						</div>
						<p>
							<a href="#">비밀번호를 잊으셨나요?</a>
						</p>
						<div class="ui error message"></div>
				</form>
			</div>
		</div>
	</div>
	</div>
	<div class="ui bottom attached tab segment" data-tab="reset-password">
		<div class="ui middle aligned center aligned grid">
			<div class="column">
				<form class="ui large form" id="reset-password" method="post">
					<div class="ui stacked segment">
						<div class="field">비밀번호 초기화</div>
						<div class="field">
							<div class="ui left icon input">
								<i class="user icon"></i> <input type="text" name="userMail"
									placeholder="Email">
							</div>
						</div>
						<div class="ui fluid large teal button" id="send-mail">메일발송</div>
						<div class="ui fluid large teal button" id="back">돌아가기</div>
					</div>

					<div class="ui error message"></div>

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
								<label><a href="#0">약관</a>을 모두 읽고 동의합니다.</label>
							</div>
							<div class="ui fluid large teal submit button" id="insert">회원가입</div>
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
</body>
</html>