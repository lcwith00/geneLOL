<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript"
	src="resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script>
	$(function() {
		var obj = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : obj,
			elPlaceHolder : "editor",
			sSkinURI : "/resources/smarteditor/SmartEditor2Skin.html",
			htParams : {
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true
			}
		});
	})
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
	<form>
		<div class="ui grid">
			<div class="two wide column item">작성자</div>
			<div class="three wide column">
				<div class="ui form">
					<div class=field>
						<input type="text" readonly="" value="${login.userName}">
					</div>
				</div>
			</div>
		</div>
		<div class="ui grid">
			<div class="two wide column item">제목</div>
			<div class="eight wide column">
				<div class="ui form">
					<div class=field>
						<input type="text">
					</div>
				</div>
			</div>
		</div>
		<div class="ui form" style="padding: 20px 20px 20px 20px;">
			<div class=field>
				<textarea name="editor" id="editor" rows="10" cols="50"></textarea>
			</div>
		</div>

		<div class="field">
			<div class="ui fluid large teal submit button" id="insertButton">저장</div>
		</div>
	</form>
	<div class="contentContainer">
		<div class="contentTit">
			<h3>게시판 글작성</h3>
		</div>
		<div class="contentTB">
			<form id="f_writeForm" name="f_writeForm"
				enctype="multipart/form-data">
				<table id="boardWrite">
					<colgroup>
						<col width="17%" />
						<col width="83%" />
					</colgroup>

					<tr>
						<td class="ac">첨부파일</td>
						<td><input type="file" name="file" id="file"></td>
					</tr>
					<tr>
						<td class="ac">비밀번호</td>
						<td><input type="password" name="b_pwd" id="b_pwd"></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="contentBtn">
			<input type="button" value="저장" class="but" id="boardInsertBtn">
			<input type="button" value="목록" class="but" id="boardListBtn">
		</div>
	</div>
</div>

