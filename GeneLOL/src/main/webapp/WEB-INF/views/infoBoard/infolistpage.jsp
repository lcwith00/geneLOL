<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>infoList</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="/resources/semantic-ui/semantic.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/semantic-ui/semantic.min.css">
<script type="text/javascript">
$(document)
			.ready(
					function() {
						$("#popularinfo").click(function(){
							popInfo();
						});
						
						$("#title_modify").hide();
						$("#text_area_modify").hide();
						$("#file_Modify").hide();
						$("#btn_submit").hide();
						$('#registInfo').click(function() {
							$('#register_info').modal('show');
						});
						$('#listAll').click(function(){
							location.href = "http://localhost:8080/info/infoList"
						});
						$('#btn_Modify').click(function(){
							modify_val();
							$("#title_modify").show();
							$("#text_area_modify").show();
							$("#title").hide();
							$("#board_content_modal").hide();
							$("#reply_form").hide();
							$("#btn_Modify").hide();
							$("#likeBtn").hide();
							$("#view_Cnt").hide();
							$("#file_Modify").show();
							$("#btn_submit").show();
						});
					
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
													url : "/info/infiniteScrollDown",// 요청할 서버의 url
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
																				str += "<div class="+"'image'"+"id="+"'btnImg'"+"onclick="+"read("+this.board_no+")"+">";
																				str += "<img src="+"'http://img.youtube.com/vi/'"+this.board_content+"'/1.jpg'"+">"
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
                 $("#board_no").html(board_no);
                  $("#title").html(board_title);
                  $("#board_content_modal").html(board_content);
                  $("#writer").html("작성자 : " + username);
                  $("#view_Cnt").html(
                        "<i class='unhide icon'></i>" + board_count);
                  $("#likeConut").html(board_recomm);
             	$("#date").html(board_date);
               });
      });
      $('#infoRead').modal('show');
   }
function modify_val(){
	var board_no_view =  $("#board_no").html();
	$('input[name=board_no_view]').attr('value',board_no_view);
	var board_content_modal =  $("#board_content_modal").html();
	$('textarea[id=board_content_modify]').attr('value',board_content_modal);
}
function popInfo() {
     var url = "/info/infoPopularBoardList" ;
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
                $("#pop_no").html(board_no);
                 $("#pop_title").html(board_title);
                 $("#writer").html("작성자 : " + username);
                 $("#view_Cnt").html(board_count);
                 $("#likeConut").html(board_recomm);
            	$("#date").html(board_date);
              });
     });
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

div #popularinfo {
	width: 55%;
	min-height: 200px;
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
</style>
</head>
<body>
	<header>
		<%@ include file="../common/header.jsp"%>
	</header>
	<!-- 배경 div -->
	<div id="bg">
		<div id="popularinfo">
			<label id="pop_no"></label>

		</div>
		<div id="popularRank"></div>

		<div id="for_search_Div">
			<div class=" ui icon input" id="search">
				<button class="ui white button" id="listAll">전체목록</button>
				<%-- <button class="positive ui button" id="registInfo">글 등록</button>
				<div class="ui modal info" id="register_info">
					<%@ include file="../infoBoard/inforegister.jsp"%>
				</div>
 --%>
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


		<!-- ======================Detail=============================== -->
		<div class="row">
			<div class="ui four column doubling stackable grid container">
				<c:forEach items="${infoList}" var="UserinfoBoardVO">
					<div class="column">
						<div class="ui card">
							<!--board_no  -->
							<input type="hidden" id="last_board_no" name="info_no"
								value="${UserinfoBoardVO.board_no}">
							<div class="content">
								<!--board_count  -->
								<div class="right floated meta">조회수 :
									${UserinfoBoardVO.board_count}</div>
								<!--board_no  -->
								<label id="info_no" data-board_no="${UserinfoBoardVO.board_no }">no.${UserinfoBoardVO.board_no }</label>
								<br> <label id="info_title">
									${UserinfoBoardVO.board_title } </label>

								<div class="right floated meta">

									<!-- 날짜가져오기 -->
									<fmt:formatDate pattern="yyyy-MM-dd"
										value="${UserinfoBoardVO.board_date}" />
								</div>
							</div>

							<div class="image" id="btnimg"
								onclick="read(${UserinfoBoardVO.board_no})">
								<input type="hidden" id="board_no_view"> <img
									id="view_up"
									src="http://img.youtube.com/vi/${UserinfoBoardVO.board_content}/1.jpg">
							</div>
							<div class="content">
								<span class="right floated"> <i
									class="heart outline like icon"></i> <!-- 좋아요수 -->likes
									${UserinfoBoardVO.board_recomm}
								</span> <i class="comment icon"></i>
								<!-- 댓글수 -->
								comments
							</div>
							<div class="extra content">
								<div class="ui large transparent left icon input">작성자 :
									${UserinfoBoardVO.userid}</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="ui modal Detail" id="infoRead">
				<%@ include file="../infoBoard/infodetail.jsp"%>
			</div>


		</div>
	</div>
	<!-- ===================================================== -->
	<footer>
		<%@ include file="../common/footer.jsp"%>
	</footer>
</body>


</html>
