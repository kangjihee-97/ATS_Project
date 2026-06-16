<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>ATS | 지원서 등록</title>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap')
	;

*, *::before, *::after {
	box-sizing: border-box;
	margin: 0;
	padding: 0
}

html, body {
	width: 100%;
	height: 100%
}

body {
	font-family: 'Noto Sans KR', sans-serif;
	background: #f5ede3;
	display: flex;
	min-height: 100vh;
	color: #3d1c02;
	overflow-x: hidden;
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
	z-index: 100;
	overflow-y: auto;
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
	background: rgba(255, 255, 255, .07);
	color: rgba(255, 255, 255, .9)
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

/* ── 핵심 수정 부분 ── */
.main {
	margin-left: 230px;
	width: calc(100% - 230px); /* 너비 명시 */
	min-width: 0;
	padding: 50px 40px;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.page-header {
	width: 100%;
	max-width: 600px;
	margin-bottom: 28px
}

.page-title {
	font-size: 24px;
	font-weight: 700;
	color: #3d1c02
}

.page-sub {
	font-size: 13px;
	color: #a07050;
	margin-top: 6px
}

.form-card {
	background: #fff;
	border-radius: 20px;
	padding: 36px 40px;
	width: 100%;
	max-width: 600px;
	border: 1px solid #f0e0cc;
	box-shadow: 0 4px 20px rgba(139, 69, 19, .06);
}

.field {
	margin-bottom: 22px
}

.field label {
	display: block;
	font-size: 13px;
	font-weight: 500;
	color: #5c2a0e;
	margin-bottom: 8px
}

.required {
	color: #dc2626;
	margin-left: 2px
}

.field input, .field select, .field textarea {
	width: 100%;
	padding: 13px 16px;
	border: 1.5px solid #e8d5c0;
	border-radius: 12px;
	font-size: 14px;
	font-family: 'Noto Sans KR', sans-serif;
	color: #3d1c02;
	background: #fdfaf6;
	outline: none;
	transition: all .2s;
}

.field input:focus, .field select:focus, .field textarea:focus {
	border-color: #8b4513;
	background: #fff;
	box-shadow: 0 0 0 3px rgba(139, 69, 19, .08);
}

.field textarea {
	resize: vertical;
	min-height: 120px;
	line-height: 1.7
}

/* 파일 업로드 */
.drop-zone {
	border: 2px dashed #e8d5c0;
	border-radius: 12px;
	padding: 28px 20px;
	text-align: center;
	background: #fdfaf6;
	cursor: pointer;
	transition: all .25s;
	position: relative;
}

.drop-zone:hover, .drop-zone.dragover {
	border-color: #8b4513;
	background: #fdf5ec
}

.drop-icon {
	font-size: 36px;
	margin-bottom: 10px
}

.drop-title {
	font-size: 14px;
	font-weight: 600;
	color: #5c2a0e;
	margin-bottom: 6px
}

.drop-sub {
	font-size: 12px;
	color: #b08060;
	line-height: 1.6
}

.drop-ext {
	display: inline-flex;
	gap: 6px;
	margin-top: 10px;
	flex-wrap: wrap;
	justify-content: center
}

.ext-badge {
	padding: 3px 10px;
	border-radius: 20px;
	font-size: 10px;
	font-weight: 600;
	background: #f5ede3;
	color: #8b4513;
	border: 1px solid #e8d5c0
}

#resumeFile {
	position: absolute;
	inset: 0;
	opacity: 0;
	cursor: pointer;
	width: 100%;
	height: 100%
}

.file-selected {
	display: none;
	align-items: center;
	gap: 12px;
	margin-top: 12px;
	padding: 12px 16px;
	background: #f0f9f4;
	border: 1.5px solid #86efac;
	border-radius: 10px
}

.file-selected.show {
	display: flex
}

.file-icon {
	font-size: 24px;
	flex-shrink: 0
}

.file-name {
	font-size: 13px;
	font-weight: 500;
	color: #166534;
	flex: 1;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap
}

.file-size {
	font-size: 11px;
	color: #16a34a
}

.file-remove {
	background: none;
	border: none;
	font-size: 18px;
	cursor: pointer;
	color: #dc2626;
	padding: 0;
	line-height: 1;
	flex-shrink: 0
}

.btn-row {
	display: flex;
	gap: 10px;
	margin-top: 8px
}

.btn-submit {
	flex: 1;
	height: 52px;
	background: linear-gradient(135deg, #3d1c02, #5c2a0e);
	color: #fff;
	border: none;
	border-radius: 12px;
	font-size: 15px;
	font-weight: 600;
	cursor: pointer;
	font-family: 'Noto Sans KR', sans-serif;
	transition: all .25s
}

.btn-submit:hover {
	opacity: .9
}

.btn-back {
	height: 52px;
	padding: 0 24px;
	background: #f5ede3;
	color: #8b4513;
	border: 1.5px solid #e8d5c0;
	border-radius: 12px;
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
			<li><a href="/application/list" class="active"><span
					class="ico">👥</span>지원자 목록</a></li>
			<li><a href="/pipeline/list"><span class="ico">📋</span>파이프라인</a></li>
			<li><a href="/pipeline/history"><span class="ico">📜</span>파이프라인 히스토리</a></li>
			<li><a href="/schedule/list"><span class="ico">📅</span>면접
					일정</a></li>
			<li><a href="/eval/list"><span class="ico">📝</span>면접 평가서</a></li>
		</ul>
		<div class="sb-section">분석</div>
		<ul class="sb-menu">
			<li><a href="/stats"><span class="ico">📊</span>통계 리포트</a></li>
			<%
			if (isMaster) {
			%><li><a href="/admin/users"><span
					class="ico">⚙️</span>회원 관리</a></li>
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
			<div class="sb-user" onclick="location.href='/user/mypage'" style="cursor:pointer">
				<div class="sb-avatar"><%=initial%></div>
				<div style="flex: 1; min-width: 0">
					<div class="sb-user-name"><%=userName%></div>
					<div class="sb-user-role"><%=roleLabel%></div>
				</div>
			</div>
			<a href="/user/logout" class="sb-logout">← 로그아웃</a>
		</div>
	</nav>

	<main class="main">
		<div class="page-header">
			<div class="page-title">✉️ 입사 지원서 등록</div>
			<div class="page-sub">채용 전형을 시작하기 위해 아래의 필수 인적 사항을 입력해 주세요.</div>
		</div>

		<div class="form-card">
			<form action="/application/write" method="post"
				enctype="multipart/form-data">

				<div class="field">
					<label>지원 공고 <span class="required">*</span></label> <select
						name="postingId" required>
						<option value="">공고를 선택하세요</option>
						<c:forEach var="p" items="${postingList}">
							<option value="${p.postingId}">${p.title}
								(${p.department})</option>
						</c:forEach>
					</select>
				</div>

				<div class="field">
					<label>지원자 성명 <span class="required">*</span></label> <input
						type="text" name="applicantName" placeholder="성명을 입력하세요" required />
				</div>

				<div class="field">
					<label>이메일 주소 <span class="required">*</span></label> <input
						type="email" name="email" placeholder="example@email.com" required />
				</div>

				<div class="field">
					<label>연락처</label> <input type="tel" name="phone"
						placeholder="010-0000-0000" />
				</div>

				<div class="field">
					<label>경력 사항 (년)</label> <input type="number" name="careerYear"
						min="0" max="30" value="0" />
				</div>

				<div class="field">
					<label>지원 동기</label>
					<textarea name="coverLetter" placeholder="자유롭게 작성해 주세요"></textarea>
				</div>

				<div class="field">
					<label>이력서 첨부 <span
						style="font-size: 11px; color: #b08060; font-weight: 400">(선택
							· PDF, DOC, DOCX, HWP)</span></label>
					<div class="drop-zone" id="dropZone">
						<input type="file" name="resumeFile" id="resumeFile"
							accept=".pdf,.doc,.docx,.hwp" onchange="handleFile(this)" />
						<div class="drop-icon">📎</div>
						<div class="drop-title">클릭하거나 파일을 드래그하세요</div>
						<div class="drop-sub">
							이력서, 포트폴리오 등을 첨부할 수 있습니다<br>최대 10MB
						</div>
						<div class="drop-ext">
							<span class="ext-badge">PDF</span> <span class="ext-badge">DOC</span>
							<span class="ext-badge">DOCX</span> <span class="ext-badge">HWP</span>
						</div>
					</div>
					<div class="file-selected" id="fileSelected">
						<span class="file-icon" id="fileIcon">📄</span>
						<div style="flex: 1; min-width: 0">
							<div class="file-name" id="fileName"></div>
							<div class="file-size" id="fileSize"></div>
						</div>
						<button type="button" class="file-remove" onclick="removeFile()">✕</button>
					</div>
				</div>

				<div class="btn-row">
					<a href="/application/list" class="btn-back">취소</a>
					<button type="submit" class="btn-submit">지원서 제출하기</button>
				</div>
			</form>
		</div>
	</main>

	<script>
		var dropZone = document.getElementById('dropZone');
		dropZone.addEventListener('dragover', function(e) {
			e.preventDefault();
			dropZone.classList.add('dragover')
		});
		dropZone.addEventListener('dragleave', function() {
			dropZone.classList.remove('dragover')
		});
		dropZone
				.addEventListener(
						'drop',
						function(e) {
							e.preventDefault();
							dropZone.classList.remove('dragover');
							var f = e.dataTransfer.files[0];
							if (f) {
								document.getElementById('resumeFile').files = e.dataTransfer.files;
								showFile(f);
							}
						});
		function handleFile(i) {
			if (i.files && i.files[0])
				showFile(i.files[0]);
		}
		function showFile(f) {
			var ext = f.name.split('.').pop().toLowerCase();
			var icons = {
				pdf : '📕',
				doc : '📘',
				docx : '📘',
				hwp : '📗'
			};
			document.getElementById('fileIcon').textContent = icons[ext]
					|| '📄';
			document.getElementById('fileName').textContent = f.name;
			document.getElementById('fileSize').textContent = formatSize(f.size);
			document.getElementById('fileSelected').classList.add('show');
			dropZone.style.borderColor = '#86efac';
			dropZone.style.background = '#f0fdf4';
		}
		function removeFile() {
			document.getElementById('resumeFile').value = '';
			document.getElementById('fileSelected').classList.remove('show');
			dropZone.style.borderColor = '';
			dropZone.style.background = '';
		}
		function formatSize(b) {
			if (b < 1024)
				return b + ' B';
			if (b < 1048576)
				return (b / 1024).toFixed(1) + ' KB';
			return (b / 1048576).toFixed(1) + ' MB';
		}
	</script>
</body>
</html>