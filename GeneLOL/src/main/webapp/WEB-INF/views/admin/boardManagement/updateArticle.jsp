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

<div id="updateInfo">
	<br />
	<div style="text-align: center">
		<h3>글쓰기</h3>
	</div>
	<br /> <br />
	<form id="updateFrm" name="updateFrm" method="post">
		<div class="ui grid">
			<div class="two wide column item">작성자</div>
			<div class="three wide column">
				<div class="ui form">
					<div class=field>
						<input type="text" readonly="" id="info_writer" name="info_writer">
					</div>
				</div>
			</div>
		</div>
		<div class="ui grid">
			<div class="two wide column item">제목</div>
			<div class="eight wide column">
				<div class="ui form">
					<div id="update_board_title">
						<input type="text" id="info_title" name="info_title">
					</div>
				</div>
			</div>
		</div>
		<div class="ui form" style="padding: 20px 20px 20px 20px;">
			<div class=field>
				<textarea name="updateEditor" id="updateEditor" rows="20" cols="50"></textarea>
			</div>
		</div>

		<div class="field">
			<div class="ui fluid large teal button" id="updateArticleButton">수정</div>
		</div>
	</form>
	<iframe name="updateIfrm" width="0" height="0" frameborder="0"></iframe>
</div>