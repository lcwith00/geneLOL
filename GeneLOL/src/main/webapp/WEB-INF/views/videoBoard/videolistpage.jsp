<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="true"%>
<html>
<head>
<title>videoList</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="../resources/semantic-ui/semantic.min.css">
<script src="../resources/semantic-ui/semantic.min.js"></script>

<script type="text/javascript">
	// Add contents for max height
	$(document)
			.ready(
					function() {
						$('#registLink').click(function() {
							$('.ui.modal.link').modal('show');
						});
						//==========동영상 상세보기 ============
						
							
						$(document)
								.scroll(
										function() {
											var maxHeight = $(document)
													.height();
											var currentScroll = $(window)
													.scrollTop()
													+ $(window).height();

											if (maxHeight <= currentScroll) {
												var last_no = $(
														".ui .card:last>#last_board_no")
														.val() - 1;
												alert(last_no);
												$
														.ajax({
															type : 'post', // 요청 method 방식 
															url : "/video/infiniteScrollDown",// 요청할 서버의 url
															headers : {
																"Content-Type" : "application/json",
																"X-HTTP-Method-Override" : "POST"
															},
															dataType : 'json', // 서버로부터 되돌려받는 데이터의 타입을 명시하는 것이다.
															data : JSON
																	.stringify({ // 서버로 보낼 데이터 명시 
																		"board_no" : last_no
																	}),
															success : function(
																	data) {// ajax 가 성공했을시에 수행될 function이다. 이 function의 파라미터는 서버로 부터 return받은 데이터이다.
																console
																		.log("data");
																var str = "";

																// 5. 받아온 데이터가 ""이거나 null이 아닌 경우에 DOM handling을 해준다.
																if (data != "") {
																	//6. 서버로부터 받아온 data가 list이므로 이 각각의 원소에 접근하려면 each문을 사용한다.
																	str += "<div class="+"'ui four column doubling stackable grid container'"+">";
																	str += "<div class="+"'row'"+">";
																	$(data)
																			.each(

																					// 7. 새로운 데이터를 갖고 html코드형태의 문자열을 만들어준다.
																					function() {
																						console
																								.log(this);

																						str += "<div class="+"'column'"+"id="+"'tab_column'"+">";
																						str += "<div class="+"'ui card'"+">";
																						str += "<input type="+"'hidden'"+ "id="+"'last_board_no'"+ "name="+"'board_no'"
									+"value="+this.board_no+">";
																						str += " <div class="+"'content'"+">";
																						str += "<div class="+"'right floated meta'"+">"
																								+ "조회수 :"
																								+ this.board_count
																								+ "</div>";
																						str += "<label id="+"'video_no'"+">"
																								+ "no."
																								+ this.board_no
																								+ "</label>"
																								+ "<br>";
																						str += "<label id="+"'video_title'"+">"
																								+ this.board_title
																								+ "</label>"
																						str += "<div class="+"'right floated meta'"+">"
																								+ this.board_date
																								+ "</div>"
																								+ "</div>";
																						str += "<div class="+"'image'"+"id="+"'btnImg'"+">";
																						str += "<a href="
																								+ "'http://localhost:8080/video/videoDetail?board_no='"
																								+ this.board_no
																								+ ">";
																						str += "<img src="+"'http://img.youtube.com/vi/'"+this.board_content+"'/1.jpg'"+">"
																								+ "</a>"
																								+ "</div>";
																						str += " <div class="+"'content'"+">";
																						str += "<span class="+"'right floated'"+">";
																						str += "<i class="+"'heart outline like icon'"+">"
																								+ "</i>";
																						str += "likes"
																								+ this.board_recomm
																								+ "</span>";
																						str += "<i class="+"'comment icon'"+">"
																								+ "</i>"
																								+ "comments"
																								+ "</div>";
																						str += "<div class="+"'extra content'"+">";
																						str += "<div class="+"'ui large transparent left icon input'"+">"
																								+ "작성자 :"
																								+ this.userid
																								+ "</div>"
																								+ "</div>"
																								+ "</div>"
																								+ "</div>";

																						console
																								.log(this);
																						+"</div>"
																								+ "</div>";
																					});// each
																	// 8. 이전까지 뿌려졌던 데이터를 비워주고, <th>헤더 바로 밑에 위에서 만든 str을  뿌려준다.

																	$(".row")
																			.append(
																					str);
																}// if : data!=null
																else { // 9. 만약 서버로 부터 받아온 데이터가 없으면 그냥 아무것도 하지말까..
																	alert("더 불러올 데이터가 없습니다.");
																}// else

															}// success
														});// ajax
												alert("test");
												console.log("하하");
											}
										});
					});
	function read(str) {
	      var board_no = str;
	      var url = "/videoboard/read/" + board_no;
	      $.getJSON(url, function(data) {
	         $(data).each(
	               function() {
	                  var board_no = this.board_no;
	                  var board_title = this.board_title;
	                  var username = this.username;
	                  var board_date = this.board_date;
	                  var board_content = this.board_content;
	                  var board_count = this.board_count ;
	                  var board_recomm = this.board_recomm;
	                
	                  $("#video_title_modal").html(board_title);
	                  $("#video_content").html(board_content);
	                  $("#video_writer").html("작성자 : " + username);
	                  $("#view_Cnt").html(
	                        "<i class='unhide icon'></i>" + board_count);
	                  $("#like").html("Like " + board_recomm);
	               });
	      });
	      $('#videoRead').modal('show');
	   }
