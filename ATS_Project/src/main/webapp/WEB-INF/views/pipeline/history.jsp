<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>ATS | 파이프라인 히스토리</title>
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

/* 사이드바 */
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

/* 메인 */
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

/* 요약 카드 */
.summary-row {
	display: flex;
	gap: 14px;
	margin-bottom: 20px
}

.summary-card {
	padding: 14px 22px;
	border-radius: 12px;
	font-size: 13px;
	font-weight: 600
}

.summary-total {
	background: #fff;
	border: 1px solid #e0d0c0;
	color: #3d1c02
}

.summary-passed {
	background: #f0faf0;
	border: 1px solid #a3d9a5;
	color: #166534
}

.summary-rejected {
	background: #fef2f2;
	border: 1px solid #f5a5a5;
	color: #991b1b
}

/* 툴바 */
.toolbar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 14px;
	gap: 12px;
	flex-wrap: wrap
}

.toolbar-left {
	display: flex;
	gap: 8px;
	align-items: center;
	flex-wrap: wrap
}

.toolbar-right {
	display: flex;
	gap: 8px;
	align-items: center
}

/* 검색 */
.search-box {
	display: flex;
	align-items: center;
	background: #fff;
	border: 1.5px solid #e0d0c0;
	border-radius: 9px;
	padding: 0 12px;
	height: 36px;
	gap: 6px
}

.search-box input {
	border: none;
	outline: none;
	font-size: 13px;
	color: #3d1c02;
	width: 180px;
	background: transparent
}

.search-box input::placeholder {
	color: #c0a080
}

/* 필터 탭 */
.filter-tab {
	padding: 7px 16px;
	border-radius: 20px;
	font-size: 13px;
	font-weight: 500;
	cursor: pointer;
	border: 1.5px solid #e0d0c0;
	background: #fff;
	color: #8b6040;
	transition: all .2s
}

.filter-tab:hover {
	border-color: #d4a017
}

.filter-tab.active-all {
	background: #3d1c02;
	color: #fff;
	border-color: #3d1c02
}

.filter-tab.active-passed {
	background: #166534;
	color: #fff;
	border-color: #166534
}

.filter-tab.active-rejected {
	background: #991b1b;
	color: #fff;
	border-color: #991b1b
}

/* 정렬 */
.sort-select {
	height: 36px;
	border: 1.5px solid #e0d0c0;
	border-radius: 9px;
	padding: 0 10px;
	font-size: 13px;
	color: #3d1c02;
	background: #fff;
	cursor: pointer;
	outline: none
}

/* 테이블 */
.tbl-wrap {
	background: #fff;
	border-radius: 14px;
	border: 1px solid #f0e0cc;
	overflow: hidden
}

.tbl {
	width: 100%;
	border-collapse: collapse
}

.tbl thead {
	background: #faf5ef
}

.tbl th {
	padding: 11px 14px;
	font-size: 11.5px;
	font-weight: 600;
	color: #8b6040;
	text-align: left;
	text-transform: uppercase;
	letter-spacing: .5px;
	border-bottom: 1.5px solid #f0e0cc;
	cursor: pointer;
	white-space: nowrap;
	user-select: none
}

.tbl th:hover {
	color: #3d1c02
}

.tbl th .sort-icon {
	margin-left: 4px;
	opacity: .4;
	font-size: 10px
}

.tbl th.sorted .sort-icon {
	opacity: 1
}

.tbl td {
	padding: 11px 14px;
	font-size: 13px;
	color: #3d1c02;
	border-bottom: 1px solid #f5ede3;
	vertical-align: middle
}

.tbl tbody tr:hover {
	background: #fdfaf6
}

.tbl tbody tr:last-child td {
	border-bottom: none
}

/* 뱃지 */
.badge {
	display: inline-block;
	padding: 3px 10px;
	border-radius: 20px;
	font-size: 11px;
	font-weight: 600
}

.badge-passed {
	background: #dcfce7;
	color: #166534
}

.badge-rejected {
	background: #fee2e2;
	color: #991b1b
}

.career-tag {
	display: inline-block;
	padding: 2px 8px;
	border-radius: 20px;
	font-size: 11px;
	background: #f5ede3;
	color: #8b4513
}

.reason-cell {
	font-size: 12px;
	color: #991b1b;
	max-width: 180px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap
}

/* 페이지네이션 */
.pagination {
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 6px;
	margin-top: 20px
}

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

