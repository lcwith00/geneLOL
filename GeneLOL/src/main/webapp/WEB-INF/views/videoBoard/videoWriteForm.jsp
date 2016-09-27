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

<title>videoWrite</title>
</head>
<body>
	<table width="640" align="center" cellspacing="0" cellpadding="3">
		<tr>
			<td colspan="3" bgcolor="gray" height="25" align="center"
				class="background">동영상 올리기</td>
		</tr>
		<tr>
			<td align="center">
				<table border="0" width="100%" align="center">
					<tr>
						<td width="100%" align="right" colspan="3" class="redcolor">
							[불법 사용을 금지합니다.]</td>
					</tr>
					<tr>
						<td><label>분류</label></td>
						<td><input type="button" id="ALL" value="전체"> <input
							type="button" id="LoL" value="LOL"> <input type="button"
							id="FUN" value="유머"> <input type="button" id="Etc"
							value="기타"></td>
					</tr>
					<tr>
						<td><label>링크</label></td>
						<td><input type="text" size="50" id="videoLink"></td>
					</tr>
					<tr>
						<td><label>제목</label></td>
						<td><input type="text" size="50" id="videoTitle"></td>
					</tr>
					<tr>
						<td><label>사용자 암호</label></td>
						<td><input type="password" size="15" id="UserPasswd"></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="button"
							value="등록"> <input type="button" value="취소"></td>
				</table>
	</table>
</body>
</html>