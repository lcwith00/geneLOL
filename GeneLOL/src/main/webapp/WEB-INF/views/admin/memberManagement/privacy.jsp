<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="resources/semantic-ui/semantic.min.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="resources/semantic-ui/semantic.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.menu .item').tab();
	});
</script>
<style type="text/css">
header {
	width: 100%;
	height: 50px;
}

.aside {
	left: 30px;
	float: left;
	width: 20%;
	min-height: 400px;
	margin-left: 10%;
}

#list {
	width: 60%;
	min-height: 600px;
	float: right;
	margin-right: 10%;
}

#privacy {
	margin-top: 3px;
	margin-left: 10%;
	margin-right: 10%;
}

footer {
	clear: both;
	width: 100%;
	height: 50px;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../../common/header.jsp"%>
	</header>
	<div id="privacy">
		<div class="ui top attached tabular menu">
			<a class="item" href="agreement">이용약관</a> <a class="item active"
				href="privacy">개인정보취급방침</a>
		</div>
		<div class="ui bottom attached tab segment active">
			<div class="TermsLayout">
				<div class="Content">
					<p>
						<span class='company'>'OP.GG'</span>은(는) 개인정보보호법에 따라 이용자의 개인정보 보호
						및 권익을 보호하고 개인정보와 관련한 이용자의 고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다.
					</p>

					<p>
						<span class='company'>'OP.GG'</span>은(는) 회사는 개인정보처리방침을 개정하는 경우
						웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.
					</p>

					<ul>
						<li>본 방침은부터 2014년 7월 25일부터 시행됩니다.</li>
					</ul>

					<hr />

					<h2>개인정보의 처리 목적</h2>

					<p>
						<span class='company'>'OP.GG'</span>은(는) 개인정보를 다음의 목적을 위해 처리합니다.
						처리한 개인정보는 다음의 목적이외의 용도로는 사용되지 않으며 이용 목적이 변경될 시에는 사전동의를 구할 예정입니다.
					</p>

					<ol>
						<li><p>홈페이지 회원가입 및 관리</p>

							<p>회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리, 서비스 부정이용
								방지, 각종 고지·통지, 분쟁 조정을 위한 기록 보존 등을 목적으로 개인정보를 처리합니다.</p></li>
						<li><p>민원사무 처리</p>

							<p>민원인의 신원 확인, 민원사항 확인, 사실조사를 위한 연락·통지, 처리결과 통보 등을 목적으로 개인정보를
								처리합니다.</p></li>
						<li><p>재화 또는 서비스 제공</p>

							<p>서비스 제공, 콘텐츠 제공 등을 목적으로 개인정보를 처리합니다.</p></li>
						<li><p>마케팅 및 광고에의 활용</p>

							<p>신규 서비스(제품) 개발 및 맞춤 서비스 제공, 이벤트 및 광고성 정보 제공 및 참여기회 제공,
								인구통계학적 특성에 따른 서비스 제공 및 광고 게재, 서비스의 유효성 확인, 접속빈도 파악 또는 회원의 서비스
								이용에 대한 통계 등을 목적으로 개인정보를 처리합니다.</p></li>
					</ol>

					<h2>개인정보 파일 현황</h2>

					<ul>
						<li><p>개인정보의 처리 및 보유 기간</p>

							<ol>
								<li><p>
										<span class='company'>'OP.GG'</span>은(는) 법령에 따른 개인정보 보유·이용기간
										또는 정보주체로부터 개인정보를 수집시에 동의 받은 개인정보 보유,이용기간 내에서 개인정보를 처리, 보유합니다.
									</p></li>
								<li><p>각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.</p>

									<p>
										<strong>&lt;홈페이지 회원가입 및 관리></strong>
									</p>

									<p>개인정보의 수집, 이용에 관한 동의일로부터 개인정보의 파기요청으로 인한 파기일 까지, 그리고
										파기일로부터 &lt;3개월>까지 위 이용목적을 위하여 보유, 이용됩니다.</p>

									<ul>
										<li>예외사유 : 수사기관의 협조요청시 수사 종료전까지 보관</li>
									</ul></li>
							</ol></li>
					</ul>

					<h2>정보주체의 권리,의무 및 그 행사방법</h2>

					<p>이용자는 개인정보주체로서 다음과 같은 권리를 행사할 수 있습니다.</p>

					<ol>
						<li><p>
								정보주체는 <span class='company'>'OP.GG'</span>에 대해 언제든지 다음 각 호의 개인정보
								보호 관련 권리를 행사할 수 있습니다.
							</p>

							<ol>
								<li><p>개인정보 조회</p></li>
								<li><p>개인정보 수정</p></li>
								<li><p>오류 등이 있을 경우 정정 요구</p></li>
								<li><p>회원 탈퇴</p></li>
							</ol></li>
						<li><p>제1항에 따른 권리 행사는 사이트 내의 회원정보 관리 시스템에서 정보주체가 직접 권리를
								행사 할 수 있습니다.</p></li>
						<li><p>정보주체가 개인정보의 오류 등에 대한 정정 또는 삭제를 요구한 경우에는 OP.GG은(는)
								정정 또는 삭제를 완료할 때까지 당해 개인정보를 이용하거나 제공하지 않습니다.</p></li>
					</ol>

					<h2>처리하는 개인정보의 항목</h2>

					<ul>
						<li><p>
								<span class='company'>'OP.GG'</span>은(는) 다음의 개인정보 항목을 처리하고 있습니다.
							</p>

							<p>
								<strong>&lt;홈페이지 회원가입 및 관리></strong>
							</p>

							<ul>
								<li>필수항목 : 비밀번호, 로그인ID, 이메일, 접속 IP 정보, 서비스 이용 기록, 접속 로그</li>
							</ul></li>
					</ul>

					<h2>개인정보의 파기</h2>

					<p>
						<span class='company'>'OP.GG'</span>은(는) 원칙적으로 개인정보 처리목적이 달성된 경우에는
						지체없이 해당 개인정보를 파기합니다. 파기의 절차, 기한 및 방법은 다음과 같습니다.
					</p>

					<ul>
						<li><p>파기절차</p>

							<p>이용자가 입력한 정보는 목적 달성 후 별도의 DB에 옮겨져(종이의 경우 별도의 서류) 내부 방침 및 기타
								관련 법령에 따라 일정기간 저장된 후 혹은 즉시 파기됩니다. 이 때, DB로 옮겨진 개인정보는 법률에 의한 경우가
								아니고서는 다른 목적으로 이용되지 않습니다.</p></li>
						<li><p>파기기한</p>

							<p>이용자의 개인정보는 개인정보의 보유기간이 경과된 경우에는 보유기간의 종료일로부터 5일 이내에, 개인정보의
								처리 목적 달성, 해당 서비스의 폐지, 사업의 종료 등 그 개인정보가 불필요하게 되었을 때에는 개인정보의 처리가
								불필요한 것으로 인정되는 날로부터 5일 이내에 그 개인정보를 파기합니다.</p>

							<p>단, 개인정보의 보유 기간에 대한 정책에 의해 예외적으로 파기가 되지 않거나 별도의 DB에 옮겨 해당
								보유기간까지 보유 할 수 있습니다.</p></li>
					</ul>

					<h2>개인정보의 안전성 확보 조치</h2>

					<p>
						<span class='company'>'OP.GG'</span>은(는) 개인정보보호법 제29조에 따라 다음과 같이
						안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다.
					</p>

					<ol>
						<li><p>비밀번호의 암호화</p>

							<p>이용자의 비밀번호는 암호화 되어 저장 및 관리되고 있어, 본인만이 알 수 있으며 개인정보의 확인, 변경
								및 탈퇴(파기)도 비밀번호를 알고 있는 본인에 의해서만 가능합니다.</p></li>
						<li><p>개인정보의 암호화</p>

							<p>중요한 개인정보는 데이터를 전송시 암호화하는 등의 별도 보안기능을 이용하고 있으며, 추가적인 보안문제가
								발견될 경우 보안성 확보를 위해 기술적인 장치를 갖추려고 노력하고 있습니다.</p></li>
					</ol>

					<h2>개인정보 보호책임자 작성</h2>

					<ul>
						<li><p>
								<span class='company'>'OP.GG'</span>은(는) 개인정보 처리에 관한 업무를 총괄해서
								책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를
								지정하고 있습니다.
							</p>

							<p>
								<strong>개인정보 보호책임자</strong>
							</p>

							<p>책임자: 관리팀</p>

							<p>연락처: contact@op.gg</p></li>
					</ul>

					<h2>개인정보 처리방침 변경</h2>

					<p>이 개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는
						경우에는 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다.</p>

				</div>
			</div>
		</div>
	</div>
	<footer>
		<%@ include file="../../common/footer.jsp"%>
	</footer>
</body>
</html>