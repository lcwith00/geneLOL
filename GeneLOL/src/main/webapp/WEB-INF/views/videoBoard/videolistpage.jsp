<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js">
	
</script>
<link rel="stylesheet" type="text/css"
	href="../resources/semantic-ui/semantic.min.css">
<script src="../resources/semantic-ui/semantic.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('.ui.modal').modal('show');
	});
</script>

<title>Insert title here</title>
</head>
<body>
	<!-- 배경 div -->
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
				<c:forEach items="${videoList}" var="userVideoBoardVO">

					<div class="column" style="background-color: yellow; margin: 10px;">
						<div class="ui card">
							<div class="content">
								<div class="right floated meta">조회수 :
									${userVideoBoardVO.board_count}</div>
								<label>no.${userVideoBoardVO.board_no }</label> <br> <label>
									${userVideoBoardVO.board_title } </label>



								<div class="right floated meta">

									<!-- 날짜가져오기 -->
									<fmt:formatDate pattern="yyyy-MM-dd"
										value="${userVideoBoardVO.board_date}" />

								</div>

							</div>
							<div class="image">
								<a href="${userVideoBoardVO.board_content }"
									class="ui medium image"> <img
									src="http://img.youtube.com/vi/rZNKq1blq9c/1.jpg">
								</a>
								<div class="ui modal">
									<i class="close icon"></i>
									<div class="header">Profile Picture</div>
									<div class="image content">
										<div class="ui medium image">
											<img src="/images/avatar/large/chris.jpg">
										</div>
										<div class="description">
											<div class="ui header">We've auto-chosen a profile
												image for you.</div>
											<p>
												We've grabbed the following image from the <a
													href="https://www.gravatar.com" target="_blank">gravatar</a>
												image associated with your registered e-mail address.
											</p>
											<p>Is it okay to use this photo?</p>
										</div>
									</div>
									<div class="actions">
										<div class="ui black deny button">Nope</div>
										<div class="ui positive right labeled icon button">
											Yep, that's me <i class="checkmark icon"></i>
										</div>
									</div>
								</div>
							</div>
							<div class="content">
								<span class="right floated"> <i
									class="heart outline like icon"></i> <!-- 좋아요수 -->likes${userVideoBoardVO.board_recomm}
								</span> <i class="comment icon"></i>
								<!-- 댓글수 -->
								comments

							</div>
							<div class="extra content">
								<div class="ui large transparent left icon input">작성자 :
									${userVideoBoardVO.userid}</div>
							</div>
						</div>
					</div>

				</c:forEach>
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
</body>
</html>