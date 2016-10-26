<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script>
</script>
<style>
.item {
	text-align: center;
}

#insertInfo {
	padding: 15px 15px 15px 15px;
}

</style>

<div id="insertInfo">
	<br />
	<div style="text-align: center">
		<h3>글쓰기</h3>
	</div>
	<br /> <br />
	<form id="frm" name="frm" method="post">
		<div class="ui grid">
			<div class="two wide column item">작성자</div>
			<div class="three wide column">
				<div class="ui form">
					<div class=field>
						<input type="text" readonly="" id="writer" name="writer"
							value="${login.userName}">
					</div>
				</div>
			</div>
		</div>
		<div class="ui grid">
			<div class="two wide column item">제목</div>
			<div class="eight wide column">
				<div class="ui form">
					<div class=field>
						<input type="text" id="subject" name="subject">
					</div>
				</div>
			</div>
		</div>
		<div class="ui form" style="padding: 20px 20px 20px 20px;">
			<div class=field>
				<textarea name="editor" id="editor" rows="20" cols="50"></textarea>
			</div>
		</div>

		<div class="field">
			<div class="ui fluid large teal button" id="insertArticleButton">저장</div>
		</div>
	</form>
	<iframe name="ifrm" width="0" height="0" frameborder="0"></iframe>
</div>