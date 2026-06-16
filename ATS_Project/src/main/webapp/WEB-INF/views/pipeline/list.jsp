<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>ATS | 파이프라인</title>
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

.sb-user-info {
	flex: 1;
	min-width: 0
}

.sb-user-name {
	font-size: 13px;
	font-weight: 500;
	color: #fff;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap
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

/* ── 메인 ── */
.main {
	margin-left: 230px;
	flex: 1;
	padding: 30px;
	min-width: 0;
	overflow-x: auto
}

.top-bar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 6px
}

.page-title {
	font-size: 20px;
	font-weight: 700;
	color: #3d1c02;
	display: flex;
	align-items: center;
	gap: 8px
}

.page-sub {
	font-size: 13px;
	color: #a07050;
	margin-bottom: 22px
}

.top-date {
	font-size: 13px;
	color: #a07050;
	background: #fff;
	padding: 7px 14px;
	border-radius: 9px;
	border: 1px solid #e8d5c0
}

/* ── 칸반 보드 ── */
.kanban {
	display: flex;
	gap: 16px;
	align-items: flex-start;
	min-height: 500px
}

.column {
	flex: 1;
	min-width: 200px;
	background: #fff;
	border-radius: 16px;
	padding: 0;
	border: 1px solid #f0e0cc;
	display: flex;
	flex-direction: column
}

.col-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 14px 16px;
	border-bottom: 1.5px solid #f5ede3
}

.col-title {
	font-size: 14px;
	font-weight: 600;
	color: #3d1c02
}

.col-count {
	min-width: 24px;
	height: 24px;
	padding: 0 7px;
	border-radius: 20px;
	font-size: 12px;
	font-weight: 700;
	display: flex;
	align-items: center;
	justify-content: center
}

.cnt-received {
	background: #dbeafe;
	color: #1e40af
}

.cnt-docpass {
	background: #ede9fe;
	color: #5b21b6
}

.cnt-interview {
	background: #fef3c7;
	color: #92400e
}

.col-body {
	padding: 12px;
	flex: 1;
	min-height: 200px;
	transition: background .2s
}

.col-body.drag-over {
	background: #fdf0e8
}

/* ── 지원자 카드 ── */
.app-card {
	background: #fdfaf6;
	border-radius: 12px;
	padding: 14px 16px;
	margin-bottom: 10px;
	border: 1.5px solid #f0e0cc;
	cursor: grab;
	transition: transform .15s, box-shadow .15s;
	user-select: none
}

.app-card:active {
	cursor: grabbing
}

.app-card:hover {
	transform: translateY(-2px);
	box-shadow: 0 4px 14px rgba(139, 69, 19, .12)
}

.app-card.dragging {
	opacity: .5;
	transform: rotate(2deg)
}

.card-name {
	font-size: 14px;
	font-weight: 700;
	color: #3d1c02;
	margin-bottom: 5px
}

.card-id {
	font-size: 11.5px;
	color: #b08060;
	margin-bottom: 6px
}

.card-career {
	display: inline-block;
	font-size: 11px;
	padding: 2px 8px;
	border-radius: 20px;
	background: #f5ede3;
	color: #8b4513
}

/* ══════ 파이프라인 히스토리 드롭존 ══════ */
.history-section {
	margin-top: 32px;
	padding-top: 28px;
	border-top: 2px dashed #e0d0c0
}

.history-header {
	margin-bottom: 20px
}

.history-icon {
	font-size: 20px;
	margin-bottom: 4px
}

.history-title {
	font-size: 18px;
	font-weight: 700;
	color: #3d1c02;
	margin: 0 0 6px
}

.history-desc {
	font-size: 13px;
	color: #a08060;
	margin: 0
}

.history-zones {
	display: flex;
	gap: 20px
}

.history-zone {
	flex: 1;
	border-radius: 16px;
	padding: 0;
	border: 2px dashed transparent;
	transition: border-color .2s, background .2s
}

.zone-passed {
	background: #f0faf0;
	border-color: #a3d9a5
}

.zone-rejected {
	background: #fef2f2;
	border-color: #f5a5a5
}

.zone-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 14px 18px;
	border-bottom: 1.5px solid rgba(0, 0, 0, .06)
}

