<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="resources/semantic-ui/semantic.min.css">
<script src="resources/semantic-ui/semantic.min.js"></script>
<script src="resources/jquery.paging.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#memberListSearchButton').click(function() {
			var searchType = $('#memberListSearchBox option:selected').val();
			if (searchType == "all") {
				$('#memberListPageNavi').html("");
				$("#memberManagementList").html("");
				var searchtext = $("#memberListSearchInput").val();
				listSearch(searchType, page, searchtext);
				searchPage(searchType, searchtext);
			} else if (searchType == "id") {
				$('#memberListPageNavi').html("");
				$("#memberManagementList").html("");
				var searchtext = $("#memberListSearchInput").val();
				listSearch(searchType, page, searchtext);
				searchPage(searchType, searchtext);
			} else if (searchType == "email") {
				$('#memberListPageNavi').html("");
				$("#memberManagementList").html("");
				var searchtext = $("#memberListSearchInput").val();
				listSearch(searchType, page, searchtext);
				searchPage(searchType, searchtext);
			}
		});

		//탈퇴처리
		$('#selectMemberDelete').click(function() {
			if ($('.chkclass :checked').size() < 1) {
				alert("탈퇴처리할 회원을 선택하세요.");
				return false;
			} else {
				var checkArr = [];
				$('.chkclass :checked').each(function() {
					checkArr.push($(this).val());
				});
				$.ajax({
					async : false,
					method : "POST",
					url : "/membermanagement/secessionprocess",
					data : {
						'userID' : checkArr
					},
				});
			}

			$('#memberListPageNavi').html("");
			$("#memberManagementList").html("");
			listAll();
			page();
			$('#allCheck').prop("checked", false);
		});

		listAll();
		page();
	});

	function allChk(obj) {
		var chkObj = document.getElementsByName("rowCheck");
		var rowCnt = chkObj.length - 1;
		var check = obj.checked;
		if (check) {
			for (var i = 0; i <= rowCnt; i++) {
				if (chkObj[i].type == "checkbox")
					chkObj[i].checked = true;
			}
		} else {
			for (var i = 0; i <= rowCnt; i++) {
				if (chkObj[i].type == "checkbox") {
					chkObj[i].checked = false;
				}
			}
		}
	}

	function page() {
		$('#memberListPageNavi').html("");
		var url = "/membermanagement/totalcount";
		$.getJSON(url, function(data) {
			$(data).each(function() {
				var memberCount = this.totalCount;
				var resultCount = memberCount / 10
				resultCount = Math.ceil(resultCount);
				$('#memberListPageNavi').paging({
					current : 1,
					max : resultCount,
					onclick : function(e, page) {
						listAll(page);
					}
				});
			});
		});
	}

	function listAll(str) {
		$("#memberManagementList").html("");
		var page = 1;
		if (str > 1) {
			page = str;
		}
		var start_no = (page - 1) * 10;
		var url = "/membermanagement/memberlist/" + start_no;
		$.getJSON(url, function(data) {
			console.log(data.length);
			$(data).each(function() {
				var userID = this.userID;
				var userName = this.userName;
				var userMail = this.userMail;
				if (this.certificate == false) {
					var certificate = "X";
				} else if (this.certificate == true) {
					var certificate = "O";
				}
				var joinDate = this.joinDate;
				addNewItem(userID, userName, userMail, joinDate, certificate);
			});
		});
	}

	function addNewItem(userID, userName, userMail, joinDate, certificate) {

		var new_div = $("<div class='ui five column grid'>");

		var checked_div = $("<div class='one wide column chkclass'>");
		checked_div
				.html("<input type='checkbox' name='rowCheck' value='" + userID + "'>");

		var userID_div = $("<div class='two wide column'>");
		userID_div.html(userID);

		var userName_div = $("<div class='three wide column' id='userName'>");
		userName_div.html(userName);

		var userMail_div = $("<div class='five wide column' id='userMail'>");
		userMail_div.html(userMail);

		var joinDate_div = $("<div class='three wide column'>");
		joinDate_div.html(joinDate);

		var certificate_div = $("<div class='two wide column'>");
		certificate_div.html(certificate)

		new_div.append(checked_div).append(userID_div).append(userName_div)
				.append(userMail_div).append(joinDate_div).append(
						certificate_div);

		$("#memberManagementList").append(new_div);
	}

	function searchPage(str1, str2) {
		var searchType = str1;
		var searchtext = str2;
		var url = "/membermanagement/searchcount/" + searchType + "/"
				+ searchtext;
		$.getJSON(url, function(data) {
			$(data).each(function() {
				var searchCount = this.searchCount;
				var resultCount = searchCount / 10
				resultCount = Math.ceil(resultCount);
				$('#memberListPageNavi').paging({
					current : 1,
					max : resultCount,
					onclick : function(e, page) {
						listSearch(searchType, page, searchtext);
					}
				});
			});
		});
	}

	function listSearch(str1, str2, str3) {
		var searchtype = str1;
		var page = 1;
		var searchtext = str3
		if (str2 > 1) {
			page = str2;
		}
		var start_no = (page - 1) * 10;
		var url = "/membermanagement/memberlist/" + searchtype + "/"
				+ searchtext + "/" + start_no;
		$.getJSON(url, function(data) {
			console.log(data.length);
			$(data).each(
					function() {
						var userID = this.userID;
						var userName = this.userName;
						var userMail = this.userMail;
						if (this.certificate == false) {
							var certificate = "X";
						} else if (this.certificate == true) {
							var certificate = "O";
						}
						var joinDate = this.joinDate;
						addSearchItem(userID, userName, userMail, joinDate,
								certificate);
					});
		});
	}

	function addSearchItem(userID, userName, userMail, joinDate, certificate) {

		var new_div = $("<div class='ui five column grid'>");

		var checked_div = $("<div class='one wide column chkclass'>");
		checked_div
				.html("<input type='checkbox' name='rowCheck' value='" + userID + "'>");

		var userID_div = $("<div class='two wide column'>");
		userID_div.html(userID);

		var userName_div = $("<div class='three wide column' id='userName'>");
		userName_div.html(userName);

		var userMail_div = $("<div class='five wide column' id='userMail'>");
		userMail_div.html(userMail);

		var joinDate_div = $("<div class='three wide column'>");
		joinDate_div.html(joinDate);

		var certificate_div = $("<div class='two wide column'>");
		certificate_div.html(certificate)

		new_div.append(checked_div).append(userID_div).append(userName_div)
				.append(userMail_div).append(joinDate_div).append(
						certificate_div);

		$("#memberManagementList").append(new_div);
	}
