<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>footer</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#adminSignIn').click(function() {
			$('#adminSignInModal').modal('show');
		});
	});
</script>
<style type="text/css">
#adminSignInModal {
	margin-left: -15% !important;
	max-width: 307px !important;
	min-width: 307px !important;
}
</style>
</head>
<body>
	<div class="ui inverted vertical footer segment">
		<div class="ui center aligned container">
			<img src="resources/images/logo.png" class="ui centered mini image">
			<div class="ui inverted section divider"></div>
			<div class="ui horizontal inverted small divided link list">
				<a class="item">Contact Us</a> <a class="item">Privacy Policy</a><a
					class="item" href="/agreement">Terms and Conditions</a> <a
					class="item" id="adminSignIn">Admin</a>
			</div>
		</div>
	</div>
	<div class="ui modal" id="adminSignInModal">
		<%@ include file="../admin/adminSignIn.jsp"%>
	</div>
</body>
</html>