/* 빈 상태 */
.empty-state {
	text-align: center;
	padding: 60px 20px;
	color: #b0a090;
	font-size: 14px
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
			<li><a href="/pipeline/history" class="active"><span
					class="ico">📜</span>파이프라인 히스토리</a></li>
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
				<div class="page-title">📜 파이프라인 히스토리</div>
			</div>
			<div class="top-date"><%=dateStr%></div>
		</div>
		<div class="page-sub">채용 프로세스에서 최종 결정된 지원자 이력입니다. 데이터는 영구 보관됩니다.</div>

		<!-- 요약 카드 -->
		<div class="summary-row">
			<div class="summary-card summary-total" id="sum-total">전체: 0명</div>
			<div class="summary-card summary-passed" id="sum-passed">합격: 0명</div>
			<div class="summary-card summary-rejected" id="sum-rejected">불합격:
				0명</div>
		</div>

		<!-- 툴바 -->
		<div class="toolbar">
			<div class="toolbar-left">
				<div class="filter-tab active-all" onclick="setFilter('ALL', this)">전체</div>
				<div class="filter-tab" onclick="setFilter('PASSED', this)">합격</div>
				<div class="filter-tab" onclick="setFilter('REJECTED', this)">불합격</div>
				<select class="sort-select" onchange="setSort(this.value)">
					<option value="decided_desc">확정일 최신순</option>
					<option value="decided_asc">확정일 오래된순</option>
					<option value="applied_desc">지원일 최신순</option>
					<option value="applied_asc">지원일 오래된순</option>
					<option value="name_asc">이름 오름차순</option>
					<option value="name_desc">이름 내림차순</option>
				</select>
			</div>
			<div class="toolbar-right">
				<div class="search-box">
					<span>🔍</span> <input type="text" id="searchInput"
						placeholder="이름, 공고, 이메일 검색" oninput="applyAll()">
				</div>
			</div>
		</div>

		<!-- 테이블 -->
		<div class="tbl-wrap">
			<c:choose>
				<c:when test="${empty historyList}">
					<div class="empty-state">확정된 지원자가 없습니다.</div>
				</c:when>
				<c:otherwise>
					<table class="tbl" id="historyTable">
						<thead>
							<tr>
								<th style="width: 50px">번호</th>
								<th onclick="sortByCol('name')">지원자 <span class="sort-icon">↕</span></th>
								<th onclick="sortByCol('posting')">공고 <span
									class="sort-icon">↕</span></th>
								<th>이메일</th>
								<th onclick="sortByCol('career')">경력 <span
									class="sort-icon">↕</span></th>
								<th onclick="sortByCol('stage')">결과 <span class="sort-icon">↕</span></th>
								<th>불합격 사유</th>
								<th>탈락 단계</th>
								<th>지원 횟수</th>
								<th onclick="sortByCol('applied')">지원일 <span
									class="sort-icon">↕</span></th>
								<th onclick="sortByCol('decided')">확정 시간 <span
									class="sort-icon">↕</span></th>
							</tr>
						</thead>
						<tbody id="historyBody">
							<c:forEach var="h" items="${historyList}" varStatus="st">
								<tr data-stage="${h.stage}" data-name="${h.applicantName}"
									data-posting="${h.postingTitle}" data-email="${h.email}"
									data-career="${h.careerYear}" data-applied="${h.appliedAt}"
									data-decided="${h.decidedAt}" data-id="${h.applicationId}">
									<td class="row-num">${st.count}</td>
									<td style="font-weight: 600">${h.applicantName}</td>
									<td>${h.postingTitle}</td>
									<td>${h.email}</td>
									<td><c:choose>
											<c:when test="${h.careerYear == 0}">
												<span class="career-tag">신입</span>
											</c:when>
											<c:otherwise>
												<span class="career-tag">경력 ${h.careerYear}년</span>
											</c:otherwise>
										</c:choose></td>
									<td><c:choose>
											<c:when test="${h.stage == 'PASSED'}">
												<span class="badge badge-passed">합격</span>
											</c:when>
											<c:otherwise>
												<span class="badge badge-rejected">불합격</span>
											</c:otherwise>
										</c:choose></td>
									<td><c:choose>
											<c:when
												test="${h.stage == 'REJECTED' and not empty h.rejectReason}">
												<span class="reason-cell" title="${h.rejectReason}">${h.rejectReason}</span>
											</c:when>
											<c:otherwise>-</c:otherwise>
										</c:choose></td>
									<td><c:choose>
											<c:when
												test="${h.stage == 'REJECTED' and not empty h.failStage}">
												<c:choose>
													<c:when test="${h.failStage=='RECEIVED'}">서류접수</c:when>
													<c:when test="${h.failStage=='DOC_PASS'}">서류합격</c:when>
													<c:when test="${h.failStage=='INTERVIEW1'}">1차면접</c:when>
													<c:when test="${h.failStage=='INTERVIEW2'}">2차면접</c:when>
													<c:otherwise>${h.failStage}</c:otherwise>
												</c:choose>
											</c:when>
											<c:otherwise>-</c:otherwise>
										</c:choose></td>
									<td><span class="career-tag">${h.applyCount}회</span></td>
									<td>${h.appliedAt}</td>
									<td>${h.decidedAt}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:otherwise>
			</c:choose>
		</div>

		<!-- 페이지네이션 -->
		<div class="pagination" id="pagination"></div>
	</main>

	<script>
		var PAGE_SIZE = 10;
		var currentPage = 1;
		var currentFilter = 'ALL';
		var currentSort = 'decided_desc';
		var currentSearch = '';
		var sortAsc = {};

		var allRows = Array.from(document.querySelectorAll('#historyBody tr'));

		function setFilter(stage, el) {
			currentFilter = stage;
			currentPage = 1;
			document.querySelectorAll('.filter-tab').forEach(function(t) {
				t.className = 'filter-tab';
			});
			if (stage === 'ALL')
				el.classList.add('active-all');
			else if (stage === 'PASSED')
				el.classList.add('active-passed');
			else if (stage === 'REJECTED')
				el.classList.add('active-rejected');
			applyAll();
		}

		function setSort(val) {
			currentSort = val;
			currentPage = 1;
			applyAll();
		}

		function sortByCol(col) {
			sortAsc[col] = !sortAsc[col];
			var tbody = document.getElementById('historyBody');
			var rows = Array.from(tbody.querySelectorAll('tr'));
			rows.sort(function(a, b) {
				var va, vb;
				if (col === 'name') {
					va = a.dataset.name;
					vb = b.dataset.name;
				} else if (col === 'posting') {
					va = a.dataset.posting;
					vb = b.dataset.posting;
				} else if (col === 'career') {
					va = parseInt(a.dataset.career) || 0;
					vb = parseInt(b.dataset.career) || 0;
					return sortAsc[col] ? va - vb : vb - va;
				} else if (col === 'stage') {
					va = a.dataset.stage;
					vb = b.dataset.stage;
				} else if (col === 'applied') {
					va = a.dataset.applied;
					vb = b.dataset.applied;
				} else if (col === 'decided') {
					va = a.dataset.decided;
					vb = b.dataset.decided;
				}
				if (va < vb)
					return sortAsc[col] ? -1 : 1;
				if (va > vb)
					return sortAsc[col] ? 1 : -1;
				return 0;
			});
			rows.forEach(function(r) {
				tbody.appendChild(r);
			});
			allRows = Array.from(tbody.querySelectorAll('tr'));
			currentPage = 1;
			applyAll();
		}

		function applyAll() {
			currentSearch = document.getElementById('searchInput').value
					.toLowerCase();

			var filtered = allRows
					.filter(function(row) {
						if (currentFilter !== 'ALL'
								&& row.dataset.stage !== currentFilter)
							return false;
						if (currentSearch) {
							var text = (row.dataset.name + row.dataset.posting + row.dataset.email)
									.toLowerCase();
							if (text.indexOf(currentSearch) === -1)
								return false;
						}
						return true;
					});

			filtered.sort(function(a, b) {
				var va, vb;
				if (currentSort === 'decided_desc'
						|| currentSort === 'decided_asc') {
					va = a.dataset.decided;
					vb = b.dataset.decided;
				} else if (currentSort === 'applied_desc'
						|| currentSort === 'applied_asc') {
					va = a.dataset.applied;
					vb = b.dataset.applied;
				} else if (currentSort === 'name_asc'
						|| currentSort === 'name_desc') {
					va = a.dataset.name;
					vb = b.dataset.name;
				}
				var desc = currentSort.endsWith('_desc');
				if (va < vb)
					return desc ? 1 : -1;
				if (va > vb)
					return desc ? -1 : 1;
				return 0;
			});

			var total = filtered.length;
			var totalPages = Math.max(1, Math.ceil(total / PAGE_SIZE));
			if (currentPage > totalPages)
				currentPage = totalPages;

			var start = (currentPage - 1) * PAGE_SIZE;
			var end = start + PAGE_SIZE;

			allRows.forEach(function(r) {
				r.style.display = 'none';
			});

			var pageRows = filtered.slice(start, end);
			pageRows.forEach(function(r, i) {
				r.style.display = '';
				r.querySelector('.row-num').textContent = start + i + 1;
			});

			renderPagination(totalPages);
			updateSummary(filtered);
		}

		function renderPagination(totalPages) {
			var pg = document.getElementById('pagination');
			pg.innerHTML = '';

			var prev = document.createElement('button');
			prev.className = 'page-btn';
			prev.textContent = '‹';
			prev.disabled = currentPage === 1;
			prev.onclick = function() {
				currentPage--;
				applyAll();
			};
			pg.appendChild(prev);

			var start = Math.max(1, currentPage - 2);
			var end = Math.min(totalPages, start + 4);
			if (end - start < 4)
				start = Math.max(1, end - 4);

			for (var i = start; i <= end; i++) {
				(function(p) {
					var btn = document.createElement('button');
					btn.className = 'page-btn'
							+ (p === currentPage ? ' active' : '');
					btn.textContent = p;
					btn.onclick = function() {
						currentPage = p;
						applyAll();
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
				applyAll();
			};
			pg.appendChild(next);
		}

		function updateSummary(filtered) {
			var passed = filtered.filter(function(r) {
				return r.dataset.stage === 'PASSED';
			}).length;
			var rejected = filtered.filter(function(r) {
				return r.dataset.stage === 'REJECTED';
			}).length;
			document.getElementById('sum-total').textContent = '전체: '
					+ filtered.length + '명';
			document.getElementById('sum-passed').textContent = '합격: ' + passed
					+ '명';
			document.getElementById('sum-rejected').textContent = '불합격: '
					+ rejected + '명';
		}

		window.onload = function() {
			applyAll();
		};
	</script>
</body>
</html>