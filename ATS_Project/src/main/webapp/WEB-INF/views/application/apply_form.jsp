<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>ATS | 입사 지원서 등록</title>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap')
	;

*, *::before, *::after {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

body {
	font-family: 'Noto Sans KR', sans-serif;
	background: #f5ede3;
	display: flex;
	min-height: 100vh;
	color: #3d1c02;
}

/* ── 사이드바 ── */
.sidebar {
	width: 230px;
	min-height: 100vh;
	flex-shrink: 0;
	background: linear-gradient(180deg, #3d1c02 0%, #5c2a0e 100%);
	display: flex;
	flex-direction: column;
	position: fixed;
	top: 0;
	left: 0;
	height: 100%;
	z-index: 100;
}

.sb-logo {
	padding: 28px 22px 24px;
	border-bottom: 1px solid rgba(255, 255, 255, 0.08);
}

.sb-logo-row {
	display: flex;
	align-items: center;
	gap: 10px;
}

.sb-logo-box {
	width: 38px;
	height: 38px;
	border-radius: 10px;
	background: linear-gradient(135deg, #d4a017, #e8c547);
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 18px;
}

.sb-logo-name {
	font-size: 18px;
	font-weight: 700;
	color: #fff;
	letter-spacing: 1px;
}

.sb-logo-sub {
	font-size: 9px;
	color: rgba(255, 255, 255, 0.35);
	letter-spacing: 2px;
	margin-top: 1px;
}

.sb-section {
	padding: 20px 14px 8px;
	font-size: 10px;
	color: rgba(255, 255, 255, 0.3);
	letter-spacing: 1.5px;
	text-transform: uppercase;
}

.sb-menu {
	list-style: none;
	padding: 0 10px;
}

.sb-menu li a {
	display: flex;
	align-items: center;
	gap: 10px;
	padding: 10px 14px;
	border-radius: 10px;
	text-decoration: none;
	font-size: 13.5px;
	color: rgba(255, 255, 255, 0.6);
	transition: all 0.2s;
	margin-bottom: 2px;
}

.sb-menu li a:hover {
	background: rgba(255, 255, 255, 0.07);
	color: rgba(255, 255, 255, 0.9);
}

.sb-menu li a.active {
	background: rgba(212, 160, 23, 0.18);
	color: #e8c547;
	font-weight: 500;
}

.sb-menu li a .ico {
	font-size: 16px;
	width: 20px;
	text-align: center;
}

/* ── 메인 콘텐츠 ── */
.main {
	margin-left: 230px;
	flex: 1;
	padding: 32px 32px 40px;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.form-container {
	width: 100%;
	max-width: 650px;
	margin-top: 20px;
}

/* 헤더 */
.top-header {
	width: 100%;
	display: flex;
	justify-content: span-between;
	align-items: center;
	margin-bottom: 28px;
}

.top-greeting h1 {
	font-size: 22px;
	font-weight: 700;
	color: #3d1c02;
}

.top-greeting p {
	font-size: 13px;
	color: #a07050;
	margin-top: 4px;
}

/* 입력 카드 */
.card {
	background: #fff;
	border-radius: 16px;
	padding: 30px;
	border: 1px solid #f0e0cc;
	width: 100%;
	box-shadow: 0 4px 6px rgba(61, 28, 2, 0.02);
}

.form-group {
	margin-bottom: 20px;
}

.form-group label {
	display: block;
	font-size: 13px;
	font-weight: 600;
	color: #3d1c02;
	margin-bottom: 8px;
}

.form-control {
	width: 100%;
	padding: 11px 14px;
	font-size: 13.5px;
	border: 1px solid #e8d5c0;
	border-radius: 10px;
	background: #fdf8f3;
	color: #3d1c02;
	outline: none;
	transition: border-color 0.2s;
}

.form-control:focus {
	border-color: #d4a017;
	background: #fff;
}

textarea.form-control {
	resize: none;
	font-family: inherit;
}

/* 버튼 */
.btn-submit {
	width: 100%;
	padding: 14px;
	background: linear-gradient(135deg, #3d1c02 0%, #5c2a0e 100%);
	color: #fff;
	border: none;
	border-radius: 10px;
	font-size: 14.5px;
	font-weight: 600;
	cursor: pointer;
	transition: opacity 0.2s;
	margin-top: 10px;
	box-shadow: 0 4px 12px rgba(61, 28, 2, 0.15);
}

.btn-submit:hover {
	opacity: 0.9;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

	<!-- ── 사이드바 (지원자 시점 레이아웃 유지) ── -->
	<nav class="sidebar">
		<div class="sb-logo">
			<div class="sb-logo-row">
				<img src="/img/vernalis-logo.png"
					style="width: 42px; height: 42px; object-fit: contain; border-radius: 8px; flex-shrink: 0" />
				<div>
					<div class="sb-logo-name">VERNALIS</div>
					<div class="sb-logo-sub">Applicant Tracking</div>
				</div>
			</div>
		</div>

		<div class="sb-section">지원 메뉴</div>
		<ul class="sb-menu">
			<li><a href="/application/apply_form" class="active"><span
					class="ico">📝</span> 지원서 작성</a></li>
		</ul>
	</nav>

	<!-- ── 메인 콘텐츠 ── -->
	<main class="main">
		<div class="top-header">
			<div class="top-greeting">
				<h1>입사 지원서 등록 ✉️</h1>
				<p>채용 전형을 시작하기 위해 아래의 필수 인적 사항을 입력해 주세요.</p>
			</div>
		</div>

		<div class="form-container">
			<div class="card">
				<form id="applyForm">
					<input type="hidden" id="postingId" value="1">

					<div class="form-group">
						<label for="applicantName">지원자 성명</label> <input type="text"
							id="applicantName" class="form-control" placeholder="성명을 입력하세요"
							required>
					</div>

					<div class="form-group">
						<label for="email">이메일 주소</label> <input type="email" id="email"
							class="form-control" placeholder="example@email.com" required>
					</div>

					<div class="form-group">
						<label for="phone">연락처</label> <input type="text" id="phone"
							class="form-control" placeholder="010-0000-0000" required>
					</div>

					<div class="form-group">
						<label for="careerYear">경력 사항 (년)</label> <input type="number"
							id="careerYear" class="form-control" min="0" value="0" required>
					</div>

					<div class="form-group">
						<label for="coverLetter">자기소개 및 지원 동기</label>
						<textarea id="coverLetter" class="form-control" rows="6"
							placeholder="자유롭게 작성해 주세요"></textarea>
					</div>

					<button type="button" class="btn-submit"
						onclick="submitApplication()">지원서 제출하기</button>
				</form>
			</div>
		</div>
	</main>

	<script>
		function submitApplication() {
			var data = {
				postingId : parseInt($("#postingId").val()),
				applicantName : $("#applicantName").val(),
				email : $("#email").val(),
				phone : $("#phone").val(),
				careerYear : parseInt($("#careerYear").val()),
				coverLetter : $("#coverLetter").val()
			};

			if (!data.applicantName || !data.email || !data.phone) {
				alert("필수 입력 항목을 확인해 주세요.");
				return;
			}

			$.ajax({
				type : "POST",
				url : "/application/register",
				contentType : "application/json",
				data : JSON.stringify(data),
				success : function(res) {
					if (res === "SUCCESS") {
						alert("지원서 접수가 완료되었습니다. 파이프라인 화면으로 이동합니다.");
						location.href = "/pipeline/main";
					} else {
						alert("지원서 접수에 실패했습니다.");
					}
				},
				error : function() {
					alert("서버 통신 중 에러가 발생했습니다.");
				}
			});
		}
	</script>
</body>
</html>