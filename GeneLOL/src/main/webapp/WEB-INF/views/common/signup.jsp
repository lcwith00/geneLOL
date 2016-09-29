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
						type : 'regExp[/^[a-z0-9_-]{4,16}$/]',
						prompt : 'ID는 4-16자의 알파벳 소문자/숫자로 입력해주세요.'
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

	});

	$("#insert").click(function() {
		var str = document.getElementById('insertUserForm');
		str.submit();
	});

	function chkMbId() {
		$.ajax({
			url : "/idcheck.do",
			type : "post",
			data : {
				userName : $("#userName").val()
			},
			dataType : "json",
			success : function(data) {

				$(
						"<div style='text-align:center;'>" + data.resultMsg
								+ "</div>").dialog({
					modal : true,
					resizable : false,
					buttons : [ {
						text : "확인",
						click : function() {
							$(this).dialog("close");
						}
					} ]
				});
				$(".ui-dialog-titlebar").hide();

				if (data.result == "success") {

				} else {

				}
			}
		});
	}
</script>
</head>
<body id="modal_body">
	<div class="ui top attached tabular menu" style="max-width: 450px">
		<a class="item active" data-tab="signin"> 로그인 </a> <a class="item"
			data-tab="signup"> 회원가입 </a>
	</div>
	<div class="ui bottom attached tab segment active" data-tab="signin">
		<div class="ui middle aligned center aligned grid">
			<div class="column" id="modal_column">
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
					<p>
						<a href="#">비밀번호를 잊으셨나요?</a>
					</p>
					<div class="ui error message"></div>

				</form>
			</div>
		</div>
	</div>
	<div class="ui bottom attached tab segment" data-tab="signup">
		<div class="ui middle aligned center aligned grid">
			<div class="column">

				<form class="ui large form" id="insertUserForm" method="post">
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
						<div class="field">
							<div class="ui checkbox">
								<input name="acceptTerms" type="checkbox"> <label><a
									href="#0">약관</a>을 모두 읽고 동의합니다.</label>
							</div>
						</div>
						<div class="ui fluid large teal submit button" id="insert">회원가입</div>
					</div>

					<div class="ui error message"></div>

				</form>
			</div>
		</div>
	</div>
</body>
</html>