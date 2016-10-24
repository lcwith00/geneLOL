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
		//탈퇴처리
		$('#selectOperatorDelete').click(function() {
			if ($('.chkclass :checked').size() < 1) {
				alert("삭제할 운영자 계정을 선택하세요.");
				return false;
			} else {
				var checkArr = [];
				$('.chkclass :checked').each(function() {
					checkArr.push($(this).val());
				});
				$.ajax({
					async : false,
					method : "POST",
					url : "/operatormanagement/secessionprocess",
					data : {
						'operatorID' : checkArr
					},
				});
			}

			$('#operatorListPageNavi').html("");
			$("#operatorManagementList").html("");
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
		$('#operatorListPageNavi').html("");
		var url = "/operatormanagement/totalcount";
		$.getJSON(url, function(data) {
			$(data).each(function() {
				var operatorCount = this.totalCount;
				var resultCount = operatorCount / 10
				resultCount = Math.ceil(resultCount);
				$('#operatorListPageNavi').paging({
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
		$("#operatorManagementList").html("");
		var page = 1;
		if (str > 1) {
			page = str;
		}
		var start_no = (page - 1) * 10;
		var url = "/operatormanagement/operatorlist/" + start_no;
		$.getJSON(url, function(data) {
			console.log(data.length);
			$(data).each(function() {
				var operatorID = this.userID;
				var operatorName = this.userName;
				var operatorMail = this.userMail;
				var joinDate = this.joinDate;
				addNewItem(operatorID, operatorName, operatorMail, joinDate);
			});
		});
	}

	function addNewItem(operatorID, operatorName, operatorMail, joinDate) {

		var new_div = $("<div class='ui five column grid'>");

		var checked_div = $("<div class='one wide column chkclass'>");
		checked_div
				.html("<input type='checkbox' name='rowCheck' value='" + operatorID + "'>");

		var operatorID_div = $("<div class='two wide column'>");
		operatorID_div.html(operatorID);

		var operatorName_div = $("<div class='three wide column' id='operatorname'>");
		operatorName_div.html(operatorName);

		var operatorMail_div = $("<div class='five wide column' id='operatormail'>");
		operatorMail_div.html(operatorMail);

		var joinDate_div = $("<div class='three wide column'>");
		joinDate_div.html(joinDate);

		new_div.append(checked_div).append(operatorID_div).append(operatorName_div)
				.append(operatorMail_div).append(joinDate_div);
		$("#operatorManagementList").append(new_div);
	}
</script>
<style type="text/css">
#first {
	text-align: center;
}

#selectOperatorDelete {
	float: left;
}

#operatorInsert {
	float: right;
}

#operatorname, #operatormail {
	text-align: left;
}
</style>
<!-- list -->
<div id="operatorList">
	<div class="ui top attached tabular menu">
		<a class="item active" data-tab="first">운영자 목록</a>
	</div>

	<div class="ui bottom attached tab segment active" data-tab="first"
		id="first">
		<div class="ui five column grid">
			<div class="one wide column">
				<input type="checkbox" onclick="allChk(this)" id="allCheck"><label></label>
			</div>
			<div class="two wide column">번호</div>
			<div class="three wide column">아이디</div>
			<div class="five wide column">이메일</div>
			<div class="three wide column">생성일</div>
		</div>
		<div id="operatorManagementList"></div>
		<br>
		<div id="operatorListPageNavi"></div>
		<div id="operatorListMenu">
			<div class="ui button" id="selectOperatorDelete">삭제</div>
			<div class="ui button" id="operatorInsert">등록</div>
		</div>
		<br> <br>
	</div>
</div>