</script>
<style type="text/css">
#first {
	text-align: center;
}

#selectMemberDelete {
	float: left;
}

#memberListSearch {
	float: right;
}

#username, #usermail {
	text-align: left;
}
</style>
<!-- list -->
<div id="memberList">
	<div class="ui top attached tabular menu">
		<a class="item active" data-tab="first">회원 목록</a>
	</div>

	<div class="ui bottom attached tab segment active" data-tab="first"
		id="first">
		<div id="memberListMenu">
			<div class="ui button" id="selectMemberDelete">탈퇴처리</div>
			<div class="ui action input" id="memberListSearch">
				<select class="ui compact selection dropdown"
					id="memberListSearchBox">
					<option value="all" selected="">전체</option>
					<option value="id">아이디</option>
					<option value="email">이메일</option>
				</select> <input type="text" placeholder="Search..."
					id="memberListSearchInput">
				<div class="ui button" id="memberListSearchButton">Search</div>
			</div>
		</div>
		<br /> <br /> <br />
		<div class="ui five column grid">
			<div class="one wide column">
				<input type="checkbox" onclick="allChk(this)" id="allCheck"><label></label>
			</div>
			<div class="two wide column">번호</div>
			<div class="three wide column">아이디</div>
			<div class="five wide column">이메일</div>
			<div class="three wide column">가입일</div>
			<div class="two wide column">인증</div>
		</div>
		<div id="memberManagementList"></div>
		<br>
		<div id="memberListPageNavi"></div>
	</div>
</div>