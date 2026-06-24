<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>ATS | 통계 리포트</title>
<script
	src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>
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
	gap: 10px;
	cursor: pointer
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

.main {
	margin-left: 230px;
	flex: 1;
	padding: 32px 32px 40px
}

.top-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 28px
}

.top-greeting h1 {
	font-size: 22px;
	font-weight: 700;
	color: #3d1c02
}

.top-greeting p {
	font-size: 13px;
	color: #a07050;
	margin-top: 4px
}

.top-date {
	background: #fff;
	padding: 8px 16px;
	border-radius: 10px;
	font-size: 12.5px;
	color: #8b6040;
	border: 1px solid #e8d5c0
}

.kpi-grid {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 16px;
	margin-bottom: 24px
}

.kpi-card {
	background: #fff;
	border-radius: 16px;
	padding: 20px 22px;
	border: 1px solid #f0e0cc;
	position: relative;
	overflow: hidden
}

.kpi-label {
	font-size: 12px;
	color: #b08060;
	margin-bottom: 10px;
	font-weight: 500
}

.kpi-num {
	font-size: 32px;
	font-weight: 700;
	color: #3d1c02;
	line-height: 1
}

.kpi-unit {
	font-size: 13px;
	color: #b08060;
	margin-left: 4px;
	font-weight: 400
}

.kpi-tag {
	display: inline-block;
	margin-top: 10px;
	padding: 3px 10px;
	border-radius: 20px;
	font-size: 11px;
	font-weight: 500
}

.kpi-icon {
	position: absolute;
	top: 18px;
	right: 18px;
	font-size: 22px;
	opacity: .6
}

.card {
	background: #fff;
	border-radius: 16px;
	padding: 22px;
	border: 1px solid #f0e0cc
}

.card-head {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 18px
}

.card-title {
	font-size: 14px;
	font-weight: 600;
	color: #3d1c02
}

.card-badge {
	font-size: 11px;
	padding: 3px 10px;
	border-radius: 20px;
	background: #f5ede3;
	color: #8b4513;
	font-weight: 500
}

.mid-grid {
	display: grid;
	grid-template-columns: 1.2fr 1fr;
	gap: 20px;
	margin-bottom: 20px
}

.bot-grid {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 20px;
	margin-bottom: 20px
}

.full-card {
	margin-bottom: 20px
}

/* 채용 소요 시간 */
.time-grid {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 14px;
	margin-top: 4px
}

.time-item {
	text-align: center;
	padding: 16px 10px;
	background: #fdf8f3;
	border-radius: 12px;
	border: 1px solid #f0e0cc
}

.time-num {
	font-size: 28px;
	font-weight: 700;
	color: #3d1c02;
	line-height: 1
}

.time-unit {
	font-size: 11px;
	color: #b08060;
	margin-top: 2px
}

.time-label {
	font-size: 11.5px;
	color: #8b6040;
	margin-top: 6px;
	font-weight: 500
}

/* 퍼널 */
.funnel-wrap {
	display: flex;
	flex-direction: column;
	gap: 10px;
	padding: 4px 0
}

.funnel-row {
	display: flex;
	align-items: center;
	gap: 12px
}

.funnel-label {
	font-size: 12.5px;
	color: #8b6040;
	width: 72px;
	flex-shrink: 0;
	text-align: right
}

.funnel-bar-bg {
	flex: 1;
	height: 32px;
	background: #f5ede3;
	border-radius: 8px;
	overflow: hidden;
	position: relative
}

.funnel-bar {
	height: 100%;
	border-radius: 8px;
	transition: width .6s ease;
	display: flex;
	align-items: center;
	padding-left: 10px
}

.funnel-bar span {
	font-size: 12px;
	font-weight: 600;
	color: #fff
}

.funnel-rate {
	font-size: 11.5px;
	color: #b08060;
	width: 48px;
	flex-shrink: 0;
	text-align: right
}

/* 불합격 사유 */
.reason-list {
	display: flex;
	flex-direction: column;
	gap: 8px
}