</script>
<style type="text/css">
body, html {
	margin: 0;
	padding: 0;
	width: 100%;
	min-width: 600px;
	font-size: 16px;
}

header, footer {
	width: 100%;
	min-height: 50px;
}

div #bg {
	width: 90%;
	min-height: 700px;
	background-color: gray;
	margin: 50px;
}

div #popularVideo {
	width: 55%;
	min-height: 200px;
	background-color: black;
	margin: 40px;
	float: left;
}

div #popularRank {
	width: 30%;
	min-height: 200px;
	background-color: black;
	margin: 40px;
	position: relative;
	float: left;
}

div #for_search_Div {
	width: 90%;
	height: 48px;
	background-color: white;
	position: relative;
	float: left;
	margin: auto;
}

#submit_search {
	position: absolute;
	top: 5%;
	right: 1px;
	margin-right: 0px;
	height: 90%;
	padding-right: 1em;
}

#search {
	float: right;
}

div #tap_container {
	width: 90%;
	min-height: 500px;
	margin: auto;
}

div #tab_column {
	margin: auto;
}

#register_modal {
	width: 60%;
	margin: auto;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../common/header.jsp"%>
	</header>
	<!-- 배경 div -->
	<div id="bg">
		<div id="popularVideo"></div>
		<div id="popularRank"></div>

		<div id="for_search_Div">
			<div class=" ui icon input" id="search">
				<button class="positive ui button" id="registLink">링크 등록</button>
				<div class="ui modal link" id="register_link">
					<%@ include file="../videoBoard/register.jsp"%>
				</div>

				<form id="search_form" method="get">
					<input class="prompt" type="text" placeholder="검색"
						name="board_title">

					<button class="ui inverted basic button" type="submit"
						id="submit_search">
						<i class="black search icon"></i>
					</button>
				</form>
			</div>
		</div>

		<div class="ui top attached tabular menu" id="manu_tap">
			<a class="item active" data-tab="ALL">ALL</a> <a class="item"
				data-tab="LOL">LOL</a> <a class="item" data-tab="FUN">FUN</a><a
				class="item " data-tab="ETC">Etc</a>
		</div>
		<div class="ui tap" data-tab="ALL" id="tap_container">
			<p></p>
			<p></p>
			<!-- ======================Detail=============================== -->

			<form method="get" action="/video/videoDetail" id="sendDetail"
				name="nsendDetail">

				<div class="row">
					<div class="ui four column doubling stackable grid container">
						<c:forEach items="${videoList}" var="UserVideoBoardVO">

							<div class="column" id="tab_column">
								<div class="ui card">

									<!--board_no  -->
									<input type="hidden" id="last_board_no" name="board_no"
										value="${UserVideoBoardVO.board_no}">
									<div class="content">
										<!--board_count  -->
										<div class="right floated meta">조회수 :
											${UserVideoBoardVO.board_count}</div>
										<!--board_no  -->
										<label id="video_no"
											data-board_no="${UserVideoBoardVO.board_no }">no.${UserVideoBoardVO.board_no }</label>
										<br> <label id="video_title">
											${UserVideoBoardVO.board_title } </label>

										<div class="right floated meta">

											<!-- 날짜가져오기 -->
											<fmt:formatDate pattern="yyyy-MM-dd"
												value="${UserVideoBoardVO.board_date}" />

										</div>
									</div>
									<div class="image" id="btnimg"
										onclick="read(${UserVideoBoardVO.board_no})">

										<img
											src="http://img.youtube.com/vi/${UserVideoBoardVO.board_content}/1.jpg">
									</div>
									<div class="content">
										<span class="right floated"> <i
											class="heart outline like icon"></i> <!-- 좋아요수 -->likes
											${UserVideoBoardVO.board_recomm}
										</span> <i class="comment icon"></i>
										<!-- 댓글수 -->
										comments
									</div>
									<div class="extra content">
										<div class="ui large transparent left icon input">작성자 :
											${UserVideoBoardVO.userid}</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="ui modal Detail" id="videoRead">
						<%@ include file="../videoBoard/videodetail.jsp"%>
					</div>


				</div>
			</form>
		</div>





		<!-- ===================================================== -->



	</div>

	<form id="tab_type" method="get">
		<div class="ui bottom attached tab segment" data-tab="LOL"
			id="btn_tab_LoL">
			<input type="hidden" name="board_id" value="test" id="type_Tap">
			Third
		</div>
	</form>
	<div class="ui bottom attached tab segment " data-tab="FUN"
		id="btn_tab_Fun"></div>
	<div class="ui bottom attached tab segment " data-tab="ETC"
		id="btn_tab_Etc"></div>



</body>


</html>