.zone-label {
	font-size: 15px;
	font-weight: 700
}

.passed-label {
	color: #166534
}

.rejected-label {
	color: #991b1b
}

.zone-count {
	min-width: 24px;
	height: 24px;
	padding: 0 7px;
	border-radius: 20px;
	font-size: 12px;
	font-weight: 700;
	display: flex;
	align-items: center;
	justify-content: center
}

.zone-passed .zone-count {
	background: #dcfce7;
	color: #166534
}

.zone-rejected .zone-count {
	background: #fee2e2;
	color: #991b1b
}

.zone-body {
	padding: 12px;
	min-height: 120px;
	transition: background .2s
}

.zone-body.drag-over {
	background: rgba(0, 0, 0, .04)
}

.zone-empty {
	text-align: center;
	padding: 36px 10px;
	font-size: 12.5px;
	color: #b0a090;
	font-style: italic
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
	java.time.LocalDate today = java.time.LocalDate.now();
	java.time.format.DateTimeFormatter dtf = java.time.format.DateTimeFormatter.ofPattern("yyyy년 M월 d일 (E)",
			java.util.Locale.KOREAN);
	String dateStr = today.format(dtf);
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
			<li><a href="/pipeline/list" class="active"><span
					class="ico">📋</span>파이프라인</a></li>
			<li><a href="/pipeline/history"><span class="ico">📜</span>파이프라인
					히스토리</a></li>
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
		<div class="top-bar">
			<div>
				<div class="page-title">📋 채용 파이프라인 실시간 제어</div>
			</div>
			<div class="top-date"><%=dateStr%></div>
		</div>
		<div class="page-sub">지원자 카드를 드래그하여 전형 단계를 직관적으로 변경할 수 있습니다.</div>

		<!-- ════════ 칸반 보드 ════════ -->
		<div class="kanban">
			<!-- 서류접수 -->
			<div class="column">
				<div class="col-header">
					<span class="col-title">서류접수</span> <span
						class="col-count cnt-received" id="cnt-RECEIVED">0</span>
				</div>
				<div class="col-body" id="col-RECEIVED"
					ondragover="allowDrop(event)" ondrop="drop(event,'RECEIVED')">
					<c:forEach var="a" items="${list}">
						<c:if test="${a.stage=='RECEIVED'}">
							<div class="app-card" draggable="true"
								id="card-${a.applicationId}"
								ondragstart="dragStart(event,${a.applicationId})">
								<div class="card-name">${a.applicantName}</div>
								<div class="card-id">지원번호: ${a.applicationId}</div>
								<span class="card-career"><c:choose>
										<c:when test="${a.careerYear==0}">신입</c:when>
										<c:otherwise>경력 ${a.careerYear}년</c:otherwise>
									</c:choose></span>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>

			<!-- 서류합격 -->
			<div class="column">
				<div class="col-header">
					<span class="col-title">서류합격</span> <span
						class="col-count cnt-docpass" id="cnt-DOC_PASS">0</span>
				</div>
				<div class="col-body" id="col-DOC_PASS"
					ondragover="allowDrop(event)" ondrop="drop(event,'DOC_PASS')">
					<c:forEach var="a" items="${list}">
						<c:if test="${a.stage=='DOC_PASS'}">
							<div class="app-card" draggable="true"
								id="card-${a.applicationId}"
								ondragstart="dragStart(event,${a.applicationId})">
								<div class="card-name">${a.applicantName}</div>
								<div class="card-id">지원번호: ${a.applicationId}</div>
								<span class="card-career"><c:choose>
										<c:when test="${a.careerYear==0}">신입</c:when>
										<c:otherwise>경력 ${a.careerYear}년</c:otherwise>
									</c:choose></span>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>

			<!-- 면접진행 -->
			<div class="column">
				<div class="col-header">
					<span class="col-title">면접진행</span> <span
						class="col-count cnt-interview" id="cnt-INTERVIEW1">0</span>
				</div>
				<div class="col-body" id="col-INTERVIEW1"
					ondragover="allowDrop(event)" ondrop="drop(event,'INTERVIEW1')">
					<c:forEach var="a" items="${list}">
						<c:if test="${a.stage=='INTERVIEW1' || a.stage=='INTERVIEW2'}">
							<div class="app-card" draggable="true"
								id="card-${a.applicationId}"
								ondragstart="dragStart(event,${a.applicationId})">
								<div class="card-name">${a.applicantName}</div>
								<div class="card-id">지원번호: ${a.applicationId}</div>
								<span class="card-career"><c:choose>
										<c:when test="${a.careerYear==0}">신입</c:when>
										<c:otherwise>경력 ${a.careerYear}년</c:otherwise>
									</c:choose></span>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</div>
		<!-- /kanban -->

		<!-- ════════════ 히스토리 드롭존 ════════════ -->
		<div class="history-section">
			<div class="history-header">
				<div class="history-icon">📋</div>
				<h2 class="history-title">파이프라인 히스토리</h2>
				<p class="history-desc">최종 결과가 확정된 지원자를 아래 영역으로 드래그하세요.</p>
			</div>
			<div class="history-zones">
				<!-- 합격 드롭존 -->
				<div class="history-zone zone-passed">
					<div class="zone-header">
						<span class="zone-label passed-label">✓ 합격</span> <span
							class="zone-count" id="cnt-passed">0</span>
					</div>
					<div class="zone-body" id="zone-PASSED"
						ondragover="allowDrop(event)" ondrop="drop(event,'PASSED')">
						<div class="zone-empty" id="empty-PASSED">합격자를 이곳에 드래그하세요</div>
					</div>
				</div>
				<!-- 불합격 드롭존 -->
				<div class="history-zone zone-rejected">
					<div class="zone-header">
						<span class="zone-label rejected-label">✗ 불합격</span> <span
							class="zone-count" id="cnt-rejected">0</span>
					</div>
					<div class="zone-body" id="zone-REJECTED"
						ondragover="allowDrop(event)" ondrop="drop(event,'REJECTED')">
						<div class="zone-empty" id="empty-REJECTED">불합격자를 이곳에 드래그하세요</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /history-section -->
	</main>

	<script>
var draggingId = null;

function dragStart(e, appId) {
  draggingId = appId;
  e.dataTransfer.setData('text/plain', appId);
  e.dataTransfer.effectAllowed = 'move';
  document.getElementById('card-' + appId).classList.add('dragging');
}

function allowDrop(e) {
  e.preventDefault();
  e.dataTransfer.dropEffect = 'move';
  e.currentTarget.classList.add('drag-over');
}

function drop(e, newStage) {
  e.preventDefault();
  e.currentTarget.classList.remove('drag-over');
  if (!draggingId) return;

  var rejectReason = '';
  if (newStage === 'REJECTED') {
    rejectReason = prompt('불합격 사유를 입력하세요:');
    if (rejectReason === null) {
      document.getElementById('card-' + draggingId).classList.remove('dragging');
      draggingId = null;
      return;
    }
  }

  var card = document.getElementById('card-' + draggingId);

  if (newStage === 'PASSED' || newStage === 'REJECTED') {
    card.classList.remove('dragging');
    card.remove();
  } else {
    e.currentTarget.appendChild(card);
    card.classList.remove('dragging');
  }

  var bodyData = 'applicationId=' + draggingId + '&stage=' + newStage;
  if (rejectReason) {
    bodyData += '&rejectReason=' + encodeURIComponent(rejectReason);
  }

  fetch('/pipeline/move', {
    method: 'POST',
    headers: {'Content-Type': 'application/x-www-form-urlencoded'},
    body: bodyData
  })
  .then(function(r){ return r.json(); })
  .then(function(data){
    if (data.result === 'success') updateCounts();
  })
  .catch(function(){ alert('단계 변경에 실패했습니다.'); });

  draggingId = null;
}

document.querySelectorAll('.col-body, .zone-body').forEach(function(el){
  el.addEventListener('dragleave', function(){ this.classList.remove('drag-over'); });
});

function updateCounts(){
  ['RECEIVED','DOC_PASS','INTERVIEW1'].forEach(function(c){
    var colEl = document.getElementById('col-' + c);
    var cntEl = document.getElementById('cnt-' + c);
    if (colEl && cntEl) cntEl.textContent = colEl.querySelectorAll('.app-card').length;
  });
}

window.onload = function(){ updateCounts(); };
</script>
</body>
</html>