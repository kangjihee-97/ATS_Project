<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>ATS | 면접 캘린더</title>
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.10/index.global.min.js"></script>
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
	padding: 30px;
	min-width: 0
}

.top-bar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 22px
}

.page-title {
	font-size: 20px;
	font-weight: 700;
	color: #3d1c02
}

.page-sub {
	font-size: 13px;
	color: #a07050;
	margin-top: 3px
}

/* 범례 */
.legend {
	display: flex;
	gap: 14px;
	align-items: center
}

.legend-item {
	display: flex;
	align-items: center;
	gap: 6px;
	font-size: 12.5px;
	color: #6b4025;
	font-weight: 500
}

.legend-dot {
	width: 12px;
	height: 12px;
	border-radius: 50%;
	flex-shrink: 0
}

/* 캘린더 카드 */
.cal-wrap {
	background: #fff;
	border-radius: 20px;
	padding: 28px;
	border: 1px solid #f0e0cc;
	box-shadow: 0 4px 20px rgba(139, 69, 19, .06);
}

/* FullCalendar 전체 커스텀 */
.fc {
	font-family: 'Noto Sans KR', sans-serif !important
}

.fc .fc-toolbar {
	margin-bottom: 20px !important
}

.fc .fc-toolbar-title {
	font-size: 20px !important;
	font-weight: 700 !important;
	color: #3d1c02 !important;
}

.fc .fc-button {
	background: #8b4513 !important;
	border-color: #8b4513 !important;
	font-family: 'Noto Sans KR', sans-serif !important;
	font-size: 13px !important;
	font-weight: 500 !important;
	padding: 7px 16px !important;
	border-radius: 8px !important;
	box-shadow: none !important;
}

.fc .fc-button:hover {
	background: #6b3015 !important;
	border-color: #6b3015 !important
}

.fc .fc-button-active {
	background: #5c2a0e !important;
	border-color: #5c2a0e !important
}

.fc .fc-button-group .fc-button {
	border-radius: 0 !important
}

.fc .fc-button-group .fc-button:first-child {
	border-radius: 8px 0 0 8px !important
}

.fc .fc-button-group .fc-button:last-child {
	border-radius: 0 8px 8px 0 !important
}

/* 요일 헤더 */
.fc .fc-col-header-cell {
	background: #fdf8f3 !important;
	padding: 12px 0 !important;
	border-color: #f0e0cc !important;
}

.fc .fc-col-header-cell-cushion {
	font-size: 13px !important;
	font-weight: 600 !important;
	color: #8b4513 !important;
	text-decoration: none !important;
}

/* 날짜 숫자 */
.fc .fc-daygrid-day-number {
	font-size: 13px !important;
	font-weight: 500 !important;
	color: #6b4025 !important;
	padding: 8px 10px !important;
	text-decoration: none !important;
}

.fc .fc-daygrid-day {
	border-color: #f5ede3 !important
}

.fc .fc-daygrid-day:hover {
	background: #fdf8f3 !important
}

.fc .fc-daygrid-day.fc-day-today {
	background: #fdf0e8 !important
}

.fc .fc-daygrid-day.fc-day-today .fc-daygrid-day-number {
	background: #8b4513 !important;
	color: #fff !important;
	border-radius: 50% !important;
	width: 28px!height:28px;
	display: flex !important;
	align-items: center !important;
	justify-content: center !important;
}

/* 이벤트 카드 */
.fc .fc-daygrid-event {
	border-radius: 6px !important;
	margin: 2px 4px !important;
	padding: 3px 8px !important;
	font-size: 12px !important;
	font-weight: 500 !important;
	border: none !important;
	box-shadow: 0 1px 4px rgba(0, 0, 0, .15) !important;
}

.fc .fc-event-title {
	font-size: 12px !important;
	overflow: hidden !important;
	text-overflow: ellipsis !important;
}

.fc .fc-event-time {
	font-size: 11px !important;
	opacity: .85 !important
}

.fc .fc-daygrid-more-link {
	font-size: 11px !important;
	color: #8b4513 !important;
	font-weight: 600 !important;
	padding: 2px 6px !important;
}

/* 주간/목록 뷰 */
.fc .fc-timegrid-slot {
	height: 48px !important
}

.fc .fc-timegrid-slot-label {
	font-size: 12px !important;
	color: #b08060 !important
}

.fc .fc-list-event:hover td {
	background: #fdf8f3 !important
}

.fc .fc-list-event-title a {
	color: #3d1c02 !important;
	text-decoration: none !important;
	font-weight: 500 !important
}

.fc .fc-list-day-cushion {
	background: #fdf8f3 !important
}

.fc .fc-list-day-text, .fc .fc-list-day-side-text {
	color: #8b4513 !important;
	font-weight: 600 !important;
}

/* 팝오버 */
.popover {
	display: none;
	position: fixed;
	z-index: 9999;
	background: #fff;
	border-radius: 16px;
	border: 1px solid #f0e0cc;
	box-shadow: 0 8px 32px rgba(139, 69, 19, .18);
	padding: 20px 22px;
	min-width: 240px;
	max-width: 300px;
}

.popover.show {
	display: block
}

.pop-close {
	position: absolute;
	top: 12px;
	right: 14px;
	background: none;
	border: none;
	font-size: 20px;
	cursor: pointer;
	color: #b08060;
	line-height: 1;
}

.pop-close:hover {
	color: #8b4513
}

