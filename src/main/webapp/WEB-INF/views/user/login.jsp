<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>VERNALIS | 채용 관리 플랫폼</title>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap')
	;

*, *::before, *::after {
	box-sizing: border-box;
	margin: 0;
	padding: 0
}

body {
	font-family: 'Noto Sans KR', sans-serif;
	min-height: 100vh;
	background: linear-gradient(135deg, #6b2f0e 0%, #a04515 40%, #c86020 100%);
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 24px
}

.container {
	display: flex;
	width: 100%;
	max-width: 1000px;
	min-height: 580px;
	border-radius: 24px;
	overflow: hidden;
	box-shadow: 0 20px 60px rgba(0, 0, 0, .35)
}

/* 왼쪽 패널 */
.left {
	flex: 1;
	background: linear-gradient(160deg, rgba(0, 0, 0, .25) 0%,
		rgba(0, 0, 0, .1) 100%);
	padding: 40px 44px;
	position: relative;
	overflow: hidden;
	display: flex;
	flex-direction: column;
	color: #fff
}

.circle1 {
	position: absolute;
	width: 280px;
	height: 280px;
	border-radius: 50%;
	background: rgba(255, 255, 255, .07);
	top: -60px;
	right: -60px
}

.circle2 {
	position: absolute;
	width: 200px;
	height: 200px;
	border-radius: 50%;
	background: rgba(255, 255, 255, .06);
	bottom: 40px;
	left: -60px
}

.circle3 {
	position: absolute;
	width: 120px;
	height: 120px;
	border-radius: 50%;
	background: rgba(255, 255, 255, .05);
	bottom: 160px;
	right: 40px
}

.logo-area {
	display: flex;
	align-items: center;
	gap: 12px;
	margin-bottom: auto;
	position: relative;
	z-index: 1
}

.logo-img {
	width: 46px;
	height: 46px;
	object-fit: contain;
	border-radius: 8px;
	flex-shrink: 0
}

.logo-name {
	font-size: 18px;
	font-weight: 700;
	letter-spacing: 2px;
	color: #fff;
	line-height: 1.1
}

.logo-sub {
	font-size: 10px;
	color: rgba(255, 255, 255, .6);
	letter-spacing: 2px;
	margin-top: 2px
}

.main-copy {
	position: relative;
	z-index: 1;
	margin: 20px 0 24px
}

.main-copy h2 {
	font-size: 26px;
	font-weight: 700;
	line-height: 1.45;
	color: #fff
}

.copy-desc {
	font-size: 13.5px;
	color: rgba(255, 255, 255, .7);
	line-height: 1.6;
	position: relative;
	z-index: 1;
	margin-bottom: 32px
}

.feature-list {
	list-style: none;
	position: relative;
	z-index: 1;
	margin-top: auto
}

.feature-list li {
	display: flex;
	align-items: center;
	gap: 10px;
	font-size: 13px;
	color: rgba(255, 255, 255, .85);
	margin-bottom: 10px
}

.feat-dot {
	width: 7px;
	height: 7px;
	border-radius: 50%;
	background: #f0c040;
	flex-shrink: 0
}

/* 오른쪽 패널 */
.right {
	width: 440px;
	flex-shrink: 0;
	background: #fff;
	padding: 36px 40px 28px;
	display: flex;
	flex-direction: column;
	overflow-y: auto
}

.tab-row {
	display: flex;
	background: #f5ede3;
	border-radius: 12px;
	padding: 4px;
	margin-bottom: 24px
}

.tab-btn {
	flex: 1;
	height: 38px;
	border: none;
	background: transparent;
	border-radius: 9px;
	font-size: 14px;
	font-weight: 500;
	cursor: pointer;
	font-family: 'Noto Sans KR', sans-serif;
	color: #a07050;
	transition: all .2s
}

.tab-btn.active {
	background: #fff;
	color: #3d1c02;
	font-weight: 600;
	box-shadow: 0 1px 6px rgba(139, 69, 19, .12)
}

/* 폼 공통 */
.form-title {
	font-size: 22px;
	font-weight: 700;
	color: #1a0a00;
	margin-bottom: 5px
}

.form-sub {
	font-size: 13.5px;
	color: #a07050;
	margin-bottom: 20px
}

.field {
	margin-bottom: 14px
}

.field label {
	display: block;
	font-size: 12.5px;
	font-weight: 500;
	color: #7a5030;
	margin-bottom: 6px
}

.input-wrap {
	position: relative
}

.input-wrap .icon {
	position: absolute;
	left: 14px;
	top: 50%;
	transform: translateY(-50%);
	font-size: 15px;
	color: #c8a880;
	z-index: 1
}

.input-wrap input {
	width: 100%;
	height: 48px;
	padding: 0 16px 0 42px;
	border: 1.5px solid #e8d5c0;
	border-radius: 12px;
	font-size: 14px;
	font-family: 'Noto Sans KR', sans-serif;
	color: #3d1c02;
	background: #fdfaf6;
	outline: none;
	transition: all .2s
}

.input-wrap input:focus {
	border-color: #8b4513;
	background: #fff;
	box-shadow: 0 0 0 3px rgba(139, 69, 19, .08)
}

.input-wrap input::placeholder {
	color: #c8a880
}

.input-wrap input.valid {
	border-color: #22c55e;
	background: #f0faf0
}

.input-wrap input.invalid {
	border-color: #ef4444;
	background: #fff8f8
}

/* 비밀번호 토글 버튼 */
.pw-toggle {
	position: absolute;
	right: 14px;
	top: 50%;
	transform: translateY(-50%);
	background: none;
	border: none;
	cursor: pointer;
	font-size: 16px;
	color: #c8a880;
	padding: 0;
	z-index: 2
}

.pw-toggle:hover {
	color: #8b4513
}

/* 아이디+버튼 행 */
.input-btn-row {
	display: flex;
	gap: 8px
}

.input-btn-row .input-wrap {
	flex: 1
}

.btn-check {
	height: 48px;
	padding: 0 14px;
	background: #f5ede3;
	color: #8b4513;
	border: 1.5px solid #e8d5c0;
	border-radius: 12px;
	font-size: 12px;
	font-weight: 600;
	cursor: pointer;
	font-family: 'Noto Sans KR', sans-serif;
	white-space: nowrap;
	transition: all .2s
}

.btn-check:hover {
	background: #ede0d0;
	border-color: #c8a880
}

.btn-check.confirmed {
	background: #f0faf0;
	color: #166534;
	border-color: #a3d9a5
}

/* 피드백 메시지 */
.field-msg {
	font-size: 11px;
	margin-top: 5px;
	min-height: 16px
}

.field-msg.ok {
	color: #166534
}

.field-msg.err {
	color: #dc2626
}

.field-msg.info {
	color: #a07050
}

/* 비밀번호 강도 */
.pw-strength {
	margin-top: 8px
}

.strength-bar {
	display: flex;
	gap: 4px;
	margin-bottom: 5px
}

.strength-seg {
	flex: 1;
	height: 4px;
	border-radius: 4px;
	background: #e8d5c0;
	transition: background .3s
}

.strength-seg.weak {
	background: #ef4444
}

.strength-seg.medium {
	background: #f59e0b
}

.strength-seg.strong {
	background: #22c55e
}

.strength-label {
	font-size: 11px;
	color: #a07050
}

/* 비밀번호 조건 체크리스트 */
.pw-rules {
	background: #fdfaf6;
	border: 1px solid #f0e0cc;
	border-radius: 10px;
	padding: 10px 14px;
	margin-top: 8px
}

.pw-rule {
	display: flex;
	align-items: center;
	gap: 6px;
	font-size: 11.5px;
	color: #b0906070;
	margin-bottom: 4px
}

.pw-rule:last-child {
	margin-bottom: 0
}

.pw-rule .rule-icon {
	font-size: 12px;
	width: 14px;
	text-align: center
}

.pw-rule.pass {
	color: #166534
}

.pw-rule.pass .rule-icon::before {
	content: '✓'
}

.pw-rule:not(.pass) .rule-icon::before {
	content: '○'
}

/* 가입 버튼 */
.btn-register {
	width: 100%;
	height: 52px;
	background: linear-gradient(135deg, #5c2a0e, #8b4513);
	color: #fff;
	border: none;
	border-radius: 14px;
	font-size: 15px;
	font-weight: 700;
	cursor: pointer;
	font-family: 'Noto Sans KR', sans-serif;
	transition: all .2s;
	margin-top: 4px
}

.btn-register:hover:not(:disabled) {
	opacity: .9;
	transform: translateY(-1px);
	box-shadow: 0 4px 16px rgba(139, 69, 19, .3)
}

.btn-register:disabled {
	opacity: .45;
	cursor: not-allowed;
	transform: none
}

/* 로그인 버튼 */
.btn-login {
	width: 100%;
	height: 52px;
	background: linear-gradient(135deg, #5c2a0e, #8b4513);
	color: #fff;
	border: none;
	border-radius: 14px;
	font-size: 15px;
	font-weight: 700;
	cursor: pointer;
	font-family: 'Noto Sans KR', sans-serif;
	transition: all .2s;
	margin-bottom: 20px
}

.btn-login:hover {
	opacity: .9;
	transform: translateY(-1px);
	box-shadow: 0 4px 16px rgba(139, 69, 19, .3)
}

.opt-row {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 24px;
	font-size: 13px
}

.remember {
	display: flex;
	align-items: center;
	gap: 7px;
	color: #8b6040;
	cursor: pointer
}

.remember input[type=checkbox] {
	width: 16px;
	height: 16px;
	accent-color: #8b4513
}

.find-pw {
	color: #8b4513;
	text-decoration: none;
	font-weight: 500
}

.find-pw:hover {
	text-decoration: underline
}

.error-msg {
	background: #fee2e2;
	border: 1px solid #fca5a5;
	border-radius: 10px;
	padding: 10px 14px;
	font-size: 13px;
	color: #991b1b;
	margin-bottom: 16px;
	display: none
}

.error-msg.show {
	display: block
}

.register-form {
	display: none
}

.copyright {
	text-align: center;
	font-size: 11.5px;
	color: #c8a880;
	margin-top: auto;
	padding-top: 12px
}
</style>
</head>
<body>
	<div class="container">
		<!-- 왼쪽 패널 -->
		<div class="left">
			<div class="circle1"></div>
			<div class="circle2"></div>
			<div class="circle3"></div>
			<div class="logo-area">
				<img src="/img/vernalis-logo.png" class="logo-img" alt="VERNALIS" />
				<div>
					<div class="logo-name">VERNALIS</div>
					<div class="logo-sub">APPLICANT TRACKING SYSTEM</div>
				</div>
			</div>
			<div class="main-copy">
				<h2>
					채용의 모든 과정을<br>스마트하게 관리하세요
				</h2>
			</div>
			<p class="copy-desc">
				공고 등록부터 서류 검토, 면접 일정,<br>합격 통보까지 하나의 플랫폼에서.
			</p>
			<ul class="feature-list">
				<li><span class="feat-dot"></span>채용 파이프라인 단계별 실시간 추적</li>
				<li><span class="feat-dot"></span>면접 평가서 다면 평가 자동 집계</li>
				<li><span class="feat-dot"></span>합격·불합격 이메일 자동 발송</li>
				<li><span class="feat-dot"></span>통계 대시보드 &amp; 엑셀 리포트</li>
			</ul>
		</div>

		<!-- 오른쪽 패널 -->
		<div class="right">
			<div class="tab-row">
				<button class="tab-btn active" id="tabLogin"
					onclick="switchTab('login')">로그인</button>
				<button class="tab-btn" id="tabRegister"
					onclick="switchTab('register')">회원가입</button>
			</div>

			<!-- 로그인 폼 -->
			<div id="loginForm">
				<div class="form-title">환영합니다! 👋</div>
				<div class="form-sub">계정 정보를 입력하여 로그인하세요</div>
				<div class="error-msg" id="loginError">${error}</div>
				<form action="/user/login" method="post">
					<div class="field">
						<label>아이디</label>
						<div class="input-wrap">
							<span class="icon">👤</span> <input type="text" name="userId"
								placeholder="아이디를 입력하세요" required />
						</div>
					</div>
					<div class="field">
						<label>비밀번호</label>
						<div class="input-wrap">
							<span class="icon">🔒</span> <input type="password" id="loginPw"
								name="password" placeholder="비밀번호를 입력하세요" required />
							<button type="button" class="pw-toggle"
								onclick="togglePw('loginPw', this)">👁</button>
						</div>
					</div>
					<div class="opt-row">
						<label class="remember"><input type="checkbox"
							name="remember" /> 로그인 상태 유지</label> <a href="#" class="find-pw"
							onclick="openFindPw();return false;">비밀번호 찾기</a>
					</div>
					<button type="submit" class="btn-login">로그인</button>
				</form>
				<div class="copyright">© 2026 VERNALIS · Applicant Tracking
					System</div>
			</div>

			<!-- 회원가입 폼 -->
			<div id="registerForm" class="register-form">
				<div class="form-title">계정 만들기 ✨</div>
				<div class="form-sub">아래 정보를 입력하여 가입하세요</div>

				<form action="/user/register" method="post"
					onsubmit="return validateRegister()">

					<!-- 아이디 -->
					<div class="field">
						<label>아이디 <span style="color: #dc2626">*</span></label>
						<div class="input-btn-row">
							<div class="input-wrap">
								<span class="icon">👤</span> <input type="text" id="regUserId"
									name="userId" placeholder="영문+숫자 4~20자" oninput="onIdInput()"
									required />
							</div>
							<button type="button" class="btn-check" id="btnIdCheck"
								onclick="checkId()">중복확인</button>
						</div>
						<div class="field-msg" id="idMsg"></div>
					</div>

					<!-- 비밀번호 -->
					<div class="field">
						<label>비밀번호 <span style="color: #dc2626">*</span></label>
						<div class="input-wrap">
							<span class="icon">🔒</span> <input type="password" id="regPw"
								name="password" placeholder="8자 이상, 대소문자+특수기호 포함"
								oninput="onPwInput()" required />
							<button type="button" class="pw-toggle"
								onclick="togglePw('regPw', this)">👁</button>
						</div>
						<!-- 강도 게이지 -->
						<div class="pw-strength">
							<div class="strength-bar">
								<div class="strength-seg" id="seg1"></div>
								<div class="strength-seg" id="seg2"></div>
								<div class="strength-seg" id="seg3"></div>
							</div>
							<div class="strength-label" id="strengthLabel">비밀번호를 입력하세요</div>
						</div>
						<!-- 조건 체크리스트 -->
						<div class="pw-rules">
							<div class="pw-rule" id="rule-len">
								<span class="rule-icon"></span>8자 이상
							</div>
							<div class="pw-rule" id="rule-upper">
								<span class="rule-icon"></span>대문자 포함
							</div>
							<div class="pw-rule" id="rule-lower">
								<span class="rule-icon"></span>소문자 포함
							</div>
							<div class="pw-rule" id="rule-special">
								<span class="rule-icon"></span>특수기호 포함 (!@#$%^&* 등)
							</div>
						</div>
					</div>

					<!-- 비밀번호 확인 -->
					<div class="field">
						<label>비밀번호 확인 <span style="color: #dc2626">*</span></label>
						<div class="input-wrap">
							<span class="icon">🔒</span> <input type="password" id="regPw2"
								placeholder="비밀번호를 다시 입력하세요" oninput="onPw2Input()" required />
							<button type="button" class="pw-toggle"
								onclick="togglePw('regPw2', this)">👁</button>
						</div>
						<div class="field-msg" id="pw2Msg"></div>
					</div>

					<!-- 이름 -->
					<div class="field">
						<label>이름 <span style="color: #dc2626">*</span></label>
						<div class="input-wrap">
							<span class="icon">✏️</span> <input type="text" name="name"
								id="regName" placeholder="실명을 입력하세요" oninput="checkSubmit()"
								required />
						</div>
					</div>

					<!-- 이메일 -->
					<div class="field">
						<label>이메일</label>
						<div class="input-btn-row">
							<div class="input-wrap">
								<span class="icon">📧</span> <input type="email" id="regEmail"
									name="email" placeholder="이메일을 입력하세요" oninput="onEmailInput()" />
							</div>
							<button type="button" class="btn-check" id="btnEmailCheck"
								onclick="checkEmail()">중복확인</button>
						</div>
						<div class="field-msg" id="emailMsg"></div>
					</div>

					<!-- 연락처 -->
					<div class="field">
						<label>연락처</label>
						<div class="input-btn-row">
							<div class="input-wrap">
								<span class="icon">📱</span> <input type="tel" id="regPhone"
									name="phone" placeholder="010-0000-0000"
									oninput="onPhoneInput()" maxlength="13" />
							</div>
							<button type="button" class="btn-check" id="btnPhoneCheck"
								onclick="checkPhone()">중복확인</button>
						</div>
						<div class="field-msg" id="phoneMsg"></div>
					</div>

					<button type="submit" class="btn-register" id="btnRegister"
						disabled>가입하기</button>
				</form>
			</div>
		</div>
	</div>

	<!-- 비밀번호 찾기 모달 -->
	<div id="findPwOverlay"
		style="display: none; position: fixed; inset: 0; background: rgba(0, 0, 0, .45); z-index: 999; align-items: center; justify-content: center">
		<div
			style="background: #fff; border-radius: 20px; padding: 36px 40px; width: 100%; max-width: 420px; position: relative; box-shadow: 0 20px 60px rgba(0, 0, 0, .3)">
			<button onclick="closeFindPw()"
				style="position: absolute; top: 16px; right: 20px; background: none; border: none; font-size: 22px; cursor: pointer; color: #b08060">×</button>

			<div id="step1">
				<div
					style="font-size: 18px; font-weight: 700; color: #3d1c02; margin-bottom: 6px">🔐
					비밀번호 찾기</div>
				<div style="font-size: 13px; color: #a07050; margin-bottom: 24px">가입
					시 등록한 아이디와 이메일을 입력하세요</div>
				<div style="margin-bottom: 14px">
					<label
						style="font-size: 12.5px; font-weight: 500; color: #7a5030; display: block; margin-bottom: 6px">아이디</label>
					<input id="fpUserId" type="text" placeholder="아이디를 입력하세요"
						style="width: 100%; height: 48px; padding: 0 14px; border: 1.5px solid #e8d5c0; border-radius: 10px; font-size: 14px; font-family: 'Noto Sans KR', sans-serif; outline: none; color: #3d1c02" />
				</div>
				<div style="margin-bottom: 20px">
					<label
						style="font-size: 12.5px; font-weight: 500; color: #7a5030; display: block; margin-bottom: 6px">이메일</label>
					<input id="fpEmail" type="email" placeholder="가입 시 등록한 이메일"
						style="width: 100%; height: 48px; padding: 0 14px; border: 1.5px solid #e8d5c0; border-radius: 10px; font-size: 14px; font-family: 'Noto Sans KR', sans-serif; outline: none; color: #3d1c02" />
				</div>
				<div id="step1Msg"
					style="font-size: 12px; color: #dc2626; margin-bottom: 12px; display: none"></div>
				<button onclick="verifyIdentity()"
					style="width: 100%; height: 48px; background: linear-gradient(135deg, #5c2a0e, #8b4513); color: #fff; border: none; border-radius: 12px; font-size: 14px; font-weight: 600; cursor: pointer; font-family: 'Noto Sans KR', sans-serif">본인
					확인</button>
			</div>

			<div id="step2" style="display: none">
				<div
					style="font-size: 18px; font-weight: 700; color: #3d1c02; margin-bottom: 6px">✅
					본인 확인 완료</div>
				<div id="step2Name"
					style="font-size: 13px; color: #a07050; margin-bottom: 24px"></div>
				<div style="margin-bottom: 14px">
					<label
						style="font-size: 12.5px; font-weight: 500; color: #7a5030; display: block; margin-bottom: 6px">새
						비밀번호</label> <input id="fpNewPw" type="password"
						placeholder="새 비밀번호를 입력하세요"
						style="width: 100%; height: 48px; padding: 0 14px; border: 1.5px solid #e8d5c0; border-radius: 10px; font-size: 14px; font-family: 'Noto Sans KR', sans-serif; outline: none; color: #3d1c02" />
				</div>
				<div style="margin-bottom: 20px">
					<label
						style="font-size: 12.5px; font-weight: 500; color: #7a5030; display: block; margin-bottom: 6px">새
						비밀번호 확인</label> <input id="fpNewPw2" type="password"
						placeholder="비밀번호를 다시 입력하세요"
						style="width: 100%; height: 48px; padding: 0 14px; border: 1.5px solid #e8d5c0; border-radius: 10px; font-size: 14px; font-family: 'Noto Sans KR', sans-serif; outline: none; color: #3d1c02" />
				</div>
				<div id="step2Msg"
					style="font-size: 12px; color: #dc2626; margin-bottom: 12px; display: none"></div>
				<button onclick="resetPassword()"
					style="width: 100%; height: 48px; background: linear-gradient(135deg, #5c2a0e, #8b4513); color: #fff; border: none; border-radius: 12px; font-size: 14px; font-weight: 600; cursor: pointer; font-family: 'Noto Sans KR', sans-serif">비밀번호
					변경</button>
			</div>

			<div id="step3"
				style="display: none; text-align: center; padding: 10px 0">
				<div style="font-size: 40px; margin-bottom: 14px">🎉</div>
				<div
					style="font-size: 17px; font-weight: 700; color: #3d1c02; margin-bottom: 8px">비밀번호가
					변경되었습니다</div>
				<div style="font-size: 13px; color: #a07050; margin-bottom: 24px">새
					비밀번호로 로그인해 주세요</div>
				<button onclick="closeFindPw()"
					style="width: 100%; height: 46px; background: linear-gradient(135deg, #5c2a0e, #8b4513); color: #fff; border: none; border-radius: 12px; font-size: 14px; font-weight: 600; cursor: pointer; font-family: 'Noto Sans KR', sans-serif">로그인
					하러 가기</button>
			</div>
		</div>
	</div>

	<script>
/* ══════════════════════════════
   공통 유틸
══════════════════════════════ */

// 비밀번호 표시/숨김
function togglePw(inputId, btn) {
  var input = document.getElementById(inputId);
  if (input.type === 'password') {
    input.type = 'text';
    btn.textContent = '🙈';
  } else {
    input.type = 'password';
    btn.textContent = '👁';
  }
}

// 탭 전환
function switchTab(tab) {
  var isLogin = (tab === 'login');
  var lf = document.getElementById('loginForm');
  var rf = document.getElementById('registerForm');
  lf.style.display = isLogin ? 'flex' : 'none';
  lf.style.flexDirection = 'column';
  rf.style.display = isLogin ? 'none' : 'block';
  document.getElementById('tabLogin').classList.toggle('active', isLogin);
  document.getElementById('tabRegister').classList.toggle('active', !isLogin);
}

// 에러 메시지
var errorMsg = '${error}';
if (errorMsg && errorMsg.trim() !== '') {
  var el = document.getElementById('loginError');
  el.classList.add('show');
}

/* ══════════════════════════════
   회원가입 — 유효성 상태
══════════════════════════════ */
var regState = {
  idOk:      false,  // 중복확인 완료
  pwOk:      false,  // 비밀번호 조건 충족
  pw2Ok:     false,  // 비밀번호 일치
  nameOk:    false,  // 이름 입력
  emailOk:   true,   // 이메일은 선택 (비어있으면 OK)
  phoneOk:   true    // 연락처는 선택 (비어있으면 OK)
};

/* ── 아이디 ── */
function onIdInput() {
  regState.idOk = false; // 수정 시 중복확인 초기화
  var val = document.getElementById('regUserId').value;
  var msg = document.getElementById('idMsg');
  var btn = document.getElementById('btnIdCheck');
  btn.classList.remove('confirmed');
  var ok = /^[a-zA-Z0-9]{4,20}$/.test(val);
  if (!val) {
    msg.textContent = ''; msg.className = 'field-msg';
  } else if (!ok) {
    msg.textContent = '영문+숫자 조합 4~20자로 입력하세요';
    msg.className = 'field-msg err';
  } else {
    msg.textContent = '중복확인을 눌러주세요';
    msg.className = 'field-msg info';
  }
  checkSubmit();
}

function checkId() {
  var userId = document.getElementById('regUserId').value.trim();
  var msg = document.getElementById('idMsg');
  if (!userId) { msg.textContent='아이디를 입력하세요'; msg.className='field-msg err'; return; }
  if (!/^[a-zA-Z0-9]{4,20}$/.test(userId)) { msg.textContent='형식이 올바르지 않습니다'; msg.className='field-msg err'; return; }

  fetch('/user/idCheck?userId=' + encodeURIComponent(userId))
  .then(function(r){ return r.text(); })
  .then(function(res){
    if (res.trim() === '0') {
      msg.textContent = '✅ 사용 가능한 아이디입니다';
      msg.className = 'field-msg ok';
      document.getElementById('btnIdCheck').classList.add('confirmed');
      regState.idOk = true;
    } else {
      msg.textContent = '❌ 이미 사용 중인 아이디입니다';
      msg.className = 'field-msg err';
      regState.idOk = false;
    }
    checkSubmit();
  });
}

/* ── 비밀번호 ── */
function onPwInput() {
  var val = document.getElementById('regPw').value;

  var rules = {
    len:     val.length >= 8,
    upper:   /[A-Z]/.test(val),
    lower:   /[a-z]/.test(val),
    special: /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/.test(val)
  };

  // 규칙 클래스 토글
  setRule('rule-len',     rules.len);
  setRule('rule-upper',   rules.upper);
  setRule('rule-lower',   rules.lower);
  setRule('rule-special', rules.special);

  // 강도 계산
  var score = [rules.len, rules.upper, rules.lower, rules.special].filter(Boolean).length;
  var segs = ['seg1','seg2','seg3'];
  segs.forEach(function(s){ document.getElementById(s).className = 'strength-seg'; });

  var label = document.getElementById('strengthLabel');
  if (!val) {
    label.textContent = '비밀번호를 입력하세요';
    label.style.color = '#a07050';
  } else if (score <= 2) {
    document.getElementById('seg1').classList.add('weak');
    label.textContent = '약함 — 조건을 더 충족하세요';
    label.style.color = '#ef4444';
  } else if (score === 3) {
    document.getElementById('seg1').classList.add('medium');
    document.getElementById('seg2').classList.add('medium');
    label.textContent = '보통 — 거의 다 왔어요!';
    label.style.color = '#f59e0b';
  } else {
    segs.forEach(function(s){ document.getElementById(s).classList.add('strong'); });
    label.textContent = '강함 ✓';
    label.style.color = '#166534';
  }

  regState.pwOk = (score === 4);
  onPw2Input();
  checkSubmit();
}

function setRule(id, pass) {
  var el = document.getElementById(id);
  if (pass) el.classList.add('pass');
  else el.classList.remove('pass');
}

/* ── 비밀번호 확인 ── */
function onPw2Input() {
  var pw  = document.getElementById('regPw').value;
  var pw2 = document.getElementById('regPw2').value;
  var msg = document.getElementById('pw2Msg');
  var input = document.getElementById('regPw2');
  if (!pw2) {
    msg.textContent = ''; msg.className = 'field-msg';
    input.className = ''; regState.pw2Ok = false;
  } else if (pw === pw2) {
    msg.textContent = '✅ 비밀번호가 일치합니다';
    msg.className = 'field-msg ok';
    input.classList.add('valid'); input.classList.remove('invalid');
    regState.pw2Ok = true;
  } else {
    msg.textContent = '❌ 비밀번호가 일치하지 않습니다';
    msg.className = 'field-msg err';
    input.classList.add('invalid'); input.classList.remove('valid');
    regState.pw2Ok = false;
  }
  checkSubmit();
}

/* ── 이메일 ── */
function onEmailInput() {
  var val = document.getElementById('regEmail').value.trim();
  var msg = document.getElementById('emailMsg');
  var btn = document.getElementById('btnEmailCheck');
  btn.classList.remove('confirmed');
  // 비어있으면 선택사항이므로 OK
  if (!val) {
    regState.emailOk = true;
    msg.textContent = ''; msg.className = 'field-msg';
  } else {
    regState.emailOk = false;
    msg.textContent = '중복확인을 눌러주세요';
    msg.className = 'field-msg info';
  }
  checkSubmit();
}

function checkEmail() {
  var email = document.getElementById('regEmail').value.trim();
  var msg = document.getElementById('emailMsg');
  if (!email) { regState.emailOk = true; checkSubmit(); return; }
  if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
    msg.textContent = '이메일 형식이 올바르지 않습니다';
    msg.className = 'field-msg err';
    regState.emailOk = false; checkSubmit(); return;
  }
  fetch('/user/emailCheck?email=' + encodeURIComponent(email))
  .then(function(r){ return r.text(); })
  .then(function(res){
    if (res.trim() === '0') {
      msg.textContent = '✅ 사용 가능한 이메일입니다';
      msg.className = 'field-msg ok';
      document.getElementById('btnEmailCheck').classList.add('confirmed');
      regState.emailOk = true;
    } else {
      msg.textContent = '❌ 이미 등록된 이메일입니다';
      msg.className = 'field-msg err';
      regState.emailOk = false;
    }
    checkSubmit();
  });
}

/* ── 연락처 ── */
function onPhoneInput() {
  var input = document.getElementById('regPhone');
  var val = input.value.replace(/[^0-9]/g, '');
  // 자동 하이픈
  if (val.length <= 3) {
    input.value = val;
  } else if (val.length <= 7) {
    input.value = val.slice(0,3) + '-' + val.slice(3);
  } else {
    input.value = val.slice(0,3) + '-' + val.slice(3,7) + '-' + val.slice(7,11);
  }
  var btn = document.getElementById('btnPhoneCheck');
  btn.classList.remove('confirmed');
  var msg = document.getElementById('phoneMsg');
  var formatted = input.value;
  if (!formatted) {
    regState.phoneOk = true;
    msg.textContent = ''; msg.className = 'field-msg';
  } else {
    regState.phoneOk = false;
    msg.textContent = '중복확인을 눌러주세요';
    msg.className = 'field-msg info';
  }
  checkSubmit();
}

function checkPhone() {
  var phone = document.getElementById('regPhone').value.trim();
  var msg = document.getElementById('phoneMsg');
  if (!phone) { regState.phoneOk = true; checkSubmit(); return; }
  if (!/^010-\d{4}-\d{4}$/.test(phone)) {
    msg.textContent = '010-0000-0000 형식으로 입력하세요';
    msg.className = 'field-msg err';
    regState.phoneOk = false; checkSubmit(); return;
  }
  fetch('/user/phoneCheck?phone=' + encodeURIComponent(phone))
  .then(function(r){ return r.text(); })
  .then(function(res){
    if (res.trim() === '0') {
      msg.textContent = '✅ 사용 가능한 연락처입니다';
      msg.className = 'field-msg ok';
      document.getElementById('btnPhoneCheck').classList.add('confirmed');
      regState.phoneOk = true;
    } else {
      msg.textContent = '❌ 이미 등록된 연락처입니다';
      msg.className = 'field-msg err';
      regState.phoneOk = false;
    }
    checkSubmit();
  });
}

/* ── 가입 버튼 활성화 체크 ── */
function checkSubmit() {
  var name = document.getElementById('regName');
  regState.nameOk = name && name.value.trim().length > 0;
  var ok = regState.idOk && regState.pwOk && regState.pw2Ok &&
           regState.nameOk && regState.emailOk && regState.phoneOk;
  document.getElementById('btnRegister').disabled = !ok;
}

/* ── 최종 제출 검증 ── */
function validateRegister() {
  if (!regState.idOk)   { alert('아이디 중복확인을 해주세요.'); return false; }
  if (!regState.pwOk)   { alert('비밀번호 조건을 모두 충족해주세요.'); return false; }
  if (!regState.pw2Ok)  { alert('비밀번호가 일치하지 않습니다.'); return false; }
  if (!regState.nameOk) { alert('이름을 입력해주세요.'); return false; }
  if (!regState.emailOk){ alert('이메일 중복확인을 해주세요.'); return false; }
  if (!regState.phoneOk){ alert('연락처 중복확인을 해주세요.'); return false; }
  return true;
}

/* ══════════════════════════════
   비밀번호 찾기 모달
══════════════════════════════ */
function openFindPw() {
  var ov = document.getElementById('findPwOverlay');
  ov.style.display = 'flex';
  document.getElementById('step1').style.display = 'block';
  document.getElementById('step2').style.display = 'none';
  document.getElementById('step3').style.display = 'none';
  document.getElementById('fpUserId').value = '';
  document.getElementById('fpEmail').value  = '';
  document.getElementById('step1Msg').style.display = 'none';
}
function closeFindPw() {
  document.getElementById('findPwOverlay').style.display = 'none';
}
document.getElementById('findPwOverlay').addEventListener('click', function(e){
  if (e.target === this) closeFindPw();
});

function verifyIdentity() {
  var userId = document.getElementById('fpUserId').value.trim();
  var email  = document.getElementById('fpEmail').value.trim();
  var msg    = document.getElementById('step1Msg');
  if (!userId || !email) { msg.textContent='아이디와 이메일을 모두 입력하세요.'; msg.style.display='block'; return; }
  fetch('/user/verifyIdentity', {
    method:'POST',
    headers:{'Content-Type':'application/x-www-form-urlencoded'},
    body:'userId='+encodeURIComponent(userId)+'&email='+encodeURIComponent(email)
  })
  .then(function(r){ return r.json(); })
  .then(function(res){
    if (res.success) {
      document.getElementById('step2Name').textContent = res.name + '님, 새 비밀번호를 설정하세요';
      document.getElementById('step1').style.display = 'none';
      document.getElementById('step2').style.display = 'block';
      document.getElementById('fpNewPw').value  = '';
      document.getElementById('fpNewPw2').value = '';
    } else {
      msg.textContent = res.message; msg.style.display = 'block';
    }
  })
  .catch(function(){ msg.textContent='서버 오류가 발생했습니다.'; msg.style.display='block'; });
}

function resetPassword() {
  var pw1 = document.getElementById('fpNewPw').value.trim();
  var pw2 = document.getElementById('fpNewPw2').value.trim();
  var msg = document.getElementById('step2Msg');
  if (!pw1) { msg.textContent='새 비밀번호를 입력하세요.'; msg.style.display='block'; return; }
  if (pw1 !== pw2) { msg.textContent='비밀번호가 일치하지 않습니다.'; msg.style.display='block'; return; }
  if (pw1.length < 8) { msg.textContent='비밀번호는 8자 이상 입력하세요.'; msg.style.display='block'; return; }
  var userId = document.getElementById('fpUserId').value.trim();
  var email  = document.getElementById('fpEmail').value.trim();
  fetch('/user/resetPasswordByEmail', {
    method:'POST',
    headers:{'Content-Type':'application/x-www-form-urlencoded'},
    body:'userId='+encodeURIComponent(userId)+'&email='+encodeURIComponent(email)+'&newPassword='+encodeURIComponent(pw1)
  })
  .then(function(r){ return r.json(); })
  .then(function(res){
    if (res.success) {
      document.getElementById('step2').style.display = 'none';
      document.getElementById('step3').style.display = 'block';
    } else {
      msg.textContent = res.message; msg.style.display = 'block';
    }
  })
  .catch(function(){ msg.textContent='서버 오류가 발생했습니다.'; msg.style.display='block'; });
}
</script>
</body>
</html>