<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>ATS | 지원자 목록</title>
<style>
.page-btn {
	width: 34px;
	height: 34px;
	border-radius: 8px;
	border: 1.5px solid #e0d0c0;
	background: #fff;
	font-size: 13px;
	color: #3d1c02;
	cursor: pointer;
	display: flex;
	align-items: center;
	justify-content: center;
	transition: all .2s
}

.page-btn:hover {
	border-color: #d4a017;
	color: #8b4513
}

.page-btn.active {
	background: #3d1c02;
	color: #fff;
	border-color: #3d1c02
}

.page-btn:disabled {
	opacity: .4;
	cursor: default
}

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

.btn-group {
	display: flex;
	gap: 10px
}

.btn-excel {
	padding: 10px 18px;
	background: #166534;
	color: #fff;
	border: none;
	border-radius: 10px;
	font-size: 13px;
	font-weight: 600;
	cursor: pointer;
	text-decoration: none;
	display: inline-flex;
	align-items: center;
	gap: 6px;
	font-family: 'Noto Sans KR', sans-serif
}

.btn-primary {
	padding: 10px 18px;
	background: linear-gradient(135deg, #6b3015, #8b4513);
	color: #fff;
	border: none;
	border-radius: 10px;
	font-size: 13px;
	font-weight: 600;
	cursor: pointer;
	text-decoration: none;
	display: inline-flex;
	align-items: center;
	gap: 6px;
	font-family: 'Noto Sans KR', sans-serif
}

/* ── 정렬 안내 ── */
.sort-info {
	display: flex;
	align-items: center;
	gap: 8px;
	margin-bottom: 12px;
	font-size: 12px;
	color: #a07050
}

.sort-badge {
	padding: 3px 10px;
	border-radius: 20px;
	background: #fdf0e8;
	color: #8b4513;
	font-weight: 500
}

/* ── 테이블 ── */
.table-wrap {
	background: #fff;
	border-radius: 16px;
	overflow: hidden;
	border: 1px solid #f0e0cc
}

.app-table {
	width: 100%;
	border-collapse: collapse
}

/* 정렬 가능한 헤더 */
.app-table th {
	font-size: 12px;
	color: #b08060;
	font-weight: 500;
	padding: 14px 16px;
	border-bottom: 1.5px solid #f0e0cc;
	text-align: left;
	background: #fdf8f3;
	white-space: nowrap;
}

.th-sort {
	cursor: pointer;
	user-select: none;
	transition: background .15s, color .15s;
}

.th-sort:hover {
	background: #f5ede3;
	color: #8b4513
}

.th-sort.active-sort {
	color: #8b4513;
	font-weight: 600
}

.sort-icon {
	display: inline-block;
	margin-left: 5px;
	font-size: 11px;
	opacity: .5;
	transition: opacity .15s
}

.th-sort.active-sort .sort-icon {
	opacity: 1
}

.app-table td {
	font-size: 13px;
	color: #3d1c02;
	padding: 13px 16px;
	border-bottom: 1px solid #f5ede3;
	vertical-align: middle
}

.app-table tr:last-child td {
	border-bottom: none
}

.app-table tr:hover td {
	background: #fdf8f3;
	cursor: pointer
}

.stage-badge {
	display: inline-block;
	padding: 3px 10px;
	border-radius: 20px;
	font-size: 11px;
	font-weight: 600
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

.s-FINAL, .s-PASSED {
	background: #dcfce7;
	color: #166534
}

.s-FAIL, .s-REJECTED {
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

.empty-state {
	text-align: center;
	padding: 60px;
	color: #b08060;
	font-size: 14px
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
		<div class="top-bar">
			<div>
				<div class="page-title">👥 지원자 목록</div>
				<div class="page-sub" id="countText">총 ${list.size()}명의 지원자가
					있습니다</div>
			</div>
			<div class="btn-group">
				<a href="#" class="btn-excel" id="excelBtn"
					onclick="downloadExcel(event)"> 📊 엑셀 다운로드 </a>
				<%
				if (isAdmin) {
				%>
				<a href="/application/write" class="btn-primary">＋ 지원서 등록</a>
				<%
				}
				%>
			</div>
		</div>

		<!-- 현재 정렬 상태 표시 -->
		<div class="sort-info" id="sortInfo" style="display: none">
			<span>현재 정렬:</span> <span class="sort-badge" id="sortBadge"></span> <span
				style="color: #c8a880; font-size: 11px">헤더를 클릭하면 정렬이 바뀝니다</span>
		</div>

		<div class="table-wrap">
			<c:choose>
				<c:when test="${empty list}">
					<div class="empty-state">📭 등록된 지원자가 없습니다</div>
				</c:when>
				<c:otherwise>
					<table class="app-table" id="appTable">
						<thead>
							<tr>
								<th class="th-sort" data-col="applicationId" data-type="number"
									onclick="sortTable(this)">번호 <span class="sort-icon"
									id="icon-applicationId">⇅</span>
								</th>
								<th class="th-sort" data-col="applicantName" data-type="string"
									onclick="sortTable(this)">지원자 <span class="sort-icon"
									id="icon-applicantName">⇅</span>
								</th>
								<th class="th-sort" data-col="postingTitle" data-type="string"
									onclick="sortTable(this)">공고 <span class="sort-icon"
									id="icon-postingTitle">⇅</span>
								</th>
								<th>이메일</th>
								<th class="th-sort" data-col="careerYear" data-type="number"
									onclick="sortTable(this)">경력 <span class="sort-icon"
									id="icon-careerYear">⇅</span>
								</th>
								<th class="th-sort" data-col="stage" data-type="string"
									onclick="sortTable(this)">단계 <span class="sort-icon"
									id="icon-stage">⇅</span>
								</th>
								<th class="th-sort" data-col="appliedAt" data-type="string"
									onclick="sortTable(this)">지원일 <span class="sort-icon"
									id="icon-appliedAt">⇅</span>
								</th>
							</tr>
						</thead>
						<tbody id="tableBody">
							<c:forEach var="a" items="${list}">
								<tr
									onclick="location.href='/application/detail/${a.applicationId}'"
									data-applicationId="${a.applicationId}"
									data-applicantName="${a.applicantName}"
									data-postingTitle="${a.postingTitle}" data-email="${a.email}"
									data-careerYear="${a.careerYear}" data-stage="${a.stage}"
									data-appliedAt="${a.appliedAt}">
									<td style="color: #b08060; font-size: 12px">${a.applicationId}</td>
									<td><strong>${a.applicantName}</strong></td>
									<td style="font-size: 12px; color: #8b6040">${a.postingTitle}</td>
									<td style="font-size: 12px; color: #8b6040">${a.email}</td>
									<td><span class="career-tag"> <c:choose>
												<c:when test="${a.careerYear==0}">신입</c:when>
												<c:otherwise>${a.careerYear}년</c:otherwise>
											</c:choose>
									</span></td>
									<td><span class="stage-badge s-${a.stage}"> <c:choose>
												<c:when test="${a.stage=='RECEIVED'}">서류접수</c:when>
												<c:when test="${a.stage=='DOC_PASS'}">서류합격</c:when>
												<c:when test="${a.stage=='INTERVIEW1'}">1차면접</c:when>
												<c:when test="${a.stage=='INTERVIEW2'}">2차면접</c:when>
												<c:when test="${a.stage=='FINAL' || a.stage=='PASSED'}">최종합격</c:when>
												<c:when test="${a.stage=='FAIL' || a.stage=='REJECTED'}">불합격</c:when>
											</c:choose>
									</span></td>
									<td style="font-size: 12px; color: #b08060">${a.appliedAt}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="pagination" id="app-pagination"
			style="display: flex; justify-content: center; gap: 6px; margin-top: 20px"></div>
	</main>

	<script>
		// ── 지원자 목록 페이지네이션 ──
		(function() {
			var PAGE_SIZE = 10;
			var currentPage = 1;
			var rows = Array.from(document.querySelectorAll('tbody tr'));
			var totalPages = Math.max(1, Math.ceil(rows.length / PAGE_SIZE));

			function render() {
				rows.forEach(function(r) {
					r.style.display = 'none';
				});
				var start = (currentPage - 1) * PAGE_SIZE;
				rows.slice(start, start + PAGE_SIZE).forEach(function(r) {
					r.style.display = '';
				});
				renderPg();
			}

			function renderPg() {
				var pg = document.getElementById('app-pagination');
				if (!pg)
					return;
				pg.innerHTML = '';

				var prev = document.createElement('button');
				prev.className = 'page-btn';
				prev.textContent = '‹';
				prev.disabled = currentPage === 1;
				prev.onclick = function() {
					currentPage--;
					render();
				};
				pg.appendChild(prev);

				for (var i = 1; i <= totalPages; i++) {
					(function(p) {
						var btn = document.createElement('button');
						btn.className = 'page-btn'
								+ (p === currentPage ? ' active' : '');
						btn.textContent = p;
						btn.onclick = function() {
							currentPage = p;
							render();
						};
						pg.appendChild(btn);
					})(i);
				}

				var next = document.createElement('button');
				next.className = 'page-btn';
				next.textContent = '›';
				next.disabled = currentPage === totalPages;
				next.onclick = function() {
					currentPage++;
					render();
				};
				pg.appendChild(next);
			}

			render();
		})();
		var currentSort = 'applicationId';
		var currentDir = 'desc';

		var colLabels = {
			applicationId : '번호',
			applicantName : '지원자명',
			postingTitle : '공고명',
			careerYear : '경력',
			stage : '단계',
			appliedAt : '지원일'
		};

		var stageOrder = {
			RECEIVED : 0,
			DOC_PASS : 1,
			INTERVIEW1 : 2,
			INTERVIEW2 : 3,
			FINAL : 4,
			FAIL : 5
		};

		function sortTable(th) {
			var col = th.getAttribute('data-col');
			var type = th.getAttribute('data-type');

			/* 방향 결정 */
			if (currentSort === col) {
				currentDir = (currentDir === 'asc') ? 'desc' : 'asc';
			} else {
				currentSort = col;
				currentDir = 'asc';
			}

			/* 아이콘 초기화 */
			document.querySelectorAll('.sort-icon').forEach(function(el) {
				el.textContent = '⇅';
			});
			document.querySelectorAll('.th-sort').forEach(function(el) {
				el.classList.remove('active-sort');
			});

			/* 현재 컬럼 아이콘 업데이트 */
			document.getElementById('icon-' + col).textContent = (currentDir === 'asc') ? '↑'
					: '↓';
			th.classList.add('active-sort');

			/* 행 가져오기 */
			var tbody = document.getElementById('tableBody');
			var rows = Array.from(tbody.querySelectorAll('tr'));

			rows.sort(function(a, b) {
				var va = a.getAttribute('data-' + col) || '';
				var vb = b.getAttribute('data-' + col) || '';

				var result;
				if (col === 'stage') {
					result = (stageOrder[va] || 0) - (stageOrder[vb] || 0);
				} else if (type === 'number') {
					result = Number(va) - Number(vb);
				} else {
					result = va.localeCompare(vb, 'ko');
				}
				return currentDir === 'asc' ? result : -result;
			});

			/* DOM 재배치 */
			rows.forEach(function(row) {
				tbody.appendChild(row);
			});

			/* 정렬 안내 업데이트 */
			var info = document.getElementById('sortInfo');
			info.style.display = 'flex';
			document.getElementById('sortBadge').textContent = colLabels[col]
					+ ' ' + (currentDir === 'asc' ? '오름차순 ↑' : '내림차순 ↓');
		}

		/* 엑셀 다운로드 — 현재 정렬 상태 반영 */
		function downloadExcel(e) {
			e.preventDefault();
			var url = '/application/excel?sort=' + currentSort + '&dir='
					+ currentDir;
			window.location.href = url;
		}
	</script>
</body>
</html>