.pop-title {
	font-size: 15px;
	font-weight: 700;
	color: #3d1c02;
	margin-bottom: 14px;
	padding-bottom: 10px;
	border-bottom: 1.5px solid #f5ede3;
	padding-right: 24px;
	line-height: 1.4;
}

.pop-row {
	display: flex;
	gap: 10px;
	margin-bottom: 9px;
	font-size: 13px;
	color: #6b4025;
	align-items: flex-start;
}

.pop-label {
	color: #b08060;
	min-width: 54px;
	font-size: 12px;
	padding-top: 1px
}

.pop-val {
	flex: 1;
	font-weight: 500
}

.pop-status {
	display: inline-block;
	padding: 3px 10px;
	border-radius: 20px;
	font-size: 11px;
	font-weight: 600;
}

.s-scheduled {
	background: #dbeafe;
	color: #1e40af
}

.s-done {
	background: #dcfce7;
	color: #166534
}

.s-cancelled {
	background: #f3f4f6;
	color: #6b7280
}

.pop-footer {
	margin-top: 14px;
	padding-top: 12px;
	border-top: 1px solid #f5ede3;
	display: flex;
	gap: 8px;
}

.pop-btn {
	flex: 1;
	padding: 8px;
	border-radius: 8px;
	font-size: 12px;
	font-weight: 600;
	text-align: center;
	text-decoration: none;
	font-family: 'Noto Sans KR', sans-serif;
	cursor: pointer;
	border: none;
}

.pop-btn-main {
	background: #8b4513;
	color: #fff
}

.pop-btn-sec {
	background: #f5ede3;
	color: #8b4513
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
			<li><a href="/calendar" class="active"><span class="ico">📆</span>캘린더</a></li>
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
				<div style="flex: 1; min-width: 0">
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
				<div class="page-title">📆 면접 캘린더</div>
				<div class="page-sub">면접 일정을 달력으로 확인하세요</div>
			</div>
			<div class="legend">
				<div class="legend-item">
					<div class="legend-dot" style="background: #2563eb"></div>
					예정
				</div>
				<div class="legend-item">
					<div class="legend-dot" style="background: #16a34a"></div>
					완료
				</div>
				<div class="legend-item">
					<div class="legend-dot" style="background: #9ca3af"></div>
					취소
				</div>
			</div>
		</div>

		<div class="cal-wrap">
			<div id="calendar"></div>
		</div>
	</main>

	<!-- 팝오버 -->
	<div class="popover" id="popover">
		<button class="pop-close" onclick="closePopover()">×</button>
		<div class="pop-title" id="popTitle"></div>
		<div class="pop-row">
			<span class="pop-label">면접관</span><span class="pop-val"
				id="popInterviewer"></span>
		</div>
		<div class="pop-row">
			<span class="pop-label">장소</span><span class="pop-val"
				id="popLocation"></span>
		</div>
		<div class="pop-row">
			<span class="pop-label">상태</span><span class="pop-val"><span
				class="pop-status" id="popStatus"></span></span>
		</div>
		<div class="pop-footer">
			<button onclick="closePopover()" class="pop-btn pop-btn-sec"
				style="width: 100%">닫기</button>
		</div>
	</div>

	<script>
		document
				.addEventListener(
						'DOMContentLoaded',
						function() {
							var cal = new FullCalendar.Calendar(
									document.getElementById('calendar'),
									{
										locale : 'ko',
										initialView : 'dayGridMonth',
										headerToolbar : {
											left : 'prev,next today',
											center : 'title',
											right : 'dayGridMonth,timeGridWeek,listWeek'
										},
										buttonText : {
											today : '오늘',
											month : '월',
											week : '주',
											list : '목록'
										},
										height : 'auto',
										dayMaxEvents : 3,
										eventDisplay : 'block',
										displayEventTime : true,
										eventTimeFormat : {
											hour : '2-digit',
											minute : '2-digit',
											hour12 : false
										},
										events : '/calendar/data',
										eventDidMount : function(info) {
											/* 툴팁 */
											info.el.title = info.event.title;
										},
										eventClick : function(info) {
											var p = info.event.extendedProps;
											var el = info.el
													.getBoundingClientRect();

											document.getElementById('popTitle').textContent = info.event.title;
											document
													.getElementById('popInterviewer').textContent = p.interviewer
													|| '-';
											document
													.getElementById('popLocation').textContent = p.location
													|| '-';

											var statusMap = {
												SCHEDULED : '예정',
												DONE : '완료',
												CANCELLED : '취소'
											};
											var classMap = {
												SCHEDULED : 's-scheduled',
												DONE : 's-done',
												CANCELLED : 's-cancelled'
											};
											var st = document
													.getElementById('popStatus');
											st.textContent = statusMap[p.status]
													|| p.status;
											st.className = 'pop-status '
													+ (classMap[p.status] || '');

											var pop = document
													.getElementById('popover');
											var top = Math.min(el.bottom + 8,
													window.innerHeight - 260);
											var left = Math.min(el.left,
													window.innerWidth - 310);
											pop.style.top = top + 'px';
											pop.style.left = left + 'px';
											pop.classList.add('show');
										},
										/* 날짜 셀 높이 확보 */
										dayCellDidMount : function(arg) {
											arg.el.style.minHeight = '100px';
										}
									});
							cal.render();

							/* 외부 클릭 시 팝오버 닫기 */
							document.addEventListener('click', function(e) {
								if (!e.target.closest('.fc-event')
										&& !e.target.closest('.popover'))
									closePopover();
							});
						});

		function closePopover() {
			document.getElementById('popover').classList.remove('show');
		}
	</script>
</body>
</html>