<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="contentContainer">
		<div class="contentTit"><h3>게시판 글작성</h3></div>
		<div class="contentTB">
			<form id="f_writeForm" name="f_writeForm" enctype="multipart/form-data">
				<input type="hidden" name="csrf" value="${CSRF_TOKEN}" />
				<table id="boardWrite">
					<colgroup>
						<col width="17%" />
						<col width="83%" />
					</colgroup>
					<tr>
						<td class="ac">작성자</td>
						<td><input type="text" name="b_name" id="b_name"></td>
					</tr>
					<tr>
						<td class="ac">글제목</td>
						<td><input type="text" name="b_title" id="b_title"></td>
					</tr>
					<tr>
						<td class="ac vm">내용</td>
						<td><textarea name="b_content" id="b_content"></textarea></td>
					</tr>
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