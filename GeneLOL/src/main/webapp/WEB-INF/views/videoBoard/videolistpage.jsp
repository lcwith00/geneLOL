<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="../resources/semantic-ui/semantic.min.css">
<script src="../resources/semantic-ui/semantic.min.js"></script>
<script type="text/javascript">
	<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js">
</script>

<title>Insert title here</title>
</head>
<body>
	<div style="width: 100%; min-height: 700px; background-color: gray;">
		<div id="popularVideo"
			style="width: 55%; min-height: 200px; background-color: black; margin: 40px; float: left;">
		</div>
		<div id="popularRank"
			style="width: 30%; min-height: 200px; background-color: black; margin: 40px; position: relative; float: left;"></div>

		<div class="ui top attached tabular menu">
			<a class="item active" data-tab="ALL">ALL</a> <a class="item"
				data-tab="LOL">LOL</a> <a class="item" data-tab="FUN">FUN</a><a
				class="item " data-tab="ETC">Etc</a>
		</div>
		<div class="ui tap" data-tab="ALL">
			<p></p>
			<p></p>
			<!-- ===================================================== -->

			<div class="ui four column doubling stackable grid container">
				<div class="column" style="background-color: yellow; margin: 10px;">
					<div class="ui card">
						<div class="content">
							<label>글번호</label> <label><c:forEach
									items="${videoList }" var="userVideoBoardVO">${userVideoBoardVO.board_title }</c:forEach></label>
							<div class="right floated meta">
								2014
								<!-- 날짜가져오기 -->
								<fmt:formatDate pattern="yyyy-MM-dd HH:mm"
									value="${userVideoBoardVO.board_date}" />

							</div>

						</div>
						<div class="image">
							<img src="../resources/signup/img/imgtest1.jpg">
						</div>
						<div class="content">
							<span class="right floated"> <i
								class="heart outline like icon"></i> <!-- 좋아요수 -->likes
							</span> <i class="comment icon"></i>
							<!-- 댓글수 -->
							comments
						</div>
						<div class="extra content">
							<div class="ui large transparent left icon input">userid</div>
						</div>
					</div>
				</div>
			</div>
			<div class="column" style="background-color: yellow; margin: 10px;">
				<p></p>
				<p></p>
			</div>
			<div class="column" style="background-color: yellow; margin: 10px;">
				<p></p>
				<p></p>
			</div>
		</div>
		<!-- ===================================================== -->


	</div>
	<div class="ui bottom attached tab segment" data-tab="LOL">
		Second</div>
	<div class="ui bottom attached tab segment " data-tab="FUN">
		Third</div>
	<div class="ui bottom attached tab segment " data-tab="ETC">
		Third</div>
	</div>
	</div>
</body>
</html>