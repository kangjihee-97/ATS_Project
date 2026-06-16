<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>ATS | 대시보드</title>
<script
	src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>
<style>
.s-PASSED {
	background: #dcfce7;
	color: #166534
}

.s-REJECTED {
	background: #fee2e2;
	color: #991b1b
}

@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap')
	;

@
keyframes spin {
	from {transform: rotate(0deg)
}

to {
	transform: rotate(360deg)
}

}
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
	z-index: 100;
	overflow-y: auto
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

.main {
	margin-left: 230px;
	flex: 1;
	padding: 32px
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
	margin-left: 4px
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

/* ── 핵심: mid-grid 2컬럼 유지 ── */
.mid-grid {
	display: grid;
	grid-template-columns: 1.6fr 1fr;
	gap: 20px;
	margin-bottom: 20px
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

.pipeline {
	display: flex;
	gap: 0;
	margin-bottom: 6px
}

.pipe-step {
	flex: 1;
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 8px
}

.pipe-bar-wrap {
	width: 100%;
	display: flex;
	align-items: flex-end;
	justify-content: center;
	height: 60px
}

.pipe-bar {
	width: 70%;
	border-radius: 6px 6px 0 0;
	min-height: 6px
}

.pipe-num {
	font-size: 18px;
	font-weight: 700;
	color: #3d1c02
}

.pipe-label {
	font-size: 10.5px;
	color: #b08060;
	text-align: center
}

.pipe-arrow {
	display: flex;
	align-items: flex-end;
	justify-content: center;
	height: 60px;
	padding-bottom: 8px;
	font-size: 18px;
	color: #e0c8b0;
	flex-shrink: 0;
	width: 20px
}

.bot-grid {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 20px
}

.app-table {
	width: 100%;
	border-collapse: collapse
}

.app-table th {
	font-size: 11.5px;
	color: #b08060;
	font-weight: 500;
	padding: 8px 10px;
	border-bottom: 1.5px solid #f0e0cc;
	text-align: left
}

.app-table td {
	font-size: 12.5px;
	color: #3d1c02;
	padding: 10px;
	border-bottom: 1px solid #f5ede3;
	vertical-align: middle
}

.app-table tr:last-child td {
	border-bottom: none
}

.stage-badge {
	display: inline-block;
	padding: 3px 9px;
	border-radius: 20px;
	font-size: 10.5px;
	font-weight: 500
}

.s-RECEIVED {
	background: #dbeafe;
	color: #1e40af
}

.s-DOC_PASS {
	background: #ede9fe;
	color: #5b21b6
}

.s-INTERVIEW1 {
	background: #fef3c7;
	color: #92400e
}

.s-INTERVIEW2 {
	background: #fed7aa;
	color: #c2410c
}

.s-FINAL {
	background: #dcfce7;
	color: #166534
}

.s-FAIL {
	background: #fee2e2;
	color: #991b1b
}

.career-tag {
	font-size: 11px;
	color: #8b6040;
	background: #f5ede3;
	padding: 2px 8px;
	border-radius: 10px
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
			<li><a href="/dashboard" class="active"><span class="ico">🏠</span>대시보드</a></li>
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
		<div class="top-header">
			<div class="top-greeting">
				<h1>
					안녕하세요,
					<%=userName%>님 👋
				</h1>
				<p>오늘도 채용 관리를 시작해볼까요?</p>
			</div>
			<div class="top-date"><%=dateStr%></div>
		</div>

		<!-- KPI 카드 -->
		<div class="kpi-grid">
			<div class="kpi-card">
				<span class="kpi-icon">👥</span>
				<div class="kpi-label">전체 지원자</div>
				<div class="kpi-num">${totalCount}<span class="kpi-unit">명</span>
				</div>
				<span class="kpi-tag" style="background: #fdf0e8; color: #8b4513">이번
					채용 기준</span>
			</div>
			<div class="kpi-card">
				<span class="kpi-icon">📄</span>
				<div class="kpi-label">서류 접수</div>
				<div class="kpi-num">${receivedCount}<span class="kpi-unit">명</span>
				</div>
				<span class="kpi-tag" style="background: #fef3c7; color: #92400e">검토
					대기</span>
			</div>
			<div class="kpi-card">
				<span class="kpi-icon">🎙</span>
				<div class="kpi-label">면접 진행 중</div>
				<div class="kpi-num">${interviewCount}<span class="kpi-unit">명</span>
				</div>
				<span class="kpi-tag" style="background: #ede9fe; color: #5b21b6">오늘
					${todayInterview}건 예정</span>
			</div>
			<div class="kpi-card">
				<span class="kpi-icon">🏆</span>
				<div class="kpi-label">최종 합격</div>
				<div class="kpi-num">${finalCount}<span class="kpi-unit">명</span>
				</div>
				<span class="kpi-tag" style="background: #dcfce7; color: #166534">합격
					확정</span>
			</div>
		</div>

		<!-- ── mid-grid: 파이프라인(왼쪽) + AI 분석(오른쪽) ── -->
		<div class="mid-grid">

			<!-- 왼쪽: 채용 파이프라인 현황 -->
			<div class="card">
				<div class="card-head">
					<div class="card-title">📊 채용 파이프라인 현황</div>
					<div class="card-badge">단계별 인원</div>
				</div>
				<%
				int total = ((Integer) request.getAttribute("totalCount") == null) ? 1 : (Integer) request.getAttribute("totalCount");
				if (total == 0)
					total = 1;
				int rec = ((Integer) request.getAttribute("receivedCount") != null)
						? (Integer) request.getAttribute("receivedCount")
						: 0;
				int doc = ((Integer) request.getAttribute("docPassCount") != null) ? (Integer) request.getAttribute("docPassCount") : 0;
				int intv = ((Integer) request.getAttribute("interviewCount") != null)
						? (Integer) request.getAttribute("interviewCount")
						: 0;
				int fin = ((Integer) request.getAttribute("finalCount") != null) ? (Integer) request.getAttribute("finalCount") : 0;
				int fail = ((Integer) request.getAttribute("failCount") != null) ? (Integer) request.getAttribute("failCount") : 0;
				int maxH = 52;
				%>
				<div class="pipeline">
					<div class="pipe-step">
						<div class="pipe-bar-wrap">
							<div class="pipe-bar"
								style="height:<%=rec * maxH / total%>px;background:#2563eb"></div>
						</div>
						<div class="pipe-num">${receivedCount}</div>
						<div class="pipe-label">서류접수</div>
					</div>
					<div class="pipe-arrow">›</div>
					<div class="pipe-step">
						<div class="pipe-bar-wrap">
							<div class="pipe-bar"
								style="height:<%=doc * maxH / total%>px;background:#7c3aed"></div>
						</div>
						<div class="pipe-num">${docPassCount}</div>
						<div class="pipe-label">서류합격</div>
					</div>
					<div class="pipe-arrow">›</div>
					<div class="pipe-step">
						<div class="pipe-bar-wrap">
							<div class="pipe-bar"
								style="height:<%=intv * maxH / total%>px;background:#d97706"></div>
						</div>
						<div class="pipe-num">${interviewCount}</div>
						<div class="pipe-label">면접진행</div>
					</div>
					<div class="pipe-arrow">›</div>
					<div class="pipe-step">
						<div class="pipe-bar-wrap">
							<div class="pipe-bar"
								style="height:<%=fin * maxH / total%>px;background:#16a34a"></div>
						</div>
						<div class="pipe-num">${finalCount}</div>
						<div class="pipe-label">최종합격</div>
					</div>
					<div class="pipe-arrow">›</div>
					<div class="pipe-step">
						<div class="pipe-bar-wrap">
							<div class="pipe-bar"
								style="height:<%=fail * maxH / total%>px;background:#dc2626"></div>
						</div>
						<div class="pipe-num">${failCount}</div>
						<div class="pipe-label">불합격</div>
					</div>
				</div>
			</div>

			<!-- 오른쪽: AI 채용 분석 -->
			<div class="card" id="aiCard">
				<div class="card-head">
					<div class="card-title">🤖 AI 채용 분석</div>
					<div class="card-badge" id="aiBadge">Claude AI</div>
				</div>
				<!-- 초기 상태 -->
				<div id="aiDefault">
					<div style="text-align: center; padding: 16px 10px">
						<div style="font-size: 36px; margin-bottom: 10px">🧠</div>
						<div
							style="font-size: 13px; color: #8b6040; margin-bottom: 16px; line-height: 1.6">
							현재 채용 데이터를 AI가 분석하여<br>인사이트와 추천 행동을 제공합니다
						</div>
						<button onclick="runAiAnalysis()"
							style="width: 100%; padding: 11px; background: linear-gradient(135deg, #3d1c02, #8b4513); color: #fff; border: none; border-radius: 12px; font-size: 14px; font-weight: 600; cursor: pointer; font-family: 'Noto Sans KR', sans-serif">
							✨ AI 채용 분석 시작</button>
					</div>
				</div>
				<!-- 로딩 상태 -->
				<div id="aiLoading"
					style="display: none; text-align: center; padding: 30px 10px">
					<div
						style="font-size: 28px; animation: spin 1.5s linear infinite; display: inline-block">⚙️</div>
					<div style="font-size: 13px; color: #a07050; margin-top: 10px">AI가
						데이터를 분석 중입니다...</div>
					<div style="font-size: 11px; color: #c8a880; margin-top: 5px">약
						5~10초 소요됩니다</div>
				</div>
				<!-- 결과 상태 -->
				<div id="aiResult" style="display: none">
					<div id="aiText"
						style="font-size: 12.5px; color: #4a2800; line-height: 1.8; background: #fdf8f3; border-radius: 10px; padding: 12px 14px; border: 1px solid #f0e0cc; white-space: pre-wrap; max-height: 180px; overflow-y: auto"></div>
					<div style="display: flex; gap: 8px; margin-top: 10px">
						<button onclick="runAiAnalysis()"
							style="flex: 1; padding: 8px; background: #f5ede3; color: #8b4513; border: 1.5px solid #e8d5c0; border-radius: 9px; font-size: 12px; font-weight: 500; cursor: pointer; font-family: 'Noto Sans KR', sans-serif">🔄
							재분석</button>
						<button onclick="resetAi()"
							style="padding: 8px 14px; background: #fff; color: #b08060; border: 1.5px solid #f0e0cc; border-radius: 9px; font-size: 12px; cursor: pointer; font-family: 'Noto Sans KR', sans-serif">초기화</button>
					</div>
				</div>
				<!-- 에러 상태 -->
				<div id="aiError"
					style="display: none; text-align: center; padding: 16px 10px">
					<div
						style="font-size: 13px; color: #991b1b; background: #fee2e2; border-radius: 10px; padding: 10px; margin-bottom: 10px"
						id="aiErrorMsg"></div>
					<button onclick="runAiAnalysis()"
						style="padding: 8px 18px; background: #f5ede3; color: #8b4513; border: 1.5px solid #e8d5c0; border-radius: 9px; font-size: 12px; font-weight: 500; cursor: pointer; font-family: 'Noto Sans KR', sans-serif">다시
						시도</button>
				</div>
			</div>

		</div>
		<!-- /mid-grid -->

		<!-- bot-grid: 최근 지원자 + 월별 추이 -->
		<div class="bot-grid">
			<div class="card">
				<div class="card-head">
					<div class="card-title">🕐 최근 지원자</div>
					<div class="card-badge">최근 8명</div>
				</div>
				<table class="app-table">
					<thead>
						<tr>
							<th>지원자</th>
							<th>공고</th>
							<th>경력</th>
							<th>단계</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty recentList}">
								<tr>
									<td colspan="4"
										style="text-align: center; padding: 20px; color: #b08060">지원자가
										없습니다</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="ap" items="${recentList}">
									<tr>
										<td><strong>${ap.applicantName}</strong></td>
										<td style="color: #8b6040; font-size: 12px">${ap.postingTitle}</td>
										<td><span class="career-tag"><c:choose>
													<c:when test="${ap.careerYear==0}">신입</c:when>
													<c:otherwise>${ap.careerYear}년</c:otherwise>
												</c:choose></span></td>
										<td><span class="stage-badge s-${ap.stage}"><c:choose>
													<c:when test="${ap.stage=='RECEIVED'}">서류접수</c:when>
													<c:when test="${ap.stage=='DOC_PASS'}">서류합격</c:when>
													<c:when test="${ap.stage=='INTERVIEW1'}">1차면접</c:when>
													<c:when test="${ap.stage=='INTERVIEW2'}">2차면접</c:when>
													<c:when test="${ap.stage=='PASSED'}">최종합격</c:when>
													<c:when test="${ap.stage=='REJECTED'}">불합격</c:when>
												</c:choose></span></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			<div class="card">
				<div class="card-head">
					<div class="card-title">📈 월별 지원자 추이</div>
					<div class="card-badge">최근 6개월</div>
				</div>
				<canvas id="monthlyChart" height="200"></canvas>
			</div>
		</div>

	</main>

	<script>
/* ── 월별 차트 ── */
var monthlyData=[<c:forEach var="m" items="${monthlyStats}" varStatus="s">{month:'${m.month}',cnt:${m.cnt}}<c:if test="${!s.last}">,</c:if></c:forEach>];
var labels=monthlyData.map(function(d){return d.month;});
var data=monthlyData.map(function(d){return d.cnt;});
if(labels.length===0){labels=['데이터 없음'];data=[0];}
new Chart(document.getElementById('monthlyChart').getContext('2d'),{
  type:'bar',
  data:{labels:labels,datasets:[{label:'지원자 수',data:data,backgroundColor:'rgba(139,69,19,0.15)',borderColor:'rgba(139,69,19,0.7)',borderWidth:2,borderRadius:6}]},
  options:{responsive:true,plugins:{legend:{display:false}},scales:{y:{beginAtZero:true,ticks:{stepSize:1,color:'#b08060',font:{size:11}},grid:{color:'rgba(139,69,19,0.06)'}},x:{ticks:{color:'#b08060',font:{size:11}},grid:{display:false}}}}
});

/* ── AI 분석 ── */
function showAiState(state) {
  ['aiDefault','aiLoading','aiResult','aiError'].forEach(function(id){
    document.getElementById(id).style.display='none';
  });
  document.getElementById(state).style.display='block';
}
function runAiAnalysis() {
  showAiState('aiLoading');
  document.getElementById('aiBadge').textContent='분석 중...';
  var payload={
    total      : parseInt('${totalCount}'    )||0,
    received   : parseInt('${receivedCount}' )||0,
    interview  : parseInt('${interviewCount}')||0,
    finalCount : parseInt('${finalCount}'    )||0,
    fail       : parseInt('${failCount}'     )||0,
    openPostings: parseInt('${openPostings}' )||0
  };
  fetch('/ai/dashboard-report',{
    method:'POST',
    headers:{'Content-Type':'application/json'},
    body:JSON.stringify(payload)
  })
  .then(function(r){return r.json();})
  .then(function(res){
    if(res.error){
      document.getElementById('aiErrorMsg').textContent=res.error;
      showAiState('aiError');
      document.getElementById('aiBadge').textContent='오류';
    } else {
      document.getElementById('aiText').textContent=res.report;
      showAiState('aiResult');
      document.getElementById('aiBadge').textContent='분석 완료 ✓';
    }
  })
  .catch(function(){
    document.getElementById('aiErrorMsg').textContent='서버 연결에 실패했습니다.';
    showAiState('aiError');
  });
}
function resetAi(){
  showAiState('aiDefault');
  document.getElementById('aiBadge').textContent='Claude AI';
}
</script>
</body>
</html>