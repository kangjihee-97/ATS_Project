<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>ATS | 면접 일정 등록</title>
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
	background: #f5ede3;
	display: flex;
	min-height: 100vh;
	color: #3d1c02
}

.sidebar {
	width: 230px;
	min-height: 100vh;
	flex-shrink: 0;
	background: linear-gradient(180deg, #3d1c02, #5c2a0e);
	display: flex;
	flex-direction: column;
	position: fixed;
	top: 0;
	left: 0;
	height: 100%;
	z-index: 100
}

.sb-logo {
	padding: 28px 22px 24px;
	border-bottom: 1px solid rgba(255, 255, 255, .08)
}

.sb-logo-row {
	display: flex;
	align-items: center;
	gap: 10px
}

.sb-logo-box {
	width: 38px;
	height: 38px;
	border-radius: 10px;
	background: linear-gradient(135deg, #d4a017, #e8c547);
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 18px
}

.sb-logo-name {
	font-size: 18px;
	font-weight: 700;
	color: #fff;
	letter-spacing: 1px
}

.sb-logo-sub {
	font-size: 9px;
	color: rgba(255, 255, 255, .35);
	letter-spacing: 2px;
	margin-top: 1px
}

.sb-section {
	padding: 20px 14px 8px;
	font-size: 10px;
	color: rgba(255, 255, 255, .3);
	letter-spacing: 1.5px;
	text-transform: uppercase
}

.sb-menu {
	list-style: none;
	padding: 0 10px
}

.sb-menu li a {
	display: flex;
	align-items: center;
	gap: 10px;
	padding: 10px 14px;
	border-radius: 10px;
	text-decoration: none;
	font-size: 13.5px;
	color: rgba(255, 255, 255, .6);
	transition: all .2s;
	margin-bottom: 2px
}

.sb-menu li a:hover {
	background: rgba(255, 255, 255, .07)
}

.sb-menu li a.active {
	background: rgba(212, 160, 23, .18);
	color: #e8c547;
	font-weight: 500
}

.sb-menu li a .ico {
	font-size: 16px;
	width: 20px;
	text-align: center
}

.sb-bottom {
	margin-top: auto;
	padding: 16px 14px;
	border-top: 1px solid rgba(255, 255, 255, .08)
}

.sb-user {
	display: flex;
	align-items: center;
	gap: 10px
}

.sb-avatar {
	width: 36px;
	height: 36px;
	border-radius: 50%;
	background: linear-gradient(135deg, #d4a017, #f0c040);
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 14px;
	font-weight: 700;
	color: #3d1c02;
	flex-shrink: 0
}

.sb-user-info {
	flex: 1;
	min-width: 0
}

.sb-user-name {
	font-size: 13px;
	font-weight: 500;
	color: #fff
}

.sb-user-role {
	font-size: 10.5px;
	color: rgba(255, 255, 255, .4)
}

.sb-logout {
	font-size: 11px;
	color: rgba(255, 255, 255, .35);
	text-decoration: none;
	margin-top: 4px;
	display: block
}

.main {
	margin-left: 230px;
	flex: 1;
	padding: 50px 40px;
	display: flex;
	flex-direction: column;
	align-items: center
}

.form-wrap {
	background: #fff;
	border-radius: 20px;
	padding: 36px 40px;
	width: 100%;
	max-width: 560px;
	border: 1px solid #f0e0cc;
	box-shadow: 0 4px 20px rgba(139, 69, 19, .08)
}

.form-title {
	font-size: 20px;
	font-weight: 700;
	color: #3d1c02;
	margin-bottom: 6px
}

.form-sub {
	font-size: 13px;
	color: #a07050;
	margin-bottom: 28px
}

.alert {
	background: #fee2e2;
	border: 1px solid #fca5a5;
	border-radius: 10px;
	padding: 11px 14px;
	font-size: 13px;
	color: #991b1b;
	margin-bottom: 18px
}

.alert-info {
	background: #fdf0e8;
	border: 1px solid #f0c080;
	border-radius: 10px;
	padding: 11px 14px;
	font-size: 13px;
	color: #8b4513;
	margin-bottom: 18px
}

.field {
	margin-bottom: 18px
}

.field label {
	display: block;
	font-size: 12.5px;
	font-weight: 500;
	color: #7a5030;
	margin-bottom: 7px
}

.required {
	color: #dc2626;
	margin-left: 2px
}

.field select, .field input {
	width: 100%;
	padding: 11px 14px;
	border: 1.5px solid #e8d5c0;
	border-radius: 10px;
	font-size: 13.5px;
	font-family: 'Noto Sans KR', sans-serif;
	color: #3d1c02;
	background: #fff;
	outline: none;
	transition: border-color .2s
}

.field select:focus, .field input:focus {
	border-color: #8b4513;
	box-shadow: 0 0 0 3px rgba(139, 69, 19, .08)
}

.field-row {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 14px
}

.applicant-info {
	margin-top: 6px;
	padding: 8px 12px;
	background: #fdf8f3;
	border-radius: 8px;
	font-size: 12px;
	color: #8b6040;
	display: none
}

.btn-row {
	display: flex;
	gap: 10px;
	margin-top: 24px
}

.btn-submit {
	flex: 1;
	height: 48px;
	background: linear-gradient(135deg, #6b3015, #8b4513);
	color: #fff;
	border: none;
	border-radius: 11px;
	font-size: 14px;
	font-weight: 600;
	cursor: pointer;
	font-family: 'Noto Sans KR', sans-serif
}

.btn-cancel {
	height: 48px;
	padding: 0 24px;
	background: #f5ede3;
	color: #8b4513;
	border: 1.5px solid #e8d5c0;
	border-radius: 11px;
	font-size: 14px;
	font-weight: 500;
	text-decoration: none;
	display: flex;
	align-items: center
}
</style>
</head>
<body>
	<%
	String userName = (String) session.getAttribute("userName");
	String userRole = (String) session.getAttribute("userRole");
	Boolean isMaster = Boolean.TRUE.equals(session.getAttribute("isMaster"));
	Boolean isAdmin = Boolean.TRUE.equals(session.getAttribute("isAdmin"));
	Boolean isInterviewer = Boolean.TRUE.equals(session.getAttribute("isInterviewer"));
	String initial = (userName != null && userName.length() > 0) ? String.valueOf(userName.charAt(0)) : "U";
	String roleLabel = isMaster ? "최고관리자" : isAdmin ? "인사담당자" : "면접관";
	%>
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
		<div class="sb-section">메인</div>
		<ul class="sb-menu">
			<li><a href="/dashboard"><span class="ico">🏠</span>대시보드</a></li>
			<li><a href="/calendar"><span class="ico">📆</span>캘린더</a></li>
		</ul>
		<div class="sb-section">채용 관리</div>
		<ul class="sb-menu">
			<li><a href="/posting/list"><span class="ico">📢</span>채용 공고</a></li>
			<li><a href="/application/list"><span class="ico">👥</span>지원자
					목록</a></li>
			<li><a href="/pipeline/list"><span class="ico">📋</span>파이프라인</a></li>
			<li><a href="/pipeline/history"><span class="ico">📜</span>파이프라인
					히스토리</a></li>
			<li><a href="/schedule/list" class="active"><span
					class="ico">📅</span>면접 일정</a></li>
			<li><a href="/eval/list"><span class="ico">📝</span>면접 평가서</a></li>
		</ul>
		<div class="sb-section">분석</div>
		<ul class="sb-menu">
			<li><a href="/stats"><span class="ico">📊</span>통계 리포트</a></li>
			<%
			if (isMaster) {
			%><li><a href="/admin/users"><span class="ico">⚙️</span>회원
					관리</a></li>
			<%
			}
			%>
		</ul>
		<div class="sb-section">공지</div>
		<ul class="sb-menu">
			<li><a href="/notice/list"><span class="ico">📣</span>공지사항</a></li>
		</ul>
		<div class="sb-section">내 정보</div>
		<ul class="sb-menu">
			<li><a href="/user/mypage"><span class="ico">👤</span>마이 페이지</a></li>
		</ul>
		<div class="sb-bottom">
			<div class="sb-user" onclick="location.href='/user/mypage'"
				style="cursor: pointer">
				<div class="sb-avatar"><%=initial%></div>
				<div class="sb-user-info">
					<div class="sb-user-name"><%=userName%></div>
					<div class="sb-user-role"><%=roleLabel%></div>
				</div>
			</div>
			<a href="/user/logout" class="sb-logout">← 로그아웃</a>
		</div>
	</nav>

	<main class="main">
		<div class="form-wrap">
			<div class="form-title">📅 면접 일정 등록</div>
			<div class="form-sub">면접 일정을 등록하세요. 동일 면접관 1시간 이내 중복은 불가합니다.</div>

			<c:if test="${not empty msg}">
				<div class="alert">⚠️ ${msg}</div>
			</c:if>
			<c:if test="${not empty appMsg}">
				<div class="alert-info">ℹ️ ${appMsg}</div>
			</c:if>

			<form action="/schedule/write" method="post">

				<!-- 지원자 이름 드롭다운 -->
				<div class="field">
					<label>지원자 선택 <span class="required">*</span></label> <select
						name="applicationId" required onchange="showInfo(this)">
						<option value="">지원자를 선택하세요</option>
						<c:choose>
							<c:when test="${empty applicationList}">
								<option disabled>면접 가능한 지원자가 없습니다</option>
							</c:when>
							<c:otherwise>
								<c:forEach var="app" items="${applicationList}">
									<option value="${app.applicationId}" data-email="${app.email}"
										data-posting="${app.postingTitle}">
										${app.applicantName} — ${app.postingTitle}</option>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</select>
					<div class="applicant-info" id="appInfo">
						📧 <span id="appEmail"></span> &nbsp;|&nbsp; 📋 <span
							id="appPosting"></span>
					</div>
				</div>

				<!-- 면접관 선택 -->
				<div class="field">
					<label>면접관 <span class="required">*</span></label> <select
						name="interviewerId" required>
						<option value="">면접관을 선택하세요</option>
						<c:forEach var="u" items="${interviewers}">
							<option value="${u.userId}">${u.name}</option>
						</c:forEach>
					</select>
				</div>

				<!-- 면접 일시 -->
				<div class="field">
					<label>면접 일시 <span class="required">*</span></label> <input
						type="datetime-local" name="scheduledAt" required />
				</div>

				<!-- 장소 + 차수 -->
				<div class="field-row">
					<div class="field" style="margin: 0">
						<label>장소 / 화상 링크</label> <input type="text" name="location"
							placeholder="예) 2층 회의실 A" />
					</div>
					<div class="field" style="margin: 0">
						<label>면접 차수 <span class="required">*</span></label> <select
							name="round" required>
							<option value="1">1차 면접</option>
							<option value="2">2차 면접</option>
						</select>
					</div>
				</div>

				<div class="btn-row">
					<a href="/schedule/list" class="btn-cancel">취소</a>
					<button type="submit" class="btn-submit">일정 등록</button>
				</div>
			</form>
		</div>
	</main>

	<script>
		function showInfo(sel) {
			var opt = sel.options[sel.selectedIndex];
			var infoEl = document.getElementById('appInfo');
			var emailEl = document.getElementById('appEmail');
			var postEl = document.getElementById('appPosting');
			if (sel.value) {
				emailEl.textContent = opt.getAttribute('data-email') || '-';
				postEl.textContent = opt.getAttribute('data-posting') || '-';
				infoEl.style.display = 'block';
			} else {
				infoEl.style.display = 'none';
			}
		}
	</script>
</body>
</html>