.reason-row {
	display: flex;
	align-items: center;
	gap: 10px
}

.reason-rank {
	width: 22px;
	height: 22px;
	border-radius: 50%;
	background: #f5ede3;
	color: #8b4513;
	font-size: 11px;
	font-weight: 700;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-shrink: 0
}

.reason-rank.top1 {
	background: #f0c040;
	color: #3d1c02
}

.reason-rank.top2 {
	background: #e0d0c0;
	color: #3d1c02
}

.reason-rank.top3 {
	background: #d4956a;
	color: #fff
}

.reason-text-wrap {
	flex: 1;
	min-width: 0
}

.reason-text {
	font-size: 13px;
	color: #3d1c02;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap
}

.reason-bar-bg {
	height: 6px;
	background: #f5ede3;
	border-radius: 4px;
	margin-top: 4px
}

.reason-bar {
	height: 100%;
	background: linear-gradient(90deg, #d4a017, #8b4513);
	border-radius: 4px;
	transition: width .6s ease
}

.reason-cnt {
	font-size: 12px;
	font-weight: 600;
	color: #8b4513;
	flex-shrink: 0
}

.empty-state {
	text-align: center;
	padding: 40px;
	color: #b0a090;
	font-size: 13px
}

/* AI 인사이트 */
.ai-card {
	background: linear-gradient(135deg, #fdf8f0, #fff8ee);
	border: 1px solid #f0d8b0
}

.ai-header {
	display: flex;
	align-items: center;
	gap: 10px
}

.ai-badge {
	background: linear-gradient(135deg, #8b4513, #5c2a0e);
	color: #fff;
	padding: 4px 12px;
	border-radius: 20px;
	font-size: 11px;
	font-weight: 600
}

.ai-content {
	font-size: 13.5px;
	line-height: 1.85;
	color: #3d1c02;
	min-height: 100px
}

.ai-loading {
	display: flex;
	align-items: center;
	gap: 8px;
	color: #a07050;
	font-size: 13px
}

.ai-dots span {
	animation: dot 1.2s infinite;
	opacity: 0
}

.ai-dots span:nth-child(2) {
	animation-delay: .2s
}

.ai-dots span:nth-child(3) {
	animation-delay: .4s
}

@
keyframes dot { 0%,100%{
	opacity: 0
}

50








%
{
opacity








:








1








}
}
.btn-ai-refresh {
	background: #f5ede3;
	border: 1px solid #e0c8a0;
	color: #8b4513;
	padding: 6px 14px;
	border-radius: 20px;
	font-size: 12px;
	font-weight: 600;
	cursor: pointer;
	font-family: 'Noto Sans KR', sans-serif;
	transition: all .2s
}

.btn-ai-refresh:hover {
	background: #ede0d0
}

.legend-row {
	display: flex;
	gap: 16px;
	margin-bottom: 12px
}

.legend-item {
	display: flex;
	align-items: center;
	gap: 5px;
	font-size: 12px;
	color: #8b6040
}

.legend-dot {
	width: 10px;
	height: 10px;
	border-radius: 3px
}

/* PDF 버튼 */
.btn-pdf {
	background: #3d1c02;
	color: #fff;
	border: none;
	padding: 8px 18px;
	border-radius: 10px;
	font-size: 12.5px;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 600;
	cursor: pointer;
	transition: all .2s;
}
.btn-pdf:hover {
	background: #5c2a0e;
}

/* 프린트/PDF 스타일 */
@media print {
	.sidebar { display: none !important; }
	.main { margin-left: 0 !important; padding: 20px !important; }
	.btn-pdf { display: none !important; }
	.btn-ai-refresh { display: none !important; }
	body { background: #fff !important; }
	.kpi-card, .card { break-inside: avoid; border: 1px solid #ddd !important; }
	.kpi-grid { grid-template-columns: repeat(4, 1fr) !important; }
	.mid-grid, .bot-grid { grid-template-columns: 1fr 1fr !important; }
	.top-date { border: 1px solid #ddd !important; }
	* { -webkit-print-color-adjust: exact !important; print-color-adjust: exact !important; }
}
</style>
</head>
<body>
	<%
	String userName = (String) session.getAttribute("userName");
	Boolean isMaster = Boolean.TRUE.equals(session.getAttribute("isMaster"));
	Boolean isAdmin = Boolean.TRUE.equals(session.getAttribute("isAdmin"));
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
			<li><a href="/pipeline/list"><span class="ico">📋</span>파이프라인</a></li>
			<li><a href="/pipeline/history"><span class="ico">📜</span>파이프라인
					히스토리</a></li>
			<li><a href="/schedule/list"><span class="ico">📅</span>면접
					일정</a></li>
			<li><a href="/eval/list"><span class="ico">📝</span>면접 평가서</a></li>
		</ul>
		<div class="sb-section">분석</div>
		<ul class="sb-menu">
			<li><a href="/stats" class="active"><span class="ico">📊</span>통계
					리포트</a></li>
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
			<div class="sb-user" onclick="location.href='/user/mypage'">
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
		<div class="top-header">
			<div class="top-greeting">
				<h1>통계 리포트 📊</h1>
				<p>지원자 현황과 채용 성과를 한눈에 확인합니다.</p>
			</div>
			<div style="display:flex; gap:10px; align-items:center;">
				<div class="top-date"><%=dateStr%></div>
				<button class="btn-pdf" onclick="window.print()">📄 PDF 저장</button>
			</div>
		</div>

		<!-- KPI -->
		<div class="kpi-grid">
			<div class="kpi-card">
				<span class="kpi-icon">📈</span>
				<div class="kpi-label">최종 합격률</div>
				<div class="kpi-num">${passRate.pass_rate}<span
						class="kpi-unit">%</span>
				</div>
				<span class="kpi-tag" style="background: #ede9fe; color: #5b21b6">전체
					대비 합격 비율</span>
			</div>
			<div class="kpi-card">
				<span class="kpi-icon">👥</span>
				<div class="kpi-label">전체 지원자</div>
				<div class="kpi-num">${passRate.total_count}<span
						class="kpi-unit">명</span>
				</div>
				<span class="kpi-tag" style="background: #fdf0e8; color: #8b4513">누적
					지원자</span>
			</div>
			<div class="kpi-card">
				<span class="kpi-icon">🏆</span>
				<div class="kpi-label">최종 합격자</div>
				<div class="kpi-num">${passRate.pass_count}<span
						class="kpi-unit">명</span>
				</div>
				<span class="kpi-tag" style="background: #dcfce7; color: #166534">합격
					확정</span>
			</div>
			<div class="kpi-card">
				<span class="kpi-icon">📢</span>
				<div class="kpi-label">진행 공고 수</div>
				<div class="kpi-num">
					<c:choose>
						<c:when test="${empty postingStats}">0</c:when>
						<c:otherwise>${postingStats.size()}</c:otherwise>
					</c:choose>
					<span class="kpi-unit">건</span>
				</div>
				<span class="kpi-tag" style="background: #fef3c7; color: #92400e">공고
					기준</span>
			</div>
		</div>

		<!-- 채용 소요 시간 -->
		<div class="card full-card">
			<div class="card-head">
				<div class="card-title">⏱ 채용 소요 시간</div>
				<div class="card-badge">지원 → 최종확정</div>
			</div>
			<div class="time-grid">
				<div class="time-item">
					<div class="time-num">
						<c:choose>
							<c:when
								test="${not empty timeToHire and timeToHire.avg_days != null}">${timeToHire.avg_days}</c:when>
							<c:otherwise>-</c:otherwise>
						</c:choose>
					</div>
					<div class="time-unit">일</div>
					<div class="time-label">평균 소요일</div>
				</div>
				<div class="time-item">
					<div class="time-num">
						<c:choose>
							<c:when
								test="${not empty timeToHire and timeToHire.min_days != null}">${timeToHire.min_days}</c:when>
							<c:otherwise>-</c:otherwise>
						</c:choose>
					</div>
					<div class="time-unit">일</div>
					<div class="time-label">최단 소요일</div>
				</div>
				<div class="time-item">
					<div class="time-num">
						<c:choose>
							<c:when
								test="${not empty timeToHire and timeToHire.max_days != null}">${timeToHire.max_days}</c:when>
							<c:otherwise>-</c:otherwise>
						</c:choose>
					</div>
					<div class="time-unit">일</div>
					<div class="time-label">최장 소요일</div>
				</div>
			</div>
		</div>

		<!-- 차트 중단 -->
		<div class="mid-grid">
			<div class="card">
				<div class="card-head">
					<div class="card-title">📊 단계별 지원자 분포</div>
					<div class="card-badge">도넛 차트</div>
				</div>
				<div style="height: 240px">
					<canvas id="stageChart"></canvas>
				</div>
			</div>
			<div class="card">
				<div class="card-head">
					<div class="card-title">📢 공고별 합격/불합격 현황</div>
					<div class="card-badge">누적 막대</div>
				</div>
				<div class="legend-row">
					<div class="legend-item">
						<div class="legend-dot" style="background: #22c55e"></div>
						합격
					</div>
					<div class="legend-item">
						<div class="legend-dot" style="background: #ef4444"></div>
						불합격
					</div>
					<div class="legend-item">
						<div class="legend-dot" style="background: #93c5fd"></div>
						진행중
					</div>
				</div>
				<div style="height: 210px">
					<canvas id="stackedChart"></canvas>
				</div>
			</div>
		</div>

		<!-- 퍼널 + 불합격 사유 -->
		<div class="bot-grid">

			<!-- 단계별 이탈률 퍼널 -->
			<div class="card">
				<div class="card-head">
					<div class="card-title">🔽 단계별 채용 이탈률 퍼널</div>
					<div class="card-badge">채용 병목 분석</div>
				</div>
				<div class="funnel-wrap" id="funnelWrap">
					<!-- JS로 렌더링 -->
				</div>
			</div>

			<!-- 불합격 사유 TOP 5 -->
			<div class="card">
				<div class="card-head">
					<div class="card-title">❌ 불합격 사유 TOP 5</div>
					<div class="card-badge">빈도 순</div>
				</div>
				<c:choose>
					<c:when test="${empty rejectReasonTop5}">
						<div class="empty-state">불합격 사유 데이터가 없습니다</div>
					</c:when>
					<c:otherwise>
						<div class="reason-list">
							<c:forEach var="r" items="${rejectReasonTop5}" varStatus="st">
								<div class="reason-row">
									<div
										class="reason-rank ${st.index==0?'top1':st.index==1?'top2':st.index==2?'top3':''}">${st.count}</div>
									<div class="reason-text-wrap">
										<div class="reason-text" title="${r.reject_reason}">${r.reject_reason}</div>
										<div class="reason-bar-bg">
											<div class="reason-bar" id="rbar-${st.index}"
												style="width: 0%"></div>
										</div>
									</div>
									<div class="reason-cnt">${r.cnt}건</div>
								</div>
							</c:forEach>
						</div>
					</c:otherwise>
				</c:choose>
			</div>

		</div>

		<!-- AI 인사이트 -->
		<div class="card ai-card full-card">
			<div class="card-head">
				<div class="ai-header">
					<div class="card-title">🤖 AI 채용 인사이트</div>
					<div class="ai-badge">Gemini AI</div>
				</div>
				<button class="btn-ai-refresh" onclick="loadAiInsight()">↻
					새로고침</button>
			</div>
			<div class="ai-content" id="aiInsight">
				<div class="ai-loading">
					<span>분석 중</span>
					<div class="ai-dots">
						<span>.</span><span>.</span><span>.</span>
					</div>
				</div>
			</div>
		</div>

	</main>

	<script>
/* ── 도넛 차트 ── */
var stageCodeLabels = [
  <c:forEach var="s" items="${stageStats}" varStatus="st">
    '${s.stage}'<c:if test="${!st.last}">,</c:if>
  </c:forEach>
];
var stageNameMap = {RECEIVED:'서류접수',DOC_PASS:'서류합격',INTERVIEW1:'1차면접',INTERVIEW2:'2차면접',FINAL:'최종합격',FAIL:'불합격',PASSED:'합격완료',REJECTED:'불합격처리'};
var stageLabels = stageCodeLabels.map(function(c){ return stageNameMap[c]||c; });
var stageData = [
  <c:forEach var="s" items="${stageStats}" varStatus="st">
    ${s.cnt}<c:if test="${!st.last}">,</c:if>
  </c:forEach>
];
new Chart(document.getElementById('stageChart').getContext('2d'), {
  type:'doughnut',
  data:{labels:stageLabels,datasets:[{data:stageData,backgroundColor:['#dbeafe','#ede9fe','#fef3c7','#fed7aa','#dcfce7','#fee2e2','#d1fae5','#fde68a'],borderColor:'#fff',borderWidth:2}]},
  options:{responsive:true,maintainAspectRatio:false,cutout:'62%',plugins:{legend:{position:'bottom',labels:{font:{size:11}}}}}
});

/* ── 공고별 스택 바 ── */
var pfLabels = [<c:forEach var="p" items="${postingPassFailStats}" varStatus="st">'${p.title}'<c:if test="${!st.last}">,</c:if></c:forEach>];
var pfPassed   = [<c:forEach var="p" items="${postingPassFailStats}" varStatus="st">${p.passed}<c:if test="${!st.last}">,</c:if></c:forEach>];
var pfRejected = [<c:forEach var="p" items="${postingPassFailStats}" varStatus="st">${p.rejected}<c:if test="${!st.last}">,</c:if></c:forEach>];
var pfTotal    = [<c:forEach var="p" items="${postingPassFailStats}" varStatus="st">${p.total}<c:if test="${!st.last}">,</c:if></c:forEach>];
var pfInProgress = pfTotal.map(function(t,i){ return Math.max(0, t - pfPassed[i] - pfRejected[i]); });
new Chart(document.getElementById('stackedChart').getContext('2d'), {
  type:'bar',
  data:{labels:pfLabels,datasets:[
    {label:'합격',data:pfPassed,backgroundColor:'rgba(34,197,94,.7)',borderRadius:4},
    {label:'불합격',data:pfRejected,backgroundColor:'rgba(239,68,68,.7)',borderRadius:4},
    {label:'진행중',data:pfInProgress,backgroundColor:'rgba(147,197,253,.7)',borderRadius:4}
  ]},
  options:{indexAxis:'y',responsive:true,maintainAspectRatio:false,plugins:{legend:{display:false}},scales:{x:{stacked:true,beginAtZero:true,ticks:{stepSize:1}},y:{stacked:true,grid:{display:false}}}}
});

/* ── 퍼널 렌더링 ── */
var funnelData = {
  received: ${not empty funnelStats ? funnelStats.received : 0},
  doc_pass: ${not empty funnelStats ? funnelStats.doc_pass : 0},
  interview: ${not empty funnelStats ? funnelStats.interview : 0},
  final_pass: ${not empty funnelStats ? funnelStats.final_pass : 0}
};
var funnelSteps = [
  {label:'서류접수', val:funnelData.received, color:'#93c5fd'},
  {label:'서류합격', val:funnelData.doc_pass,  color:'#c4b5fd'},
  {label:'면접진행', val:funnelData.interview, color:'#fde68a'},
  {label:'최종합격', val:funnelData.final_pass,color:'#86efac'}
];
var maxVal = funnelData.received || 1;
var funnelWrap = document.getElementById('funnelWrap');
funnelSteps.forEach(function(step, i){
  var pct = Math.round((step.val / maxVal) * 100);
  var rate = i === 0 ? '100%' : (funnelSteps[i-1].val > 0 ? Math.round(step.val / funnelSteps[i-1].val * 100) + '%' : '0%');
  var row = document.createElement('div');
  row.className = 'funnel-row';
  row.innerHTML =
    '<div class="funnel-label">' + step.label + '</div>' +
    '<div class="funnel-bar-bg">' +
      '<div class="funnel-bar" data-pct="' + pct + '" style="width:0%;background:' + step.color + '">' +
        '<span>' + step.val + '명</span>' +
      '</div>' +
    '</div>' +
    '<div class="funnel-rate">' + rate + '</div>';
  funnelWrap.appendChild(row);
});
// 애니메이션
setTimeout(function(){
  document.querySelectorAll('.funnel-bar').forEach(function(el){
    el.style.width = el.dataset.pct + '%';
  });
}, 100);

/* ── 불합격 사유 바 애니메이션 ── */
var reasonCounts = [
  <c:forEach var="r" items="${rejectReasonTop5}" varStatus="st">
    ${r.cnt}<c:if test="${!st.last}">,</c:if>
  </c:forEach>
];
var maxReason = reasonCounts.length > 0 ? Math.max.apply(null, reasonCounts) : 1;
setTimeout(function(){
  reasonCounts.forEach(function(cnt, i){
    var bar = document.getElementById('rbar-' + i);
    if (bar) bar.style.width = Math.round(cnt / maxReason * 100) + '%';
  });
}, 200);

/* ── Gemini AI 인사이트 ── */
var GEMINI_API_KEY = 'AQ.Ab8RN6KzZRuwIDGbt0mjxmE7buGPu5n9mNzjofu3LJel31sfnw';

function loadAiInsight() {
	  var el = document.getElementById('aiInsight');
	  el.innerHTML = '<div class="ai-loading"><span>분석 중</span><div class="ai-dots"><span>.</span><span>.</span><span>.</span></div></div>';

	  var funnelText = funnelSteps.map(function(s){ return s.label+'('+s.val+'명)'; }).join(' → ');
	  var reasonText = reasonCounts.length > 0
	    ? '불합격 사유 TOP: ' + [<c:forEach var="r" items="${rejectReasonTop5}" varStatus="st">'${r.reject_reason}(${r.cnt}건)'<c:if test="${!st.last}">,</c:if></c:forEach>].join(', ')
	    : '불합격 사유 데이터 없음';

	  var prompt = '당신은 HR 채용 데이터 분석 전문가입니다. 아래 채용 통계를 분석하여 핵심 인사이트 3~4개를 번호 목록으로 한국어로 작성하세요. 마크다운 없이 일반 텍스트로 작성하세요.\n\n' +
	    '전체 지원자: ${passRate.total_count}명\n' +
	    '최종 합격자: ${passRate.pass_count}명\n' +
	    '합격률: ${passRate.pass_rate}%\n' +
	    '평균 채용 소요일: ${timeToHire.avg_days}일\n' +
	    '채용 퍼널: ' + funnelText + '\n' +
	    reasonText;

	  fetch('/stats/aiInsight', {
	    method: 'POST',
	    headers: {'Content-Type': 'application/json'},
	    body: JSON.stringify({ prompt: prompt })
	  })
	  .then(function(r){ return r.json(); })
	  .then(function(data){
	    if (data.error) {
	      el.innerHTML = '<span style="color:#991b1b">' + data.error + '</span>';
	    } else {
	      el.innerHTML = data.report.replace(/\n/g, '<br>');
	    }
	  })
	  .catch(function(){
	    el.innerHTML = '<span style="color:#991b1b">AI 분석 중 오류가 발생했습니다.</span>';
	  });
	}

window.onload = function(){ 
	  document.getElementById('aiInsight').innerHTML = 
	    '<div style="text-align:center;padding:30px;color:#a07050;font-size:13px">↻ 새로고침 버튼을 눌러 AI 분석을 시작하세요</div>';
	};
</script>
</body>
</html>