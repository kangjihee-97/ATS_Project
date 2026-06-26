<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인증 완료 - VERNALIS</title>
<style>
.overlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	display: flex;
	align-items: center;
	justify-content: center;
	z-index: 9999;
}

.popup {
	background: #fff;
	border-radius: 16px;
	padding: 36px 32px;
	width: 360px;
	text-align: center;
	box-shadow: 0 8px 32px rgba(0, 0, 0, 0.18);
}

.popup h3 {
	font-size: 18px;
	font-weight: 700;
	color: #3b1a08;
	margin-bottom: 10px;
}

.popup p {
	font-size: 14px;
	color: #666;
	margin-bottom: 28px;
	line-height: 1.6;
}

.btn-confirm {
	width: 100%;
	padding: 14px;
	background: #5c2a0e;
	color: #fff;
	border: none;
	border-radius: 10px;
	font-size: 15px;
	font-weight: 700;
	cursor: pointer;
	margin-bottom: 10px;
}

.btn-skip {
	width: 100%;
	padding: 14px;
	background: #f5ece6;
	color: #5c2a0e;
	border: none;
	border-radius: 10px;
	font-size: 15px;
	font-weight: 600;
	cursor: pointer;
}
</style>
</head>
<body>

	<div class="overlay" id="cookiePopup">
		<div class="popup">
			<h3>✅ 인증이 완료됐습니다!</h3>
			<p>
				이 기기에서 <strong>3개월간 로그인 정보를 저장</strong>하시겠습니까?<br> 다음 로그인부터 이메일 인증
				없이 바로 접속됩니다.
			</p>
			<button class="btn-confirm" onclick="saveCookieAndGo()">3개월간
				인증 생략</button>
			<button class="btn-skip" onclick="goNow()">이번만 인증</button>
		</div>
	</div>

	<script>
		function saveCookieAndGo() {
			fetch('/user/saveTrustCookie', {
				method : 'POST'
			}).then(function() {
				window.location.href = '/dashboard';
			});
		}

		function goNow() {
			window.location.href = '/dashboard';
		}
	</script>

</body>
</html>